<?php

namespace App\Http\Controllers;

use App\About;

class AboutController extends Controller
{
    public function index()
    {
        $abouts = About::all();
        return view('layouts.about', compact('abouts'));
    }
}
