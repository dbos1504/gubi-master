<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Variations extends Model
{
    protected $guarded = [];

    public function products()
    {
        return $this->belongsToMany(Products::class);
    }

    public function subvariations()
    {
        return $this->hasMany(SubVariations::class);
    }
}
