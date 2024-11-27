<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BuildOrderResource\Pages;
use App\Filament\Resources\BuildOrderResource\RelationManagers;
use App\Models\BuildOrder;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Models\Insight;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use App\Models\Age;

class BuildOrderResource extends Resource
{
    protected static ?string $model = BuildOrder::class;

    protected static ?string $navigationIcon = 'rpg-gear-hammer';

    public static ?int $navigationSort = 11;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('insights_id')
                    ->label('Insight')
                    ->relationship('insight', 'title')
                    ->preload(true)
                    ->reactive()
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
                TextInput::make('title')->required()->unique(ignoreRecord: true)->maxLength(150)->columnSpan(2),
                Textarea::make('description')->required()->columnSpan(2),
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
                    ->directory('images/build_orders')
                    ->visibility('public')
                    ->columnSpan(2),
                TextInput::make('step')->required()->maxLength(150)->columnSpan(2),
                TextInput::make('priority')
                    ->integer()
                    ->columnSpan(2)
                    ->required()
                    ->rule(function (callable $get, $record) {
                        $recordId = $record->id ?? 'NULL'; // Use NULL for new records
                        $insightsId = $get('insights_id') ?? 'NULL';
                        $age = $get('age') ?? 'NULL';
                        $step = $get('step') ?? 'NULL';

                        return "unique:build_orders,priority,{$recordId},id,insights_id,{$insightsId},age,{$age},step,{$step}";
                    })
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('insight.title')->searchable()->sortable()->limit(10),
                TextColumn::make('title')->searchable()->sortable()->limit(10),
                TextColumn::make('description')->limit(50)->searchable()->sortable(),
                ImageColumn::make('image')->alignCenter(),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
                SelectFilter::make('age')
                    ->options(Age::all()->pluck('name', 'name')->toArray()),
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
            'index' => Pages\ListBuildOrders::route('/'),
            'create' => Pages\CreateBuildOrder::route('/create'),
            'edit' => Pages\EditBuildOrder::route('/{record}/edit'),
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
