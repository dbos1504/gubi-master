<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inspirations extends Model
{
    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'location';
    }

    public function images()
    {
        return $this->hasMany(InspirationsImages::class);
    }
}
