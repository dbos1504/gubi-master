<?php


Route::get('/', 'ProjectController@index');

Route::get('/vorur', 'CategoriesController@index');

Route::get('/product/{product}', 'ProductsController@show');

Route::get('/category/{cat}', 'CategoriesController@show');

Route::get('/subcategories/{subcategory}', 'SubcategoryController@show');

Route::get('/inspirations', 'InspirationsController@index');
Route::get('/inspirations/{inspiration}', 'InspirationsController@show');

Route::get('/frettir', 'NewsController@index');
Route::get('/frettir/{news}', 'NewsController@show');

Route::get('/um-okkur', 'AboutController@index');

Route::get('/hafdu-samband', 'ContactController@index');
Route::post('/hafdu-samband', 'ContactController@store');


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/home/products', 'HomeController@products')->name('home-products');
Route::get('/home/add-product', 'HomeController@addProduct')->name('home-add-product');
Route::get('/home/{product}/edit', 'HomeController@editProduct');
Route::post('/home/{product}/edit', 'HomeController@editProductStore');
Route::patch('/home/{product}/price-status', 'HomeController@editPriceStatus');

Route::post('/home/{product}/add-variation', 'HomeController@addVariation');
Route::post('/home/{product}/add-variation-images', 'HomeController@addVariationImages');
Route::post('/home/{product}/add-i