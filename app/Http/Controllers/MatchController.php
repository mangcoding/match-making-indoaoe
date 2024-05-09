<?php
namespace App\Http\Controllers;

use App\Models\Player;
use Inertia\Inertia;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Cache;

class MatchController extends Controller
{
    public function index()
    {
        // Cache players in 1 hour
        $players = Player::where("status", "1")
            ->whereNotNull('aoe2net_id')
            ->orderBy('elo', 'desc')
            ->get()->toArray();


        $players = array_map(function ($player) use ($players) {
            // get player rank based order 
            $player['rank'] = array_search($player['id'], array_column($players, 'id')) + 1;
            $player['oriElo'] = $player['elo'];
            $player['newElo'] = round($player['elo'] / 5) * 5;
            $player['unrankRate'] = 0;

            $unrankEloPlayer = $player['elo_unranked'];
            // hanya player yang memiliki unrank yang dihitung
            if ($unrankEloPlayer) {
                if ($player['elo'] >= 45) {
                    $eloTemp = ($unrankEloPlayer - 900) / 700 * 30;
                    $eloTemp = $eloTemp > 30 ? 30 : $eloTemp;
                    $number = ($player['elo'] * 70) / 100 + $eloTemp;
                } else {
                    $number = $player['elo'];
                }
                $player['oriElo'] = number_format((float) $number, 1, '.', '');
                $player['newElo'] = round($player['oriElo'] / 5) * 5;
                $player['unrankRate'] = $unrankEloPlayer;
            } else {
                $player['oriElo'] = $player['elo'];
                $player['newElo'] = $player['elo'];
                $player['unrankRate'] = $unrankEloPlayer;
            }

            return $player;
        }, $players);

        // Last updated data
        $lastUpdate = $players[0]['updated_at'];

        return Inertia::render('NewMatch', [
            'players' => $players,
            'lastUpdate' => $lastUpdate
        ]);
    }
}
