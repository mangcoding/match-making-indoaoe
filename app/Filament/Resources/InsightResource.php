<?php

namespace App\Filament\Resources;

use App\Filament\Resources\InsightResource\Pages;
use App\Filament\Resources\InsightResource\RelationManagers;
use App\Models\CategoryInsight;
use App\Models\Insight;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;

class InsightResource extends Resource
{
    protected static ?string $model = Insight::class;

    public static ?int $navigationSort = 9;

    protected static ?string $navigationIcon = 'ri-brain-fill';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('category')
                    ->relationship('category', 'name')
                    ->multiple()
                    ->preload(true)
                    ->required()
                    ->columnSpan(2),
                TextInput::make('title')->required()->unique()->maxLength(150)->columnSpan(2),
                Textarea::make('description')->columnSpan(2),
                FileUpload::make('image')
                    ->image()
                    ->imageEditor()
                    ->columnSpan(2)
                    ->panelLayout('integrated')
                    ->imageEditorAspectRatios([
                        '16:9',
                        '4:3',
                        '1:1',
                    ])
                    ->required()
                    ->disk('public')
                    ->directory('images/insights')
                    ->visibility('public')
                    ->columnSpan(2),
                Select::make('difficulty')
                    ->options([
                        "Beginner" => "Beginner",
                        "Intermediate" => "Intermediate",
                        "Advanced" => "Advanced"
                    ])->columnSpan(2),
                TextInput::make('population')->integer()->columnSpan(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('title')->searchable()->sortable(),
                TextColumn::make('description')->wrap()->limit(10)->searchable()->sortable(),
                TextColumn::make('difficulty')->searchable()->sortable(),
                TextColumn::make('population')->sortable(),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
                SelectFilter::make('category')
                    ->relationship('category', 'name')->options(CategoryInsight::all()->pluck('name', 'name')->toArray()),
                SelectFilter::make('difficulty')
                    ->options([
                        "Beginner" => "Beginner",
                        "Intermediate" => "Intermediate",
                        "Advanced" => "Advanced"
                    ])
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListInsights::route('/'),
            'create' => Pages\CreateInsight::route('/create'),
            'edit' => Pages\EditInsight::route('/{record}/edit'),
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
