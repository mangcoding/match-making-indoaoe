<?php

namespace App\Filament\Resources;

use App\Filament\Resources\InsightAgeResource\Pages;
use App\Filament\Resources\InsightAgeResource\RelationManagers;
use App\Models\InsightAge;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Models\InsightAgeResource as InsightAgeResources;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use App\Models\Insight;
use Filament\Tables\Columns\TextColumn;

class InsightAgeResource extends Resource
{
    protected static ?string $model = InsightAgeResources::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static ?int $navigationSort = 12;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('insights_id')
                    ->relationship('insight', 'title')
                    ->reactive(true)
                    ->preload(true)
                    ->columnSpan(2)
                    ->required(),
                Select::make('age')
                    ->label('Age')
                    ->options(function (callable $get) {
                        $insightId = $get('insights_id');
                        if (!$insightId) {
                            return [];
                        }
                        $insight = Insight::find($insightId);
                        return $insight ? $insight->ages()->pluck('name', 'name') : [];
                    })
                    ->columnSpan(2)
                    ->required(),
                Select::make('resources_id')
                    ->relationship('resource', 'name')
                    ->preload(true)
                    ->columnSpan(2)
                    ->required()
                    ->rule(function (callable $get, $record) {
                        $recordId = $record->id ?? 'NULL'; // Use NULL for new records
                        $insightsId = $get('insights_id') ?? 'NULL';
                        $age = $get('age') ?? 'NULL';

                        return "unique:insight_age_resources,resources_id,{$recordId},id,insights_id,{$insightsId},age,{$age}";
                    }),
                TextInput::make('quantity')->integer()->columnSpan(2)->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('insight.title')->searchable()->sortable()->limit(10),
                TextColumn::make('age')->searchable()->sortable(),
                TextColumn::make('resource.name')->searchable()->sortable(),
                TextColumn::make('quantity')->searchable()->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageInsightAges::route('/'),
        ];
    }
}
