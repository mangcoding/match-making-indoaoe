<?php

namespace App\Filament\Resources\BuildOrderResource\Pages;

use App\Filament\Resources\BuildOrderResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBuildOrders extends ListRecords
{
    protected static string $resource = BuildOrderResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
