<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ContentResource\Pages;
use App\Filament\Resources\ContentResource\RelationManagers;
use App\Models\Content;
use Faker\Provider\ar_EG\Text;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Get;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use App\Models\Group;

class ContentResource extends Resource
{
    protected static ?string $model = Content::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('groups_id')
                    ->relationship('group', 'name')
                    ->required()->columnSpan(2),
                Select::make('field_types')
                    ->options([
                        'text' => 'Text',
                        'description' => 'Description',
                        'image' => 'Image',
                        'link' => 'Link',
                        'button' => "Button",
                        'button_link' => 'Button Link',
                        'embed' => 'Embed'
                    ])
                    ->required()->live()->columnSpan(2),

                TextInput::make('field_value')->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'text'),

                Textarea::make('field_value')->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'description'),

                FileUpload::make('field_value')->image()
                    ->imageEditor()
                    ->panelLayout('integrated')
                    ->imageEditorAspectRatios([
                        '16:9',
                        '4:3',
                        '1:1',
                    ])
                    ->required()
                    ->disk('public')
                    ->directory('images/contents')
                    ->visibility('public')
                    ->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'image'),

                TextInput::make("link")->url()->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'link'),

                TextInput::make('label')->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'button'),

                TextInput::make('label')->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'button_link'),
                TextInput::make('link')->url()->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'button_link'),

                TextInput::make("link")->label('Embed Link')->required()->columnSpan(2)
                    ->hidden(fn(Get $get) => $get('field_types') !== 'embed'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('group.page')->label('Page')->searchable()->sortable(),
                TextColumn::make('group.name')->searchable()->sortable(),
                TextColumn::make('field_types')->searchable()->sortable(),
            ])
            ->filters([
                Tables\Filters\TrashedFilter::make(),
                SelectFilter::make('page')
                    ->relationship('group', 'page')->options(Group::all()->pluck('page', 'page')->toArray()),
                SelectFilter::make('group')
                    ->relationship('group', 'name')->options(Group::all()->pluck('name', 'name')->toArray()),
                SelectFilter::make('field_types')
                    ->options([
                        'text' => 'Text',
                        'description' => 'Description',
                        'image' => 'Image',
                        'link' => 'Link',
                        'button' => "Button",
                        'button_link' => 'Button Link',
                        'embed' => 'Embed'
                    ])
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
            'index' => Pages\ListContents::route('/'),
            'create' => Pages\CreateContent::route('/create'),
            'edit' => Pages\EditContent::route('/{record}/edit'),
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
