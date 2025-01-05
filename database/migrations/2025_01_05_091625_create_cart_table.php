<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('color_id');
            $table->integer('quantity');
            $table->integer('beanie_type');
            $table->unsignedBigInteger('printing_id');
            $table->decimal('printing_price', 8, 2);
            $table->decimal('product_price', 8, 2);
            $table->decimal('delivery_price', 8, 2);
            $table->timestamps();

            // Foreign key constraints (ensure these columns exist in their respective tables)
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
            $table->foreign('printing_id')->references('id')->on('product_printings')->onDelete('cascade');
            $table->foreign('color_id')->references('id')->on('product_color')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cart');
    }
}
