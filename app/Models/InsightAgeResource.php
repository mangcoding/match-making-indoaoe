<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class InsightAgeResource extends Model
{
    use HasFactory;

    protected $fillable = [
        'insights_id',
        'resources_id',
        'age',
        'quantity',
    ];

    public function insight(): BelongsTo
    {
        return $this->belongsTo(Insight::class, 'insights_id', 'id');
    }

    public function resource(): BelongsTo
    {
        return $this->belongsTo(Resources::class, 'resources_id', 'id');
    }
}
