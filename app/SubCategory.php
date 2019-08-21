<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'location';
    }

    public function categories()
    {
        return $this->belongsTo(Categories::class);
    }

    public function products()
    {
        return $this->hasMany(Products::class)->where('status', 1);
    }
}
