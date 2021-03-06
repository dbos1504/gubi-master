@extends('welcome')

@section('content')
    <section class="container lg:flex lg:flex-wrap md:flex md:flex-wrap tablet-width">
        <aside class="lg:w-1/4 md:w-1/4 border-t lg:pr-6">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="navbar tablet navbar-expand-lg navbar-light">
                    <button class="navbar-toggler mx-auto" type="button" data-toggle="collapse" data-target="#cate" aria-controls="cate" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="cate">
                        @foreach($categories as $category)
                            <div class="panel panel-default border-b">
                                <div class="panel-heading" role="tab" id="heading{{ $category->id }}">
                                    <h4 class="panel-title py-3 text-base">
                                        <a data-toggle="{{ count($category->subcategory) == 0 ? 'collapse-nema' : 'collapse' }}"
                                           class="collapsed font-medium {{ $cat->name ==  $category->name ? 'font-bold' : ''}}" data-parent="#accordion"
                                           href="{{ count($category->subcategory) == 0 ? '/category/'. $category->location : '#collapse' . $category->id}}"
                                           aria-expanded="true" aria-controls="collapse{{ $category->id }}">
                                            {{ $category->name }}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse{{ $category->id }}"
                                     class="panel-collapse collapse in"
                                     role="tabpanel" aria-labelledby="heading{{ $category->id }}">
                                    <div class="panel-body text-sm">
                                        <ul>
                                            @foreach($category->subcategory as $sub)
                                                <li class="py-1"><a href="/subcategories/{{ $sub->location }}">{{ $sub->headline }}</a></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </aside>
        <article class="lg:w-3/4 md:w-3/4 main-shop border-t">
            <h1 class="text-3xl font-serif py-3 px-4 text-black">{{ $cat->name }}</h1>
            <section class="products tablet flex flex-wrap px-4 py-2 -mr-4">
                @foreach($cat->products as $product)
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
        </article>
    </section>
@stop



