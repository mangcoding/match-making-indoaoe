<?php

namespace App\Http\Controllers;

use App\Filament\Resources\InsightAgeResource;
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

        $contents = Group::where('page', 'insight')->with('contents')->get();

        $data = MatchController::formattedData($contents);
        $data['insights'] = $insights;

        return view('insight', compact('data'));
    }

    public function insight_detail(Request $request, Insight $insight)
    {
        $getInsight = $insight->with('ages', 'build_orders', 'resources', 'category')->first();

        $data = [];
        $data['title'] = $getInsight->title;
        $data['image'] = $getInsight->image;
        $data['description'] = $getInsight->description;
        $data['difficulty'] = $getInsight->difficulty;

        foreach ($getInsight->category as $category) {
            $data['category'][] = $category->name;
        }

        $getInsight->ages = $getInsight->ages->sortBy('priority');

        foreach ($getInsight->ages as $key => $age) {
            $data['body'][$key] = [
                'name' => $age->name,
                'image' => $age->image,
                'build_orders' => [],
                'resources' => []
            ];

            $insightAgeResources = $getInsight->resources->filter(function ($resource) use ($age) {
                return $resource->age === $age->name;
            });

            $data['body'][$key]['resources'] = $insightAgeResources->map(function ($insightAgeResource) {
                return [
                    'id' => $insightAgeResource->id,
                    'name' => $insightAgeResource->resource->name,
                    'image' => $insightAgeResource->resource->image ?? null,
                    'quantity' => $insightAgeResource->quantity,
                ];
            });

            $buildOrders = $getInsight->build_orders->filter(function ($buildOrder) use ($age) {
                return $buildOrder->age === $age->name;
            });

            $buildOrdersGrouped = $buildOrders->groupBy('step')->map(function ($group) {
                return $group->sortBy('priority');
            });

            $data['body'][$key]['build_orders'] = $buildOrdersGrouped;
        }

        $data['insights'] = Insight::paginate(2);

        return view('insight_detail', compact('data'));
    }


    public function home()
    {
        $contents = Group::where('page', 'home')->with('contents')->get();

        $data = MatchController::formattedData($contents);
        $data['sponsors'] = Sponsor::all()->toArray();
        $data['players'] = Player::all()->toArray();
        $data['events'] = Event::all()->toArray();

        return view('home', compact('data'));
    }

    public function player () {
        return view('player');
    }
    public function about () {
        return view('about');
    }
    public function matchmaking () {
        return view('matchmaking');
    }
    public function saweria () {
        return view('saweria');
    }
    public function event () {
        return view('event');
    }

    public function index()
    {
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
    left join (
        select
            *
        from
            game_matches g
        inner join match_teams t on
            t.match_id = g.match_id
        where
            g.started_at is not null
    ) as gm on gm.aoe2net_id = p.aoe2net_id
    where
        p.aoe2net_id is not null
        and p.status = '1'
    group by
        p.id
    ) as tbl
    order by final_elo desc;";

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
