<?php

namespace App\Filament\Widgets;

use App\Models\Player;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\Group;
use App\Models\Content;


class PlayerOverview extends BaseWidget
{
    protected static ?int $sort = 1;

    protected function getStats(): array
    {
        return [
            Stat::make('Player', Player::query()->count()),
            Stat::make('Group', Group::query()->count()),
            Stat::make('Content', Content::query()->count())
        ];
    }
}
