<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

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

    protected static function booted()
    {
        static::forceDeleting(function ($insight) {
            if ($insight->image && Storage::disk('public')->exists($insight->image)) {
                Storage::disk('public')->delete($insight->image);
            }

            $insight->build_orders()->each(function ($buildOrder) {
                if ($buildOrder->image && Storage::disk('public')->exists($buildOrder->image)) {
                    Storage::disk('public')->delete($buildOrder->image);
                    info($buildOrder->image);
                }
            });
        });

        static::updated(function ($insight) {
            if ($insight->isDirty('image') && $insight->getOriginal('image')) {
                Storage::disk('public')->delete($insight->getOriginal('image'));
            }
        });
    }

    public function category(): BelongsToMany
    {
        return $this->belongsToMany(CategoryInsight::class, 'insight_categories', 'insights_id', 'category_insights_id');
    }

    public function ages(): BelongsToMany
    {
        return $this->belongsToMany(Age::class, 'insight_ages', 'insights_id', 'ages_id');
    }

    public function build_orders(): HasMany
    {
        return $this->hasMany(BuildOrder::class, 'insights_id', 'id');
    }

    public function resources(): HasMany
    {
        return $this->hasMany(InsightAgeResource::class, 'insights_id', 'id');
    }
}
