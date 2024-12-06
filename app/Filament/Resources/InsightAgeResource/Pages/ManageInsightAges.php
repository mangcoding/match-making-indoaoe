<?php

namespace App\Filament\Resources\InsightAgeResource\Pages;

use App\Filament\Resources\InsightAgeResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageInsightAges extends ManageRecords
{
    protected static string $resource = InsightAgeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
