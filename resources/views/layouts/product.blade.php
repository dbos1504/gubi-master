@extends('welcome')

@section('content')
    <section class="container lg:flex lg:flex-wrap">
        <aside class="lg:w-1/4 border-t lg:pr-6">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="navbar navbar-expand-lg navbar-light">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#cate" aria-controls="cate" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="cate">
                        @foreach($categories as $category)
                            <div class="panel panel-default border-b">
                                <div class="panel-heading" role="tab" id="heading{{ $category->id }}">
                                    <h4 class="panel-title py-3 text-base">
                                        <a data-toggle="{{ count($category->subcategory) == 0 ? 'collapse-nema' : 'collapse' }}"
                                           class="collapsed font-medium {{ $product->categories_id ==  $category->id ? 'font-bold' : ''}}" data-parent="#accordion"
                                           href="{{ count($category->subcategory) == 0 ? '/category/'. $category->location : '#collapse' . $category->id}}"
                                           aria-expanded="true" aria-controls="collapse{{ $category->id }}">
                                            {{ $category->name }}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse{{ $category->id }}"
                                     class="panel-collapse collapse in {{ $product->categories_id == $category->id ? 'show' : ''}}"
                                     role="tabpanel" aria-labelledby="heading{{ $category->id }}">
                                    <div class="panel-body text-sm">
                                        <ul>
                                            @foreach($category->subcategory as $sub)
                                                <li class="py-1"><a class="{{ $product->sub_category_id == $sub->id ? 'font-bold' : '' }}" href="/subcategories/{{ $sub->location }}">{{ $sub->headline }}</a></li>
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
        <article class="lg:w-3/4 border-t">
            <product :data="{{ $product }}" inline-template>
                <section class="lg:flex lg:flex-wrap px-4 py-2 -mr-4 mt-3">
                    <article class="lg:w-1/2">
                        <!-- MAIN PRODUCT IMAGE -->
                        <viewer :image="img" :options="{navbar: false, toolbar: false, tooltip: false, title: false}">
                            <img class="cursor-pointer" ref="image" src="/img/products/{{ $product->image }}" alt="{{ $product->alt }}">
                        </viewer>
                        <!-- END MAIN PRODUCT IMAGE -->
                        <!-- GALLERY -->
                        <article class="flex flex-wrap mt-3">
                            @foreach ($product->images as $image)
                                <div class="product-gallery-width">
                                    <img class="cursor-pointer" ref="img" @click.prevent="promena({{ $image }})" src="/img/products/{{ $image->image }}" alt="{{ $image->alt }}">
                                </div>
                            @endforeach
                        </article>
                        <!-- END GALLERY -->
                    </article>
                    <article class="lg:w-1/2 lg:pl-12">
                        <h1 class="text-2xl font-serif py-2 text-black">
                            <a href="/product/{{ $product->location }}">
                                {{ $product->headline }}
                            </a>
                        </h1>
                        @if ($product->price_status == 1)
                            <p class="mt-2 text-2xl text-black font-medium">Price: {{ $product->price }} {{ $product->currency }}</p>
                        @endif
                        <div class="flex mt-2">
                            @foreach($product->variations as $variation)
                                <div class="mr-3 relative">
                                    <label class="text-xs" for="">{{ $variation->name }}</label> <br>
                                    <variation @inquiry="upit"
                                               @varijacija="variacija"
                                               @created="slika"
                                               :data="{{ $variation->subvariations }}"
                                               :product="{{ $product }}"
                                    >
                                    </variation>
                                </div>
                            @endforeach
                                 <div class="{{ count($product->variations) == 0 ? '' : 'ml-1' }}">
                                     <label class="text-xs">Quantity</label>
                                     <input class="p-1 bg-gray-200 w-full" type="number" v-model="qty">
                                 </div>
                        </div>
                        <div class="inquiry mt-6">
                            <inquiry :img="img" :variacija="izmena" :kolicina="qty" :upit="inquirys" :product="{{ $product }}"></inquiry>
                        </div>
                        <div class="product-body mt-8">
                            {!! $product->body !!}
                        </div>
                        <div class="product-social flex mt-6">
                            <a class="mr-2" href="">
                                <img class="pr-2 inline" src="/img/face.svg" alt="facebook">
                                Share
                            </a>
                            <a class="mx-2" href="">
                                <img class="pr-2 inline" src="/img/twitter.svg" alt="twitter">
                                Tweet
                            </a>
                            <a class="mx-2" href="">
                                <img class="pr-2 inline" src="/img/pinterest.svg" alt="pinterest">
                                Pin it
                            </a>
                        </div>
                    </article>
                </section>
            </product>
            <section class="related px-4 py-2">
                <hr>
                <h3 class="text-3xl font-serif py-3 text-black mb-6">Tengdar vörur</h3>
                <section class="flex flex-wrap">
                    @foreach($relateds as $related)
                        @if ($related->id == $product->id)

                        @else
                            <div class="shop-width text-center">
                                <a href="/product/{{ $related->location }}">
                                    <img src="/img/products/{{ $related->image }}" alt="{{ $related->alt }}">
                                </a>
                                <h2 class="text-base mt-3">
                                    <a href="/product/{{ $related->location }}">
                                        <a href="/product/{{ $related->location }}">
                                            {{ $related->headline }}
                                        </a>
                                    </a>
                                </h2>
                            </div>
                        @endif
                    @endforeach
                </section>
            </section>
        </article>
    </section>
@stop

