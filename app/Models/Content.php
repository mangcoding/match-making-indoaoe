<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Storage;

class Content extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "groups_id",
        "page",
        "image",
        'field_types',
        'field_value',
        'label',
        'link'
    ];

    protected static function booted()
    {
        static::forceDeleting(function ($content) {
            if ($content->image && Storage::disk('public')->exists($content->image)) {
                Storage::disk('public')->delete($content->image);
            }
        });

        static::updated(function ($content) {
            if ($content->isDirty('image') && $content->getOriginal('image')) {
                Storage::disk('public')->delete($content->getOriginal('image'));
            }
        });
    }


    public function group(): BelongsTo
    {
        return $this->belongsTo(Group::class, 'groups_id', 'id');
    }
}
