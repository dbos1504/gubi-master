@extends('welcome')

@section('content')
    <section class="container">
        <hr>
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
            <p class="text-center">
                <a class="text-base uppercase bg-black text-white py-2 px-10" href="/vorur">Vörur</a>
            </p>
        </section>
        <hr>
        <section class="home-featured mb-12">
            <h2 class="text-3xl text-center uppercase font-serif p-4 text-black">FEATURED COLLECTIONS</h2>
        </section>
        <hr>
        <section class="home-instagram mb-12">
            <h2 class="text-3xl text-center uppercase font-serif p-4 text-black">GUBI á Instagram</h2>
            <p class="text-center text-base italic text-gray-500 font-serif">@gubiofficial</p>
        </section>
    </section>
@stop

