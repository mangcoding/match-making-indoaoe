<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Age extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'image',
        'priority'
    ];

    public function insights(): BelongsToMany
    {
        return $this->belongsToMany(Insight::class, 'insight_ages', 'ages_id', 'insights_id');
    }
}
