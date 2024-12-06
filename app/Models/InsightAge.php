<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class InsightAge extends Pivot
{
    use HasFactory;

    protected $primaryKey = ['insights_id', 'ages_id'];

    protected $fillable = [
        'insights_id',
        'ages_id',
    ];
}
