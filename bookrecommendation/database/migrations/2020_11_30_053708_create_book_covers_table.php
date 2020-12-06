<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookCoversTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_covers', function (Blueprint $table) {
            $table->bigInteger('book_id')->unsigned();
            $table->bigInteger('design_id')->unsigned();
            $table->timestamps();
            $table->foreign('book_id')->references('id')->on('books');
            $table->foreign('design_id')->references('id')->on('c_designs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('book_covers');
    }
}
