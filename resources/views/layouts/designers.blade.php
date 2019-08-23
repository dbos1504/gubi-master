@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">Hönnuðir</h1>
        <hr>
        <div class="designer-names text-center mb-4 mt-6">
            @foreach($designers as $designer)
                <a class="font-serif font-bold text-xs" href="/honnudir/{{ $designer->location }}">{{ $designer->name }}</a>&nbsp; &bullet; &nbsp;
            @endforeach
        </div>
        <hr>
        <div class="designer-images lg:flex lg:flex-wrap mt-16 mb-16">
            @foreach($designers as $designer)
                <div class="lg:w-1/2 relative designer overflow-hidden">
                    <a href="/honnudir/{{ $designer->location }}">
                        <img src="/img/{{ $designer->image }}" alt="{{ $designer->alt }}">
                    </a>
                    <p class="designer-name lg:text-2xl text-center uppercase font-serif lg:p-4 text-black">
                        <a class="inspiration-link p-12 tracking-widest hover:no-underline hover:text-black" href="/honnudir/{{ $designer->location }}">
                            {{ $designer->name }}
                        </a>
                    </p>
                </div>
            @endforeach
        </div>
    </section>
@stop


