<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\Pivot;

class InsightCategory extends Pivot
{
    use HasFactory;

    protected $primaryKey = ["insights_id", "category_insights_id"];

    protected $fillable = [
        "insights_id",
        "category_insights_id"
    ];
}
