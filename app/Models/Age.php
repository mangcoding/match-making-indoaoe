<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

use function PHPUnit\Framework\fileExists;

class Age extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'image',
        'priority'
    ];

    protected static function booted()
    {
        static::forceDeleting(function ($age) {
            if (Storage::disk('public')->exists($age->image)) {
                Storage::disk('public')->delete($age->image);
            }
        });
    }

    public function insights(): BelongsToMany
    {
        return $this->belongsToMany(Insight::class, 'insight_ages', 'ages_id', 'insights_id');
    }
}
