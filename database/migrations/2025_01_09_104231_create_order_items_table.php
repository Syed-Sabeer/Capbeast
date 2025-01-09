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
        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->onDelete('cascade'); // Link to the order
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade'); // Product reference
            $table->foreignId('color_id')->constrained('product_color')->onDelete('cascade'); // Color reference
            $table->integer('quantity'); // Quantity of the product
            $table->integer('beanie_type'); // Beanie type
            $table->foreignId('printing_id')->constrained('product_printings')->onDelete('cascade'); // Printing reference
            $table->decimal('printing_price', 8, 2); // Price for printing
            $table->decimal('product_price', 8, 2); // Price for the product
            $table->decimal('delivery_price', 8, 2); // Delivery price for the product
            $table->timestamps();
        });
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_items');
    }
};
