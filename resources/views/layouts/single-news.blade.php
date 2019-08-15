@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif font-bold mt-4 mb-6">{{ $news->headline }}</h1>
        <p class="mt-3 italic font-serif text-center text-xs mb-3">{{ $news->created_at->format('F j Y') }}</p>
        <p class="text-center mb-6 lg:w-3/5 m-auto text-gray-800 mb-4">{{ $news->description }}</p>
        <hr>
        <article class="inspiration-images my-8">
{{--            <news-slider :data="{{ $news->images }}"></news-slider>--}}
        </article>
        <section class="social-news text-center flex justify-center mb-16">
            <a class="mx-3" href="">
                <img src="/img/facebook.svg" alt="facebook"> &nbsp; &nbsp;
            </a>
            <a class="mx-3" href="">
                <img src="/img/twitter.svg" alt="twitter"> &nbsp; &nbsp;
            </a>
            <a class="mx-3" href="">
                <img src="/img/tumblir.svg" alt="twitter"> &nbsp; &nbsp;
            </a>
        </section>
        <section class="next- flex justify-between items-center mb-16">
            @if ($previous)
                <p>
                    <span class="text-sm text-gray-700">Previous</span> <br>
                    <a class="font-serif font-bold text-black text-2xl tracking-wider" href="/frettir/{{ $previous->location }}">{{ $previous->headline }}</a>
                </p>
            @else
                <p></p>
            @endif
            @if ($next)
                <p class="text-right">
                    <span class="text-sm text-gray-700">Next</span> <br>
                    <a class="font-serif font-bold text-black text-2xl tracking-wider" href="/frettir/{{ $next->location }}">{{ $next->headline }}</a>
                </p>
            @else
                <p></p>
            @endif
        </section>
    </section>
@stop

