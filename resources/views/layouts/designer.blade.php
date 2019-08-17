@extends('welcome')

@section('content')
    <section class="container">
        <section class="lg:flex lg:flex-wrap pb-20 border-b mt-8">
            <article class="lg:w-1/2 pr-20">
                <img src="/img/{{ $designer->main_image }}" alt="{{ $designer->main_image_alt }}">
            </article>
            <article class="lg:w-1/2 pl-20 designer-desc">
                <h1 class="text-3xl uppercase font-serif mb-6">{{ $designer->name }}</h1>
                <div>
                    {!! $designer->body !!}
                </div>
            </article>
        </section>
        <section class="designer-products">
            <h6 class="text-xs text-center uppercase font-serif mb-6 mt-8 text-black uppercase"> Vörur eftir {{ $designer->name }}</h6>
            <section class="products lg:flex lg:flex-wrap py-2 -mr-4">
                @foreach($products as $product)
                    <div class="designer-product-width mr-4 mb-6">
                        <div class="product-image">
                            <a href="/product/{{ $product->location }}">
                                <img src="/img/products/{{ $product->image }}" alt="{{ $product->alt }}">
                            </a>
                        </div>
                        <h3 class="text-center mt-3">
                            <a href="/product/{{ $product->location }}">
                                {{ $product->headline }}
                            </a>
                        </h3>
                        @if ($product->price_status == 1)
                            <p class="text-center font-bold">{{ $product->price }} {{ $product->currency }}</p>
                        @endif
                    </div>
                @endforeach
            </section>
        </section>
        <hr>
        <div class="designer-names text-center mb-4 mt-6">
            <a class="font-serif font-bold text-xs" href="/honnudir">ALL</a>&nbsp; &bullet;
        @foreach($designers as $designer)
                <a class="font-serif font-bold text-xs" href="/honnudir/{{ $designer->location }}">{{ $designer->name }}</a>&nbsp; &bullet; &nbsp;
            @endforeach
        </div>
    </section>
@stop


