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
        Schema::create('contents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('groups_id')->constrained('groups')->cascadeOnUpdate()->cascadeOnDelete();
            $table->string('page', 150);
            $table->string('field_types', 150);
            $table->text('field_value')->nullable();
            $table->string('image', 150)->nullable();
            $table->string('label', 150)->nullable();
            $table->string('link', 100)->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('contents');
    }
};
