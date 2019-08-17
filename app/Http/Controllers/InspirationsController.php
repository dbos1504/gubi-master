<?php

namespace App\Http\Controllers;

use App\Inspirations;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class InspirationsController extends Controller
{
    public function index()
    {
        $inspirations = Inspirations::where(['status' => 1])->get();
//        $menu = InspirationMenu::where(['status' => 1])->get();

        return view('layouts.inspirations', compact('inspirations'));
    }

    public function show(Inspirations $inspiration)
    {
        $inspirations = Inspirations::where(['status' => 1])->get();

        return view('layouts.inspiration', compact('inspirations', 'inspiration'));
    }

    public function heimilid()
    {
        return view('layouts.heimilid');
    }
}
