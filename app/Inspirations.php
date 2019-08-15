<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Inspirations extends Model
{
    protected $guarder = [];

    public function getRouteKeyName()
    {
        return 'location';
    }
}
