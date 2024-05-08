<?php

namespace App\Console\Commands;

use App\Models\Player;
use App\Services\ApiService;
use Illuminate\Console\Command;

class SyncPlayerMeta extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:sync-player-meta';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Sync player meta from API to database';

    /**
     * Execute the console command.
     */
    public function handle(ApiService $service)
    {
        $players = Player::where('status', '1')
            ->whereNotNull('aoe2net_id')
            ->get();

        foreach ($players as $player) {
            try {
                $metaData = $service->getPlayerMetaData($player->aoe2net_id);
                $player->meta_data = $metaData;
                $player->avatar_url = $metaData['user']['avatarUrl'];
                $player->alias = $metaData['user']['userName'];
                $player->save();

                $this->info("Synced player meta data for {$player->name}");
            } catch (\Exception $e) {
                $this->error("Failed to sync player meta for {$player->name}");
                $this->error($e->getMessage());
            }

            sleep(1);

        }
    }
}
