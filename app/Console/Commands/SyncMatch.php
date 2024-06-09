<?php

namespace App\Console\Commands;

use App\Models\GameMatch;
use App\Models\MatchTeam;
use App\Models\Player;
use App\Services\ApiService;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SyncMatch extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:sync-match';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(ApiService $apiService)
    {
        $players = Player::where('status', '1')
            ->whereNotNull('aoe2net_id')
            // ->where('aoe2net_id', 2776978)
            ->get();

        foreach ($players as $player) {
            try {
                DB::beginTransaction();
                $page = 1;
                $playerMatchs = collect([]);
                $elo = $apiService->getPlayerElo($player->aoe2net_id);
                $playerMatchs = $apiService->getMatch2($player->aoe2net_id, $page)->take(5);
                // Update player elo
                $player->elo_unranked = $elo['unranked'];
                $player->elo_1v1 = $elo['1v1'];
                $player->elo_team = $elo['team'];
                $player->drops = $elo['drops'];
                $player->streak = $elo['streak'];
                $player->updated_at = now();
                $player->save();

                // filter only match not contains AI
                // the filter must be check on teams -> players array
                $playerMatchs = $playerMatchs->filter(function ($match) {
                    foreach ($match['teams'] as $team) {
                        foreach ($team['players'] as $teamPlayer) {
                            if ($teamPlayer['profileId'] === -1) {
                                return false;
                            }
                        }
                    }
                    return true;
                });


                // save player match
                foreach ($playerMatchs as $playerMatch) {

                    if (GameMatch::where('match_id', $playerMatch['matchId'])->exists()) {
                        $this->info("Match already exists for {$player->name} with match id {$playerMatch['matchId']}");
                        continue;
                    }
                    $match = new GameMatch;
                    $match->match_id = $playerMatch['matchId'];
                    $match->started_at = $playerMatch['started'];
                    $match->finished_at = $playerMatch['finished'] ?? now();
                    $match->name = $playerMatch['name'];
                    $match->map = $playerMatch['map'];
                    $match->server = $playerMatch['server'];
                    $match->save();

                    // store the match teams and players
                    foreach ($playerMatch['teams'] as $team) {
                        foreach ($team['players'] as $teamPlayer) {
                            if (
                                MatchTeam::where('match_id', $playerMatch['matchId'])
                                    ->where('aoe2net_id', $teamPlayer['profileId'])
                                    ->exists()
                            ) {
                                $this->info("Match team already exists for {$player->name} with match id {$playerMatch['matchId']}");
                                continue;
                            }

                            if ($teamPlayer['team'] === null) {
                                Log::debug(json_encode($playerMatch));
                                throw new \Exception("Team is null for player {$teamPlayer['profileId']} in match {$playerMatch['matchId']}");
                            }

                            if ($teamPlayer['won'] === null) {
                                Log::debug(json_encode($teamPlayer));
                                throw new \Exception("Won is null for player {$teamPlayer['profileId']} in match {$playerMatch['matchId']}");
                            }
                            MatchTeam::create([
                                'match_id' => $playerMatch['matchId'],
                                'aoe2net_id' => $teamPlayer['profileId'],
                                'team_id' => $teamPlayer['team'],
                                'won' => $teamPlayer['won'],
                                'civ' => $teamPlayer['civ'],
                            ]);

                        }
                    }

                    $this->info("Synced match for {$player->name} with match id {$playerMatch['matchId']}");
                    DB::commit();
                }
            } catch (\Throwable $th) {
                Log::error($th);
                $this->error("Failed to sync match for {$player->name}");
                DB::rollBack();
            }
        }
    }
}
