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
        Schema::create('order', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->foreignId('color_id')->constrained('product_color')->onDelete('cascade');
            $table->integer('quantity');
            $table->integer('beanie_type');
            $table->foreignId('printing_id')->constrained('product_printings')->onDelete('cascade');
            $table->decimal('printing_price', 8, 2);
            $table->decimal('product_price', 8, 2);
            $table->decimal('delivery_price', 8, 2);
            $table->timestamps();

            $table->engine = 'InnoDB'; 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order');
    }
};
