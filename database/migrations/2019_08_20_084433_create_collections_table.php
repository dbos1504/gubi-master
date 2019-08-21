<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCollectionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('collections', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('designers_id');
            $table->text('image');
            $table->string('alt', 100);
            $table->string('headline');
            $table->text('collection_desc');
            $table->text('inspiration_desc');
            $table->string('location');
            $table->string('where_to_buy');
            $table->text('body');
            $table->integer('status');
            $table->integer('gallery_status');
            $table->string('slider_name');
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
        Schema::dropIfExists('collections');
    }
}
