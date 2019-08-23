<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubVariations extends Model
{
    protected $guarded = [];

    protected $with = ['options'];

    public function variation()
    {
        return $this->belongsTo(Variations::class);
    }

    public function subsubvariation()
    {
        return $this->hasMany(SubSubVariation::class);
    }
    public function options()
    {
        return $this->hasMany(SubVariationsOption::class);
    }
}
