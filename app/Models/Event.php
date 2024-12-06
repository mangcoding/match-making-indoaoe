<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Event extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['title', 'body', 'from_date', 'to_date', 'image', 'link'];

    protected static function booted()
    {
        static::forceDeleting(function ($event) {
            if (Storage::disk('public')->exists($event->image)) {
                Storage::disk('public')->delete($event->image);
            }
        });

        static::updated(function ($event) {
            if ($event->isDirty('image') && $event->getOriginal('image')) {
                Storage::disk('public')->delete($event->getOriginal('image'));
            }
        });
    }
}
