<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Collections extends Model
{
    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'location';
    }

    public function images()
    {
        return $this->hasMany(CollectionsImages::class);
    }

    public function options()
    {
        return $this->hasMany(CollectionsOptions::class);
    }
}
