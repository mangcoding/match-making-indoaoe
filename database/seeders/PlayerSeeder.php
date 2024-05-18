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
        $response = $httpClient->get('https://data.aoe2companion.com/api/leaderboards/unranked?leaderboard_id=unranked&page=1&profile_id=undefined&country=ID&language=en');
        $response = json_decode($response->getBody()->getContents());

        foreach($response->players as $player)
        {
            \App\Models\Player::create([
                'name' => $player->name,
                'aoe2net_id' => $player->profileId,
                'elo' => $player->rating,
            ]);
        }
    }
}
