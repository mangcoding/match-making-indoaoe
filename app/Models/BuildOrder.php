<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Storage;

class BuildOrder extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'insights_id',
        'age',
        'title',
        'description',
        'image',
        'step',
        'priority'
    ];

    protected static function booted()
    {
        static::forceDeleting(function ($buildOrder) {
            if (Storage::disk('public')->exists($buildOrder->image)) {
                Storage::disk('public')->delete($buildOrder->image);
            }
        });
    }

    public function insight(): BelongsTo
    {
        return $this->belongsTo(Insight::class, 'insights_id', 'id');
    }
}
