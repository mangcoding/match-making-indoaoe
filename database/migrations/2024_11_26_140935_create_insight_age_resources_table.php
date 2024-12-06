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
        Schema::create('insight_age_resources', function (Blueprint $table) {
            $table->id();
            $table->foreignId('insights_id')->constrained('insights')->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreignId('resources_id')->constrained('resources')->cascadeOnDelete()->cascadeOnUpdate();
            $table->string('age', 150);
            $table->integer('quantity');
            $table->unique(['insights_id', 'age', 'resources_id']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('insight_age_resources');
    }
};
