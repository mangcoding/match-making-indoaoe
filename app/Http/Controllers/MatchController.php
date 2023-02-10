<?php
namespace App\Http\Controllers;

use App\Models\Player;
use Inertia\Inertia;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;

class MatchController extends Controller
{
    public function index()
    {
        $players = Player::orderBy('elo', 'desc')->get()->toArray();
        
        return Inertia::render('Match', [
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
