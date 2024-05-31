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
            ->orderBy('final_elo', 'desc')
            ->get()->toArray();

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
