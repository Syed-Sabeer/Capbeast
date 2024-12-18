<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductColorTable extends Migration
{
    public function up()
    {
        Schema::create('product_color', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->text('color');
            $table->text('images');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_color');
    }
}
