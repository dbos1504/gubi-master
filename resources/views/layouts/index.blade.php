@extends('welcome')

@section('content')
    <section class="container">
        <section class="slider mb-6">
            @foreach ($sliders as $slider)
                @if ($slider->gallery_status == 1)
                    <div class="text-center mb-16">
                       <slider-main :data="{{ $slider->images }}"></slider-main>
                        @if ($slider->slider_name)
                            <h2 class="text-3xl text-center uppercase mb-4 font-serif p-4 tracking-wider text-black">
                                {{ $slider->slider_name }}
                            </h2>
                        @endif
                        @if ($slider->location == 'No')
                            @else
                            <a class="bg-black text-white my-3 text-xs font-bold py-3 px-16" href="/collections/{{ $slider->location }}">SEE MORE</a>
                        @endif
                    </div>
                    <hr>
                @endif
            @endforeach
        </section>
        <section class="home-products mb-12">
            <h2 class="text-3xl text-center uppercase font-serif p-4 text-black">NEW ARRIVALS</h2>
            <section class="products lg:flex lg:flex-wrap py-2 -mr-4">
                @foreach($featured as $product)
                    <div class="shop-width text-center">
                        <a href="/product/{{ $product->location }}">
                            <img src="/img/products/{{ $product->image }}" alt="{{ $product->alt }}">
                        </a>
                        <h2 class="text-base mt-3">
                            <a href="/product/{{ $product->location }}">
                                {{ $product->headline }}
                            </a>
                        </h2>
                        @if ($product->price_status == 1)
                            <p class="mt-2 text-base text-black font-medium">{{ $product->price }} {{ $product->currency }}</p>
                        @endif
                    </div>
                @endforeach
            </section>
            <p class="text-center my-4">
                <a class="text-base uppercase bg-black text-white py-2 px-10" href="/vorur">Vörur</a>
            </p>
        </section>
        <hr>
        <section class="home-featured mb-12">
            <h2 class="text-3xl text-center uppercase font-serif p-4 text-black mb-3">FEATURED COLLECTIONS</h2>
            <section class="collections lg:flex">
                @foreach($collections as $collection)
                    <article class="collection mr-4">
                        <a href="/collections/{{ $collection->location }}">
                            <img src="/img/{{ $collection->image }}" alt="{{ $collection->alt }}">
                        </a>
                        <h3 class="font-serif my-4 tracking-wider text-center font-bold texg-xl">{{ $collection->headline }}</h3>
                    </article>
                @endforeach
            </section>
        </section>
        <hr>
        <section class="home-instagram mb-12">
            <h2 class="text-3xl text-center uppercase font-serif p-4 text-black">GUBI á Instagram</h2>
            <p class="text-center text-base italic text-gray-500 font-serif">@gubiofficial</p>
        </section>
    </section>
@stop

