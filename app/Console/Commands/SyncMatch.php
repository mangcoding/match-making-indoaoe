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
                $page = 1;
                $playerMatchs = collect([]);
                $elo = $apiService->getPlayerElo($player->aoe2net_id);
                $playerMatchs = $apiService->getMatch2($player->aoe2net_id, $page)->take(5);
                // Update player elo
                $player->elo_unranked = $elo['unranked'];
                $player->elo_1v1 = $elo['1v1'];
                $player->elo_team = $elo['team'];
                $player->drops = $elo['drops'];
                $player->streak = $player->streak;
                $player->updated_at = now();
                $player->save();

                // filter only match not contains AI
                // the filter must be check on teams -> players array
                $playerMatchs = $playerMatchs->filter(function ($match) {
                    $totalPlayer = 0;

                    foreach ($match['teams'] as $team) {
                        foreach ($team['players'] as $teamPlayer) {
                            if ($teamPlayer['profileId'] === -1) {
                                return false;
                            } else {
                                $totalPlayer++;
                            }
                        }
                    }

                    if ($totalPlayer <= 2) {
                        $this->info("Filtered out match due to insufficient players (total players: {$totalPlayer} match_id: {$match['matchId']})");
                        return false;
                    }

                    // Check match duration (must be greater than 15 minutes)
                    $matchDuration = isset($match['finished'])
                        ? (strtotime($match['finished']) - strtotime($match['started'])) / 60
                        : 0;

                    if ($matchDuration < 15) {
                        $this->info("Filtered out match due to insufficient duration (duration: {$matchDuration} minutes, match_id : {$match['matchId']})");
                        return false;
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
                }
            } catch (\Throwable $th) {
                Log::error($th);
                $this->error("Failed to sync match for {$player->name}");
            }
        }

        $players = Player::where('status', '1')
            ->whereNotNull('aoe2net_id')
            ->get();

        foreach ($players as $player) {
            $streak = 0;
            $win = 0;
            $lose = 0;
            $lastGame = null;

            $matches = DB::table('match_teams')
                ->join('game_matches', 'game_matches.match_id', '=', 'match_teams.match_id')
                ->where('match_teams.aoe2net_id', $player->aoe2net_id) // Filter berdasarkan aoe2net_id pemain di match_teams
                ->latest('game_matches.started_at') // Urutkan berdasarkan waktu pertandingan di game_matches
                ->limit(10)
                ->get(['match_teams.won', 'game_matches.match_id']);

            $matches = array_reverse($matches->toArray());

            foreach ($matches as $match) {
                if ($match->won) {
                    $lastGame == 'won' ? $streak++ : $streak = 1;
                    $lastGame = 'won';
                    $win++;
                } else {
                    $lastGame == 'lose' ? $streak-- : $streak = -1;
                    $lastGame = 'lose';
                    $lose++;
                }
            }

            $player->streak = $streak;
            $player->last_win_count = $win;
            $player->last_lose_count = $lose;
            $player->save();

            $this->info("Player: {$player->name} | Streak: {$streak}");
        }
    }
}
