<?php

namespace App\Console\Commands;

use App\Models\Player;
use App\Services\ApiService;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class SyncPlayerElo extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:sync-player-elo';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Sync player elo from API to database';

    /**
     * Execute the console command.
     */
    public function handle(ApiService $service)
    {
        $players = Player::where('status', '1')
            ->whereNotNull('aoe2net_id')
            // ->where('aoe2net_id', 2991308)
            ->get();
        $movement_point = 0.5;
        foreach ($players as $player) {
            try {
                $elo = $service->getPlayerElo($player->aoe2net_id);
                $match = $service->getMatch($player->aoe2net_id);
                // Update player elo
                $player->elo_unranked = $elo['unranked'];
                $player->elo_1v1 = $elo['1v1'];
                $player->elo_team = $elo['team'];
                $player->drops = $elo['drops'];
                $player->streak = $elo['streak'];
                $player->updated_at = now();
                $player->last_win_count = $match['win'];
                $player->last_lose_count = $match['lose'];
                $player->final_elo = ($match['lose'] * -$movement_point) + ($match['win'] * $movement_point) + $player->elo;
                if ($player->final_elo == 0) {
                    $player->final_elo = $player->elo;
                }
                $player->save();



                $this->info("Synced player elo and meta data for {$player->name}. new elo : ". $player->final_elo);
            } catch (\Exception $e) {
                $this->error("Failed to sync player elo for {$player->name}");
                $this->error($e->getMessage());
                Log::error($e);
            }

        }
    }
}
