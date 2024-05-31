<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('players', function (Blueprint $table) {
            $table->float('last_win_count')->default(0);
            $table->float('last_lose_count')->default(0);
            $table->float('final_elo')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('players', function (Blueprint $table) {
            $table->dropColumn('last_win_count');
            $table->dropColumn('last_lose_count');
            $table->dropColumn('final_elo');
        });
    }
};
