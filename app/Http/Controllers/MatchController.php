<?php
namespace App\Http\Controllers;

use App\Models\Player;
use Inertia\Inertia;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class MatchController extends Controller
{
    public function index()
    {
        // Cache players in 1 hour
        $sql = "select
	tbl.*,
	((tbl.win - tbl.lose) * 0.5) + tbl.elo as final_elo
from
	(
	select
		p.aoe2net_id,
		p.name,
		p.alias,
		p.elo,
		p.avatar_url,
		p.streak,
		count(*) as total_matches,
		count(*) filter (
		where gm.won = true) as win,
		count(*) filter (
		where gm.won = false) as lose
	from
		players p
	left join (select
	*
from
	game_matches g
inner join match_teams t on
	t.match_id = g.match_id
where
	g.started_at >= '2024-06-01 00:00:00'
	and g.started_at is not null) as gm on gm.aoe2net_id = p.aoe2net_id
	where
		p.aoe2net_id is not null
	group by
		p.id) as tbl order by final_elo desc;";
        $players = DB::select($sql);


        // add rank key using map
        $players = array_map(function ($player, $index) {
            $player->rank = $index + 1;
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
