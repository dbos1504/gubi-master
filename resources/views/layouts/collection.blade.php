@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase mb-3 font-serif p-4 text-black">{{ $collection->headline }}</h1>
        <div>
            {!! $collection->body !!}
        </div>
        <section class="collection-options my-8">
               @foreach($collection->options as $option)
                   <section class="lg:flex single-collection items-center mb-8">
                        <article class="lg:w-1/2 pr-16">
                            <h3 class="text-3xl uppercase mb-3 font-serif py-4 text-black">{{ $option->headline }}</h3>
                            <p class="mb-6">{{ $option->body }}</p>
                        </article>
                        <article class="lg:w-1/2 lg:pl-16">
                            <collection-option-slider :data="{{ $option->images }}"></collection-option-slider>
                        </article>
                   </section>
               @endforeach
        </section>
        <p class="text-center p-3 my-10">
            <a class="uppercase text-xs text-black font-bold py-3 px-10 border" href="{{ $collection->where_to_buy }}">Where to buy</a>
        </p>
        <hr>
        <section class="collection-inspiration">
            <h3 class="text-3xl text-center uppercase mb-3 font-serif p-4 text-black">INSPIRATION</h3>
            <p class="text-center w-2/3 mx-auto leading-loose">{{ $collection->inspiration_desc }}</p>
            <article class="flex my-8">
                <slider-collection :data="{{ $collection->images }}"></slider-collection>
            </article>
        </section>
        <hr>
        <section class="collection-products">
            <h3 class="text-3xl text-center uppercase mb-3 font-serif p-4 text-black">{{ $collection->headline }}</h3>
            <p class="text-center w-2/3 mx-auto mb-6 leading-loose">
                @if($collection->id == 1)
                    The Bat collection includes both dining and lounge seating products
                @endif
            </p>
            <article class="lg:flex lg:flex-wrap">
                <collection-product-slider :data="{{ $products }}"></collection-product-slider>
            </article>
            <p class="text-center p-3 my-10">
                <a class="uppercase text-xs text-black font-bold py-3 px-10 border" href="{{ $collection->where_to_buy }}">Explore the collection</a>
            </p>
        </section>
        <hr>
        <section class="collection-designer lg:flex lg:flex-wrap items-center py-8">
            <article class="lg:w-2/6">
                <img src="/img/gamfr.jpg" alt="Gamfratesi">
            </article>
            <article class="lg:w-4/6 lg:px-12">
                <h3 class="text-3xl uppercase mb-4 font-serif pr-4 text-black">GAMFRATESI</h3>
                <p class="text-gray-500">
                    Gamfratesi presented the Beetle Chair for the first time at the exhibition Mindcraft12 in Milan.
                    <br><br>
                    A successful collaboration between GamFratesi and GUBI developed the Beetle project into a large family including chair, stool, lounge and sofa with many bases and structures.
                    <br><br>
                    Discover more GUBI products <a class="text-black" href="/subcategories/gamfratesi">designed by GamFratesi</a>
                    <br><br>
                    GamFratesi belongs to the latest generation of furniture architects. Together they represent a new interpretation of the encounter of Danish with international design traditions.
                    <br><br>
                    Read more about <a class="text-black" href="/honnudir/gamfratesi">GamFratesi</a>
                </p>
            </article>
        </section>
    </section>
@stop
