<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Resources extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'image'
    ];

    protected static function booted()
    {
        static::forceDeleting(function ($resource) {
            if (Storage::disk('public')->exists($resource->image)) {
                Storage::disk('public')->delete($resource->image);
            }
        });

        static::updated(function ($resource) {
            if ($resource->isDirty('image') && $resource->getOriginal('image')) {
                Storage::disk('public')->delete($resource->getOriginal('image'));
            }
        });
    }

    public function insights(): HasMany
    {
        return $this->hasMany(InsightAgeResource::class, 'resources_id', 'id');
    }
}
