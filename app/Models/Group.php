<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Content;

class Group extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'page',
        'slug',
        'name'
    ];

    public function contents(): HasMany
    {
        return $this->hasMany(Content::class, 'groups_id', 'id');
    }
}
