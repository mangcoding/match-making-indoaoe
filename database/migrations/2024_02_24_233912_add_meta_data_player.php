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
            $table->string('avatar_url')->nullable();
            $table->string('alias')->nullable();
            $table->float('elo_unranked')->nullable()->default(1000);
            $table->float('elo_1v1')->nullable()->default(0);
            $table->float('elo_team')->nullable()->default(0);
            $table->json('meta_data')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('players', function (Blueprint $table) {
            $table->dropColumn('avatar_url');
            $table->dropColumn('alias');
            $table->dropColumn('elo_unranked');
            $table->dropColumn('elo_1v1');
            $table->dropColumn('elo_team');
            $table->dropColumn('meta_data');
        });
    }
};
