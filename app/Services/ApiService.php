<?php
namespace App\Services;

use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Http;

class ApiService {
    public function getPlayerElo(int $playerId) {
        $httpRequest = Http::get("https://data.aoe2companion.com/api/profiles/$playerId");

        if ($httpRequest->failed()) {
            dump($httpRequest->json());
            dump($httpRequest->status());
            throw new \Exception('Failed to fetch player elo data for player ' . $playerId);
        }
        $response = Collection::make($httpRequest->json()['leaderboards']);
        $unranked = $response->where('leaderboardId', 'unranked')->first();
        $oneVsOne = $response->where('leaderboardId', 'rm_1v1')->first();
        $team = $response->where('leaderboardId', 'rm_team')->first();
        return [
            'unranked' => $unranked['rating'] ?? 0,
            '1v1' => $oneVsOne['rating'] ?? 0,
            'team' => $team['rating'] ?? 0,
            'drops' => $unranked['drops'] ?? 0,
            'streak' => $unranked['streak'] ?? 0
        ];
    }

    public function getPlayerMetaData(int $playerId) {
        $httpRequest = Http::post("https://api.ageofempires.com/api/v2/AgeII/GetMPFull", [
            'profileId' => $playerId,
        ]);

        if ($httpRequest->failed()) {
            throw new \Exception('Failed to fetch player meta data');
        }
        return $httpRequest->json();
    }

    public function getMatch(int $playerId) {
        $httpRequest = Http::get("https://data.aoe2companion.com/api/matches?profile_ids=$playerId&page=1&language=en");

        if ($httpRequest->failed()) {
            throw new \Exception('Failed to fetch player match for player ' . $playerId);
        }
        $matches = Collection::make($httpRequest->json()['matches']);
        // filter only match contains "indo"
        $matches = $matches->filter(function ($match) {
            return strpos(strtolower($match['name']), 'indo') !== false;
        });

        // take 17 matches
        $matches = $matches->take(17);

        // count win and lose match from teams array
        // the teams contains player and won attribute, if the won true then calculated as win
        $win = 0;
        $lose = 0;
        foreach ($matches as $match) {
            // loop through teams
            foreach ($match['teams'] as $team) {
                // loop through players
                foreach ($team['players'] as $player) {
                    // if player id is same with player id from parameter
                    if ($player['profileId'] == $playerId) {
                        // if player won the match
                        if ($player['won']) {
                            $win++;
                        } else {
                            $lose++;
                        }
                    }
                }
            }
        }

        return [
            'win' => $win,
            'lose' => $lose
        ];
    }
}