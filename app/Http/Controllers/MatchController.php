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
        $players = Player::orderBy('elo', 'desc')->get()->toArray();
        
        /* fetch using guzzle to https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=200&country=id */
        $client = new Client();
        $res = $client->request('GET', 'https://legacy.aoe2companion.com/api/leaderboard?game=aoe2de&leaderboard_id=0&start=1&count=200&country=id');
        $res = json_decode($res->getBody()->getContents(), true);
        $unrankEloPlayers = $res['leaderboard'];
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
            $number = ($player['elo']*70)/100 + ($unrankEloPlayer['rating']-900)/700*30;
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
