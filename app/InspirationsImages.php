<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InspirationsImages extends Model
{
    protected $guarded = [];

    public function inspirations()
    {
        return $this->belongsTo(Inspirations::class);
    }
}
