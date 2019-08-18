@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">{{ $inspiration->name }}</h1>
        <div class="mt-3 text-center font-serif text-black text-sm mb-8">{!! $inspiration->description !!}</div>
        <hr>
        <article class="inspiration-images my-8">
            @if ($inspiration->gallery_status == 1)
                <slider :data="{{ $inspiration->images }}"></slider>
            @endif
        </article>
        <div class="insp-body">
            {!! $inspiration->body !!}
        </div>
        <hr>
        <div class="designer-names text-center w-1/3 mx-auto mb-4 mt-6">
            <a class="font-serif font-bold text-xs" href="/innblastur">ALL</a>&nbsp; &bullet; &nbsp;
            @foreach($inspirations as $inspiration)
                <a class="font-serif font-bold text-xs uppercase" href="/innblastur/{{ $inspiration->location }}">{{ $inspiration->name }}</a>&nbsp; &bullet; &nbsp;
            @endforeach
        </div>
    </section>
@stop


