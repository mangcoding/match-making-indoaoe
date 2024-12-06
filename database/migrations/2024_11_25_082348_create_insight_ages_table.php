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
        Schema::create('insight_ages', function (Blueprint $table) {
            $table->foreignId('insights_id')->constrained('insights')->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreignId('ages_id')->constrained('ages')->cascadeOnDelete()->cascadeOnUpdate();
            $table->primary(['insights_id', 'ages_id']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('insight_ages');
    }
};
