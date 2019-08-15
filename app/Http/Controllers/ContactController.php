<?php

namespace App\Http\Controllers;

use App\Contact;
use FarhanWazir\GoogleMaps\GMaps;

class ContactController extends Controller
{
    public function index()
    {
        $config['center'] = '64.139505, -21.896849';
        $config['zoom'] = '12';
        $config['map_height'] = '100%';
        $config['styles'] = array(
            array("name"=>"GUBI", "definition"=>array(
                array("featureType"=>"all", "stylers"=>array(array("saturation"=>"-120"))),
                array("featureType"=>"road.arterial", "elementType"=>"geometry", "stylers"=>array(array("hue"=>"#000000")))
            )),
        );
        $config['stylesAsMapTypes'] = true;
        $config['stylesAsMapTypesDefault'] = "GUBI";
        $config['scrollWheel'] = false;

        $gmaps = new GMaps($config);
        $gmaps->initialize($config);
        $marker['position'] = '64.139505, -21.896849';
        $marker['infowindow_content'] = '<b>GUBI</b> store location <br>Alla virka daga frá 9-18, <br>Laugardaga 11-15 í nóv og des';
        $gmaps->add_marker($marker);
        $map = $gmaps->create_map();

        return view('layouts.contact', compact('map'));
    }

    public function store()
    {
        $podaci = request()->validate([
            'firstname' => 'required',
            'lastname'  => 'required',
            'email'     => 'required|email',
            'subject'   => 'required',
            'message'   => 'required|min:3',
        ]);

        Contact::create($podaci);

        return back();
    }
}
