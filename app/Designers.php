<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Designers extends Model
{
    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'location';
    }
}
