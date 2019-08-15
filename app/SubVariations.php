<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubVariations extends Model
{
    protected $guarded = [];

    public function variation()
    {
        return $this->belongsTo(Variations::class);
    }
}
