<?php

namespace App\Http\Controllers;

use App\Collections;
use App\Products;

class ProjectController extends Controller
{
    public function index()
    {
        $featured = Products::where(['categories_id' => 1, 'status' => 1])->take(15)->get();
        $collections = Collections::where('status', 1)->take(2)->get();
        $sliders = Collections::where('gallery_status', 1)->get();

        return view('layouts.index', compact('featured', 'collections', 'sliders'));
    }
}
