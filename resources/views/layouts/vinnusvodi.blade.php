@extends('welcome')

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">INSPIRATION - CONTRACT</h1>
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
        <p class="text-center font-serif text-xs my-6">View the new contract catalogue <a class="text-black font-bold" href="">here.</a></p>
    </section>
@stop




