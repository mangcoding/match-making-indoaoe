<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AgeResource\Pages;
use App\Filament\Resources\AgeResource\RelationManagers;
use App\Models\Age;
use Filament\Forms;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;

class AgeResource extends Resource
{
    protected static ?string $model = Age::class;

    protected static ?string $navigationIcon = 'entypo-hour-glass';

    public static ?int $navigationSort = 8;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')
                    ->unique(ignoreRecord: true)
                    ->maxLength(150)
                    ->required()
                    ->columnSpan(2)
                    ->required(),
                FileUpload::make('image')
                    ->image()
                    ->imageEditor()
                    ->panelLayout('integrated')
                    ->imageEditorAspectRatios([
                        '16:9',
                        '4:3',
                        '1:1',
                    ])
                    ->required()
                    ->disk('public')
                    ->directory('images/ages')
                    ->visibility('public')
                    ->columnSpan(2),
                TextInput::make('priority')
                    ->integer()
                    ->unique(ignoreRecord: true)
                    ->required()
                    ->columnSpan(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->searchable()->sortable(),
                ImageColumn::make('image')->alignCenter(),
                TextColumn::make('priority')->searchable()->sortable(),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAges::route('/'),
            'create' => Pages\CreateAge::route('/create'),
            'edit' => Pages\EditAge::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
