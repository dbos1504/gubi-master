<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductsImages extends Model
{
    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Products::class);
    }
}
