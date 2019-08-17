@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">Innblástur</h1>
        <hr>
        <article class="inspiration-links text-center">
            <a class="font-serif font-bold text-xs uppercase text-black" href="/innblastur">Gestrisni</a> &nbsp; &bullet; &nbsp;
            <a class="font-serif font-bold text-xs uppercase text-black" href="/heimilid">Heimilið</a> &nbsp; &bullet; &nbsp;
            <a class="font-serif font-bold text-xs uppercase text-black" href="/vinnusvodi">Vinnusvæði</a> &nbsp; &bullet; &nbsp;
            <a class="font-serif font-bold text-xs uppercase text-black" href="/ur-boklingum">Úr Bæklingum</a> &nbsp; &bullet; &nbsp;
            {{--@foreach($menu as $m)--}}
                {{--<a class="font-serif font-bold text-xs uppercase text-black" href="/ins/{{ $m->location }}">{{ $m->headline }}</a> &nbsp; &bullet; &nbsp;--}}
            {{--@endforeach--}}
        </article>
        <hr>
        <div class="inspiration-images lg:flex lg:flex-wrap mt-16 mb-16">
            @foreach($inspirations as $inspiration)
                <div class="lg:w-1/2 inspiration relative overflow-hidden">
                    <a class="inspiration-link" href="/innblastur/{{ $inspiration->location }}">
                        <img src="/img/{{ $inspiration->image }}" alt="{{ $inspiration->alt }}">
                    </a>
                    <p class="inspiration-name text-2xl text-center uppercase font-serif p-4 text-black">
                        <a class="inspiration-link tracking-widest hover:no-underline hover:text-black" href="/innblastur/{{ $inspiration->location }}">
                            {{ $inspiration->name }}
                        </a>
                    </p>
                </div>
            @endforeach
        </div>
    </section>
@stop


