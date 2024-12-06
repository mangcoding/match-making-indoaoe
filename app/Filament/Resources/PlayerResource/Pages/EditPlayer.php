<?php

namespace App\Filament\Resources\PlayerResource\Pages;

use App\Filament\Resources\PlayerResource;
use App\Models\ActivityLog;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPlayer extends EditRecord
{
    protected static string $resource = PlayerResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function afterSave(): void
    {
        // Runs after the form fields are saved to the database.
        $admin = auth()->user()->name;
        $message = "User {$admin} updated player {$this->record->name} to elo {$this->record->elo}.";
        ActivityLog::log($message);
    }
}
