<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Sponsor extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'image'
    ];

    protected static function booted()
    {
        static::forceDeleting(function ($sponsor) {
            if (Storage::disk('public')->exists($sponsor->image)) {
                Storage::disk('public')->delete($sponsor->image);
            }
        });

        static::updated(function ($sponsor) {
            if ($sponsor->isDirty('image') && $sponsor->getOriginal('image')) {
                Storage::disk('public')->delete($sponsor->getOriginal('image'));
            }
        });
    }
}
