<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $guarded = [];

    protected $with = ['subvariations'];

    public function getRouteKeyName()
    {
        return 'location';
    }

    public function category()
    {
        return $this->belongsToMany(Categories::class);
    }

    public function subcategory()
    {
        return $this->belongsTo(SubCategory::class);
    }

    public function images()
    {
        return $this->hasMany(ProductsImages::class);
    }

    public function variations()
    {
        return $this->belongsToMany(Variations::class);
    }

    public function subvariations()
    {
        return $this->hasMany(SubVariations::class);
    }
}
