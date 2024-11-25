<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BuildOrder extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'insights_id',
        'age',
        'title',
        'description',
        'image',
        'step',
        'priority'
    ];

    public function insight(): BelongsTo
    {
        return $this->belongsTo(Insight::class, 'insights_id', 'id');
    }
}
