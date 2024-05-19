<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    use HasFactory;

    static function log($message)
    {
        $user = auth()->user();
        $log = new ActivityLog();
        $log->user_id = $user->id;
        $log->description = $message;
        $log->save();
    }
}
