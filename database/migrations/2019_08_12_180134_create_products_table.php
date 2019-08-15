<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('designer_id');
            $table->integer('category_id');
            $table->integer('subcategory_id');
            $table->integer('collection_id');
            $table->integer('duplicate_category');
            $table->text('image');
            $table->string('alt', 50);
            $table->string('headline');
            $table->string('price');
            $table->integer('price_status');
            $table->string('currency', 50);
            $table->string('location');
            $table->text('body');
            $table->integer('status');
            $table->integer('views');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
