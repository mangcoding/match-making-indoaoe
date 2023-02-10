<?php

namespace Database\Seeders;

use GuzzleHttp\Client;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PlayerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $httpClient = new Client();
        $response = $httpClient->get('https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=100&country=ID');
        $response = json_decode($response->getBody()->getContents());

        foreach($response->leaderboard as $player)
        {
            \App\Models\Player::create([
                'name' => $player->name,
                'aoe2net_id' => $player->profile_id,
                'elo' => 0
            ]);
        }
    }
}
