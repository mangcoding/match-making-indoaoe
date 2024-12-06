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
        Schema::create('match_teams', function (Blueprint $table) {
            $table->id();
            $table->integer('match_id');
            $table->integer('team_id');
            $table->integer('aoe2net_id');
            $table->string('civ');
            $table->boolean('won');
            $table->timestamps();

            $table->unique(['match_id', 'aoe2net_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('match_teams');
    }
};
