<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class InsightCategory extends Model
{
    use HasFactory;

    protected $primaryKey = ["insight_id", "category_id"];

    protected $fillable = [
        "insight_id",
        "category_id"
    ];

    public function insight(): BelongsTo
    {
        return $this->belongsTo(Insight::class, 'insight_id', 'id');
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(CategoryInsight::class, 'category_id', 'id');
    }
}
