<?php

namespace App\Filament\Resources\ContentResource\Pages;

use App\Filament\Resources\ContentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Env;

class CreateContent extends CreateRecord
{
    protected static string $resource = ContentResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if ($data['field_types'] == 'image') {
            $data['link'] = $data['image'];
        }

        return $data;
    }
}
