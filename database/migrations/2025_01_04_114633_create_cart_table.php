<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartTable extends Migration
{
    public function up()
    {
        Schema::create('cart', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade'); // Foreign key for product
            $table->foreignId('color_id')->constrained('product_color')->onDelete('cascade'); // Foreign key for product color
            $table->integer('quantity'); // Quantity of the product
            $table->tinyInteger('beaniestype'); // Beaniestype (1 or 2)
            $table->foreignId('printing_id')->constrained('product_printing')->onDelete('cascade'); // Foreign key for printing
            $table->decimal('printing_price', 10, 2); // Printing price
            $table->decimal('product_price', 10, 2); // Product price
            $table->decimal('delivery_price', 10, 2); // Delivery price
            $table->timestamps(); // Created at and updated at timestamps
        });
    }

    public function down()
    {
        Schema::dropIfExists('cart');
    }
}
