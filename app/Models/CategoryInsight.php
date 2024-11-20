<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class CategoryInsight extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['name'];

    public function insights(): BelongsToMany
    {
        return $this->belongsToMany(Insight::class, 'insight_categories', 'category_id', 'insight_id');
    }
}
