<?php

namespace App\Filament\Resources\BuildOrderResource\Pages;

use App\Filament\Resources\BuildOrderResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBuildOrder extends EditRecord
{
    protected static string $resource = BuildOrderResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
            Actions\ForceDeleteAction::make(),
            Actions\RestoreAction::make(),
        ];
    }
}
