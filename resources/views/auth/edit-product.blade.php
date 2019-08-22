@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                        <section class="flex flex-wrap">
                            <aside class="w-1/6 bg-gray-900 p-6">
                                @include('auth.aside')
                            </aside>
                            <main class="w-10/12 p-6">
                                <section class="flex">
                                    <div class="w-full mr-3">
                                        <div class="border p-3 mb-3">
                                            <h4 class="font-serif font-bold text=xl">Enable/Disable Price</h4>
                                            <hr>
                                            <form action="/home/{{ $product->location }}/price-status" method="POST">
                                                @csrf
                                                @method('PATCH')
                                                @if ($product->price_status == 1)
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            <span class="font-bold text-base">{{ $product->price }} {{ $product->currency }}</span>  &nbsp;
                                                            Price is <span class="text-green-500">enabled</span>
                                                        </label>
                                                        <input type="hidden" value="0" name="price_status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-red-400 uppercase" type="submit">
                                                            <i class="far fa-eye-slash"></i> &nbsp;
                                                            Disable price
                                                        </button>
                                                    </div>
                                                @else
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            <span class="font-bold text-base">{{ $product->price }} {{ $product->currency }}</span>  &nbsp;
                                                            Price is <span class="text-red-400">disabled</span>
                                                        </label>
                                                        <input type="hidden" value="1" name="price_status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-green-500 uppercase" type="submit">
                                                            <i class="far fa-eye"></i> &nbsp;
                                                            Enable price
                                                        </button>
                                                    </div>
                                                @endif
                                            </form>
                                        </div>
                                    </div>
                                    <div class="w-full">
                                        <div class="border p-3 mb-3">
                                            <h4 class="font-serif font-bold text=xl">Enable/Disable Product</h4>
                                            <hr>
                                            <form action="/home/{{ $product->location }}/product-status" method="POST">
                                                @csrf
                                                @method('PATCH')
                                                @if ($product->status == 1)
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Product is <span class="text-green-500">enabled</span>
                                                        </label>
                                                        <input type="hidden" value="0" name="status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-red-400 uppercase" type="submit">
                                                            <i class="far fa-eye-slash"></i> &nbsp;
                                                            Disable product
                                                        </button>
                                                    </div>
                                                @else
                                                    <div class="flex justify-between items-center">
                                                        <label>
                                                            Product is <span class="text-red-400">disabled</span>
                                                        </label>
                                                        <input type="hidden" value="1" name="status">
                                                        <button class="text-xs font-bold border py-1 px-2 text-green-500 uppercase" type="submit">
                                                            <i class="far fa-eye"></i> &nbsp;
                                                            Enable product
                                                        </button>
                                                    </div>
                                                @endif
                                            </form>
                                        </div>
                                    </div>
                                </section>
                                <form action="/home/{{ $product->location }}/edit" method="POST" class="flex admin-product-form" enctype="multipart/form-data">
                                    <article class="w-3/5 mr-2">
                                        <h3 class="font-serif font-bold text-3xl">Breyta - {{ $product->headline }}</h3>
                                        <p class="mt-3">Product is viewed: &nbsp;  <span class="font-bold border p-1 text-green-500"><i class="far fa-eye"></i>  {{ $product->views }}</span></p>
                                        <br>
                                        @csrf
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="headline">Breyta Headline:</label>
                                            <input class="form-control" type="text" name="headline" id="headline" value="{{ $product->headline }}">
                                        </div>
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="body">Breyta Description for product:</label>
                                            <textarea class="form-control" name="body" id="" cols="30" rows="10">{{ $product->body }}</textarea>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="price">Breyta price (111,111.00):</label>
                                            <input class="form-control" type="text" name="price" id="price" value="{{ $product->price }}">
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="currency">Breyta currency:</label>
                                            <select class="form-control" name="currency" id="currency" size="3">
                                                <option value="0">Breyta currency...</option>
                                                <option {{ $product->currency == 'KR.' ? 'selected' : '' }} value="KR.">KR.</option>
                                                <option {{ $product->currency == '€' ? 'selected' : '' }} value="€">€</option>
                                            </select>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="designers_id">Breyta a designer (optional):</label>
                                            <select class="form-control" name="designers_id" id="designers_id">
                                                <option value="0">Breyta designer...</option>
                                                @foreach($designers as $designer)
                                                    <option {{ $product->designers_id == $designer->id ? 'selected' : '' }} value="{{ $designer->id }}">{{ $designer->id }}. {{ $designer->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="collections_id">Breyta collection (optional):</label>
                                            <select class="form-control" name="collections_id" id="collections_id" size="{{ count($collections) + 1 }}">
                                                <option value="0">Breyta collection...</option>
                                                @foreach($collections as $collection)
                                                    <option {{ $product->collections_id == $collection->id ? 'selected' : '' }} value="{{ $collection->id }}">{{ $collection->id }}. {{ $collection->headline }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="sub">Choose if a product belongs to another category (optional):</label>
                                            <select class="form-control" name="sub" id="sub">
                                                <option value="0">Choose category...</option>
                                                @foreach($categories as $categorie)
                                                    <option {{ $product->sub ==  $categorie->id ? 'selected' : '' }} value="{{ $categorie->id }}">{{ $categorie->id }}. {{ $categorie->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <br>
                                    </article>
                                    <article class="ml-2 w-2/5">
                                        <img src="/img/admin-prod.jpg" alt="img">
                                        <hr><br>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="categories_id">Choose products category:</label>
                                            <select class="form-control" name="categories_id" id="categories_id" size="{{ count($categories) + 1 }}">
                                                <option value="0">Choose category...</option>
                                                @foreach($categories as $categorie)
                                                    <option {{ $product->categories_id ==  $categorie->id ? 'selected' : '' }} value="{{ $categorie->id }}">{{ $categorie->id }}. {{ $categorie->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <hr>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="subcategory_id">Choose products subcategory (optional):</label>
                                            <select class="form-control" name="subcategory_id" id="subcategory_id" size="{{ count($categories) }}">
                                                <option value="0">Choose subcategory...</option>
                                                @foreach($subcategories as $subcategorie)
                                                    <option {{ $product->subcategory_id ==  $subcategorie->id ? 'selected' : '' }} value="{{ $subcategorie->id }}">{{ $subcategorie->id }}. {{ $subcategorie->headline }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="insp-image">Product image:</label>
                                            <div class="w-full text-center p-3">
                                                <img id="blah" src="{{ $product->image ? '/img/products/' . $product->image : '#' }}" alt="Choose image.." />
                                            </div>
                                            <input class="form-control" type="file" name="image" id="insp-image" onchange="readURL(this);">
                                        </div>
                                        <hr>
                                        <div class="form-group border p-3">
                                            <label class="uppercase text-xs font-bold" for="insp-desc">Product image description (optional):</label>
                                            <input class="form-control" type="text" name="alt" id="insp-desc" value="{{ $product->alt }}">
                                        </div>
                                        <hr>
                                        <div class="form-group text-right">
                                            <button type="submit" class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-10 border">Bæta {{ $product->headline }}</button>
                                        </div>
                                    </article>
                                </form>
                                <h3 class="font-serif font-bold text-3xl flex justify-between items-center">
                                    Variations
                                </h3>
                                <hr>
                                <div class="flex justify-between border py-4">
                                    <div class="form-group w-1/4 border-r p-3">
                                        <h4 class="font-bold text-base font-serif" for="insp-image">Product variation:</h4>
                                        <hr>
                                        @foreach ($subvariations as $variation)
                                            @foreach(\App\Variations::where('id', $variation->variations_id)->get() as $id)
                                                <div class="mt-3">
                                                    <form action="/home/{{ $product->location }}/variation/{{ $variation->id }}" method="POST" class="flex justify-between items-center">
                                                        @csrf
                                                        @method('DELETE')
                                                        <p class="text-base font-bold uppercase mb-0" for="color">- {{ $id->name }}</p>
                                                        <button><i class="far fa-trash-alt"></i></button>
                                                    </form>
                                                </div>
                                            @endforeach
                                        @endforeach
                                    </div>
                                    <div class="form-group w-3/4 ml-4 w-full p-3">
                                        <h4 class="font-bold text-2xl font-serif" for="insp-image">Current Product variations images / Text:</h4>
                                        <hr>
                                        <div class="w-full text-center relative flex flex-wrap">
                                            @foreach ($product->subvariations as $img)
                                                @if ($img->image == '')
                                                    <div class="admin-product-gallery-width relative">
                                                        <p class="">
                                                            {{ $img->variation_name }}
                                                        </p><br>
                                                        <form action="/home/{{ $product->location }}/destroy-variation-image/{{ $img->id }}" method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i></button>
                                                        </form>
                                                    </div>
                                                @else
                                                    <div class="admin-product-gallery-width relative">
                                                        <img width="150" height="150" id="blah" src="{{ $img->image ? '/img/products/' . $img->image : '#' }}" alt="Choose image.." />
                                                        <p class="w-full p-1 mt-1 text-xs">{{ $img->name }}</p>
                                                        {{--                                                    <input class="w-full border p-1 mt-1 text-xs" type="text" value="{{ $img->name }}">--}}
                                                        <form action="/home/{{ $product->location }}/destroy-variation-image/{{ $img->id }}" method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i></button>
                                                        </form>
                                                    </div>
                                                @endif
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="w-full flex justify-between mx-auto p-4 border bg-white">
                                    <div class="p-4 w-1/3 border-r">
                                        <h4 class="text-xs font-serif font-bold text-3xl">Add new variation</h4>
                                        <hr>
                                        <form action="/home/{{ $product->location }}/add-variation" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <div class="mt-3" >
                                                <label class="uppercase text-xs font-bold">Choose variation</label><br>
                                                <select class="border p-1 w-full" name="variations_id">
                                                    <option value="0">Choose...</option>
                                                    @foreach($variations as $variation)
                                                        <option value="{{ $variation->id }}">{{ $variation->id }}. {{ $variation->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <button class="text-xs bg-black text-white py-1 px-2 uppercase font-bold mt-2" type="submit">ADD variation</button>
                                        </form>
                                        <br>
                                        <p class="text-xs text-red-600">* In order to see added variation you have to add image for that variation</p>
                                    </div>
                                    <div class="p-4 w-2/3">
                                        <h3 class="font-serif text-3xl font-bold">Add variation images:</h3>
                                        <hr>
                                        <br>
                                        <form action="/home/{{ $product->location }}/add-variation-images" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <input id="variations" type="file" name="images[]"  multiple/>
                                            <div>
                                                <output class="result-add-var" id="results-var" />
                                            </div>
                                            <label class="uppercase text-xs font-bold mt-6" for="">Variation name (if no variations images are provided)</label><br>
                                            <input type="text" name="variation_name" class="border p-1 w-full" placeholder="Variation name...">
                                            <div class="mt-3" >
                                                <label class="uppercase text-xs text-black font-bold" for="">Image is for variation?</label><br>
                                                <select class="border p-1 w-full" name="variations_id">
                                                    <option value="0">Choose...</option>
                                                        @foreach($subvariations as $id)
                                                            @foreach(\App\Variations::where('id', $id->variations_id)->get() as $var)
                                                                <option value="{{ $var->id }}">{{ $var->name }}</option>
                                                            @endforeach
                                                        @endforeach
                                                </select>
                                            </div>
                                            <div class="text-right w-full border-t">
                                                <button class="uppercase mt-2 text-xs font-bold bg-gray-900 text-white py-1 px-4" type="submit">ADD Variation images</button>
                                            </div>
                                        </form>
                                        <p class="text-xs text-red-600">
                                            <img src="/img/select.jpg" alt="selevt">
                                            * When you choose wanted <span class="font-bold">image</span>, please add needed text for variation
                                        </p>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group border p-3">
                                    <h3 class="font-serif text-3xl font-bold">Product gallery:</h3>
                                    <hr>
                                    <br>
                                    <div class="w-full text-center relative flex flex-wrap">
                                        @foreach ($product->images as $img)
                                            <div class="admin-product-gallery-width relative">
                                                <img width="150" height="150" id="blah" src="{{ $img->image ? '/img/products/' . $img->image : '#' }}" alt="Choose image.." />
                                                <p class="w-full p-1 mt-1 text-xs">{{ $img->alt }}</p>
{{--                                                <input class="w-full border p-1 mt-1 text-xs" type="text" value="{{ $img->alt }}">--}}
                                                <form action="/home/{{ $product->location }}/destroy-image/{{ $img->id }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="text-red-400 text-xs" type="submit"><i class="far fa-trash-alt"></i></button>
                                                </form>
                                            </div>
                                        @endforeach
                                    </div>
                                    <br>
                                    <article>
                                        <form action="/home/{{ $product->location }}/add-images" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <input id="files" type="file" name="slika[]"  multiple/>
                                            <div>
                                                <output class="result-add" id="result" />
                                            </div>
                                            <div class="text-right w-full border-t">
                                                <button class="uppercase mt-2 text-xs font-bold bg-gray-900 text-white py-1 px-4" type="submit">ADD Gallery IMAGES</button>
                                            </div>
                                        </form>
                                    </article>
                                </div>
                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
