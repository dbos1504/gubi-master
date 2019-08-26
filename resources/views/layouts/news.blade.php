@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">Fréttir</h1>
        <hr>
        <article class="news lg:flex lg:flex-wrap lg:items-center md:flex md:flex-wrap md:items-center mt-16">
            @foreach($news as $new)
                <div class="news-width text-center mb-6">
                    <a href="/frettir/{{ $new->location }}">
                        <img src="/img/{{ $new->image }}" alt="{{ $new->alt }}">
                    </a>
                    <h3 class="mt-6">
                        <a class="text-xl text-center uppercase font-serif font-bold text-black hover:no-underline hover:text-black" href="/frettir/{{ $new->location }}">{{ $new->headline }}</a>
                    </h3>
                    <p class="mt-3 italic font-serif text-xs">{{ $new->created_at->format('F j Y') }}</p>
                </div>
            @endforeach
        </article>
    </section>
@stop


