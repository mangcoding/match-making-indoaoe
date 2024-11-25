<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Group;
use App\Models\Insight;
use App\Models\Player;
use App\Models\Sponsor;
use Inertia\Inertia;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class MatchController extends Controller
{
    public static function formattedData($data)
    {
        $formattedData = [];

        foreach ($data as $group) {
            $groupData = [
                'title' => null,
                'description' => null,
                'links' => [],
            ];

            foreach ($group->contents as $content) {
                if ($content->field_types === 'text') {
                    $groupData['title'] = $content->field_value;
                } elseif ($content->field_types === 'description') {
                    $groupData['description'] = $content->field_value;
                } elseif (in_array($content->field_types, ['link', 'embed', 'button', 'image', 'button_link'])) {
                    $groupData['links'][] = [
                        'url' => $content->link,
                        'label' => $content->label,
                        'type' => $content->field_types,
                    ];
                }
            }

            $formattedData[$group->name] = $groupData;
        }

        return $formattedData;
    }


    public function insight(Request $request)
    {
        $category = $request->query('category', 'all');

        if ($category == 'all') {
            $insights = Insight::paginate(8);
        } else {
            $insights = Insight::with('categoryInsights')
                ->whereHas('categoryInsights', function ($query) use ($category) {
                    $query->where('category_id', $category);
                })
                ->paginate(8);
        }

        $contents = Group::where('page', 'insights')->with('contents')->get();

        $formattedData = MatchController::formattedData($contents);
        $formattedData['insights'] = $insights;

        return view('insight', compact('formattedData'));
    }

    public function home()
    {
        $data = Group::where('page', 'home')->with('contents')->get();

        $formattedData = MatchController::formattedData($data);
        $formattedData['sponsors'] = Sponsor::all()->toArray();
        $formattedData['players'] = Player::all()->toArray();
        $formattedData['events'] = Event::all()->toArray();

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
