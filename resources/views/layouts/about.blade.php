@extends('welcome')

@section('content')
    <section class="container mb-6 tablet-cont">
        @foreach ($abouts as $about)
            <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">{{ $about->headline }}</h1>
            <p class="text-center p-4 lg:w-3/5 mx-auto text-gray-800 mb-6">{{ $about->body }}</p>
        @endforeach
        <div class="mx-auto lg:w-3/4">
            <img src="/img/about.jpg" alt="about">
        </div>
    </section>
@stop

