<?php

namespace App\Filament\Widgets;

use App\Models\Event;
use App\Models\Insight;
use App\Models\Sponsor;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class SponsorEventOverview extends BaseWidget
{
    protected static ?int $sort = 2;

    public int | string | array $columnSpan = 'full';

    protected function getStats(): array
    {
        return [
            Stat::make('Sponsor', Sponsor::query()->count()),
            Stat::make('Event', Event::query()->count()),
            Stat::make('Insight', Insight::query()->count())
        ];
    }
}
