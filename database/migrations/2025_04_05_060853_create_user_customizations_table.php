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
        Schema::create('user_customizations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()
              ->constrained('users')
              ->onDelete('cascade');
            $table->string('ipaddress')->nullable();
            $table->foreignId('product_id')->nullable()
              ->constrained('products')
              ->onDelete('cascade');
            $table->foreignId('product_color_id')->nullable()
              ->constrained('product_color')
              ->onDelete('cascade');
            $table->string('front_image')->nullable();
            $table->string('back_image')->nullable();
            $table->string('left_image')->nullable();
            $table->string('right_image')->nullable();
            $table->string('price')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_customizations');
    }
};
