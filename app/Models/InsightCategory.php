<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class InsightCategory extends Model
{
    use HasFactory;

    protected $primaryKey = ["insights_id", "category_insights_id"];

    protected $fillable = [
        "insights_id",
        "category_insights_id"
    ];

    public function insight(): BelongsTo
    {
        return $this->belongsTo(Insight::class, 'insights_id', 'id');
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(CategoryInsight::class, 'category_insights_id', 'id');
    }
}
