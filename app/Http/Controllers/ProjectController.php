<?php

namespace App\Http\Controllers;

use App\Collections;
use App\InstagramToken;
use App\Products;
use Vinkla\Instagram\Instagram;

class ProjectController extends Controller
{
    public function index()
    {
        $token = InstagramToken::where('id', 1)->pluck('token')[0];
        if ($token) {
            try {
                $instagram = new Instagram($token);

                $instagram_images = collect($instagram->media())->map(function ($each) {
                    return $each->images->standard_resolution->url;
                });
            } catch (\Exception $e) {
                $instagram_images = 'nista';
            }
        } else {
            $instagram_images = 'nista';
        }

        $featured = Products::where(['categories_id' => 1, 'status' => 1])->take(15)->get();
        $collections = Collections::where('status', 1)->take(2)->get();
        $sliders = Collections::where('gallery_status', 1)->get();

        return view('layouts.index', compact('featured', 'collections', 'sliders', 'instagram_images', 'token'));
    }
}
