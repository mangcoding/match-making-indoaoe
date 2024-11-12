<?php
namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Player;
use Inertia\Inertia;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class MatchController extends Controller
{

    public function home () {
        // Ambil data dengan relasi `contents`
    $data = Group::where('page', 'home')->with('contents')->get();

    // Susun ulang data ke format yang diinginkan
    $formattedData = [];
    foreach ($data as $group) {
        $groupData = [];

        foreach ($group->contents as $content) {
            if ($content->field_type === 'text') {
                $groupData['title'] = $content->field_value;
            } elseif ($content->field_type === 'description') {
                $groupData['description'] = $content->field_value;
            } elseif ($content->field_type === 'link' || $content->field_type === 'embed' || $content->field_type === 'button') {
                $groupData['link'] = $content->link;
                $groupData['label'] = $content->label; // Jika Anda memerlukan label
            }
            $groupData['type'] = $content->field_type;
            // Tambahkan kondisi lain untuk field_type lain jika diperlukan
        }

        // Tambahkan array grup ke dalam array berindeks dengan nama grup
        $formattedData[$group->name] = $groupData;
    }
    // return $formattedData;
    return view('home', compact('formattedData'));
    }

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
		p.crown,
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
		and p.status = '1'
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
