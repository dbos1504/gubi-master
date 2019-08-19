<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NewsImages extends Model
{
    protected $guarded = [];

    public function inspirations()
    {
        return $this->belongsTo(News::class);
    }
}
