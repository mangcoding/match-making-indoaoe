<?php
namespace App\Http\Controllers;

use App\Models\Player;
use Inertia\Inertia;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use GuzzleHttp\Client;

class MatchController extends Controller
{
    public function index()
    {
        $players = Player::where("status","1")->orderBy('elo', 'desc')->get()->toArray();
        // print_r($players);die();
        
        /* fetch using guzzle to https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=200&country=id */
        $client = new Client();
        $res = $client->request('GET', 'https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=1000&country=id');
        $res = json_decode($res->getBody()->getContents(), true);

        $res2 = $client->request('GET', 'https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=500&country=jp');
        $res2 = json_decode($res2->getBody()->getContents(), true);

        $res3 = $client->request('GET', 'https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=100&country=sg');
        $res3 = json_decode($res3->getBody()->getContents(), true);

        $res4 = $client->request('GET', 'https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1000&count=1500&country=us');
        $res4 = json_decode($res4->getBody()->getContents(), true);

        $unrankEloPlayers = array_merge($res['leaderboard'], $res2['leaderboard']);
        $unrankEloPlayers = array_merge($unrankEloPlayers, $res3['leaderboard']);
        $unrankEloPlayers = array_merge($unrankEloPlayers, $res4['leaderboard']);
        $players = array_map(function($player) use ($unrankEloPlayers) {
            $player['oriElo'] = $player['elo'];
            $player['newElo'] = round($player['elo'] / 5) * 5;
            $player['unrankRate'] = 0;

            $unrankEloPlayer = array_filter($unrankEloPlayers, function($unrankEloPlayer) use ($player) {
                return $unrankEloPlayer['profile_id'] == $player['aoe2net_id'];
            });
            if (count($unrankEloPlayer) == 0) return $player;
            $unrankEloPlayer = array_values($unrankEloPlayer);
            $unrankEloPlayer = $unrankEloPlayer[0];
            if ($player['elo'] >= 45) {
                $eloTemp = ($unrankEloPlayer['rating']-900)/700*30;
                $eloTemp = $eloTemp > 30 ? 30 : $eloTemp;
                $number = ($player['elo']*70)/100 + $eloTemp;
            }else{
                $number = $player['elo'];
            }
            $player['oriElo'] = number_format((float)$number, 1, '.', '');
            $player['newElo'] = round($player['oriElo'] / 5) * 5;
            $player['unrankRate'] = $unrankEloPlayer['rating'];
            return $player;
        }, $players);
        return Inertia::render('NewMatch', [
            'players' => $players
        ]);
    }

    public function seed()
    {
        if (Player::count() > 0) return;

        Artisan::call('db:seed', [
            '--class' => 'PlayerSeeder'
        ]);
    }

    public function migrate()
    {
        Artisan::call('migrate');
    }
}
