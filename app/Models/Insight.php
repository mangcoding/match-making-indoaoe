<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Insight extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'image',
        'description',
        'difficulty',
        'population',
    ];

    public function category(): BelongsToMany
    {
        return $this->belongsToMany(CategoryInsight::class, 'insight_categories', 'insights_id', 'category_insights_id');
    }
}
