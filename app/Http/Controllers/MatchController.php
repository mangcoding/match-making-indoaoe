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
            $player['oriElo'] = $player['elo'];
            $player['newElo'] = round($player['elo'] / 5) * 5;
            $player['unrankRate'] = 0;

            $unrankEloPlayer = $player['elo_unranked'];
            if ($unrankEloPlayer <= 1200) {
                // unrank must be 1300 or more, need to add from unrank elo
                $lessElo = 1400 - $unrankEloPlayer;
                $unrankEloPlayer = $unrankEloPlayer + $lessElo;

            }
            // hanya player yang memiliki unrank yang dihitung
            if ($unrankEloPlayer) {
                if ($player['elo'] >= 45) {
                    $eloTemp = ($unrankEloPlayer - 900) / 700 * 30;
                    $eloTemp = $eloTemp > 30 ? 30 : $eloTemp;
                    $number = ($player['elo'] * 70) / 100 + $eloTemp;
                } else {
                    $number = $player['elo'];
                }
                $player['oriElo'] = round($number, 1);
                $player['newElo'] = round($player['oriElo'] / 5) * 5;
                $player['unrankRate'] = $unrankEloPlayer;
            } else {
                $player['oriElo'] = $player['elo'];
                $player['newElo'] = $player['elo'];
                $player['unrankRate'] = $unrankEloPlayer;
            }


            return $player;
        }, $players);

        // sort players by oriElo key desc
        usort($players, function ($a, $b) {
            return $b['oriElo'] <=> $a['oriElo'];
        });


        // add rank key using map
        $players = array_map(function ($player, $index) {
            $player['rank'] = $index + 1;
            return $player;
        }, $players, array_keys($players));

        // Last updated data
        $lastUpdate = Player::whereNotNull('updated_at')->orderBy('updated_at', 'desc')->first()->updated_at;

        return Inertia::render('NewMatch', [
            'players' => $players,
            'lastUpdate' => $lastUpdate
        ]);
    }
}
