<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Content extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "groups_id",
        "page",
        "image",
        'field_types',
        'field_value',
        'label',
        'link'
    ];

    public function group(): BelongsTo
    {
        return $this->belongsTo(Group::class, 'groups_id', 'id');
    }
}
