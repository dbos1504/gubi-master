<?php

namespace App\Http\Controllers;

use App\Products;
use Illuminate\Http\Request;

class ProjectController extends Controller
{
    public function index()
    {
        $featured = Products::where(['categories_id' => 1, 'status' => 1])->get();

        return view('layouts.index', compact('featured'));
    }
}
