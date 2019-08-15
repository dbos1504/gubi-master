<?php

namespace App\Http\Controllers;

use App\News;

class NewsController extends Controller
{
    public function index()
    {
        $news = News::where(['status' => 1])->get();

        return view('layouts.news', compact('news'));
    }

    public function show(News $news)
    {
        $previous = News::where('id', '<', $news->id)->orderBy('id','desc')->first();
        $next = News::where('id', '>', $news->id)->first();

        return view('layouts.single-news', compact('news', 'previous', 'next'));
    }
}
