<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'location';
    }

    public function products()
    {
        return $this->belongsToMany(Products::class)->where('status', 1);
    }

    public function subcategory()
    {
        return $this->hasMany(Subcategory::class)->where('status', 1);
    }

}
