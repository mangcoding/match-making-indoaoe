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
        Schema::create('build_orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('insights_id')->constrained('insights')->cascadeOnDelete()->cascadeOnUpdate();
            $table->string('age', 150);
            $table->string('title', 150);
            $table->text('description')->nullable();
            $table->string('image', 150);
            $table->string('step', 150);
            $table->integer('priority');
            $table->softDeletes();
            $table->unique(['insights_id', 'age', 'step', 'priority']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('build_orders');
    }
};
