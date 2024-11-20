<?php

namespace App\Filament\Resources\CategoryInsightResource\Pages;

use App\Filament\Resources\CategoryInsightResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageCategoryInsights extends ManageRecords
{
    protected static string $resource = CategoryInsightResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
