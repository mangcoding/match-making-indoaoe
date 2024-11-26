<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

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
    }
}
