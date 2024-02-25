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
}