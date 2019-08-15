<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSubVariationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_variations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('products_id');
            $table->unsignedInteger('variations_id');
            $table->string('variation_name');
            $table->string('name');
            $table->text('image');
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
        Schema::dropIfExists('sub_variations');
    }
}
