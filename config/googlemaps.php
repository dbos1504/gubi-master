<?php
return [
    'key' => env('GOOGLE_MAPS_API_KEY', 'AIzaSyAm2zknIbh2-03j_CZerHdr15zqSxp4jN0'), //Get API key: https://code.google.com/apis/console
    'adsense_publisher_id' => env('GOOGLE_ADSENSE_PUBLISHER_ID', ''), //Google AdSense publisher ID

    'geocode' => [
        'cache' => false, //Geocode caching into database
        'table_name' => 'gmaps_geocache', //Geocode caching database table name
    ],

    'css_class' => 'test', //Your custom css class

    'http_proxy' => env('HTTP_PROXY', null), // Proxy host and port
];

