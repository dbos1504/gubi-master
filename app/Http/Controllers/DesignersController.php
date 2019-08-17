<?php

namespace App\Http\Controllers;

use App\Designers;
use App\Products;


class DesignersController extends Controller
{
    public function index()
    {
        $designers = Designers::where(['status' => 1])->get();

        return view('layouts.designers', compact('designers'));
    }

    public function show(Designers $designer)
    {
        $designers = Designers::where(['status' => 1])->get();
        $products = Products::inRandomOrder()->where(['designers_id' => $designer->id, 'status' => 1])->get();

        return view('layouts.designer', compact('designer', 'designers', 'products'));
    }
}
