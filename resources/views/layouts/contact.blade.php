@extends('welcome')

@section('script') {!! $map['js'] !!} @stop

@section('content')
    <section class="container">
        <h1 class="text-3xl text-center uppercase font-serif p-4 text-black">Hafðu samband</h1>
        <hr>
        <article class="lg:flex lg:flex-wrap md:flex md:flex-wrap py-10 border-b">
            <div class="contact-addresse">
                <h2 class="text-2xl uppercase font-serif text-black mb-8">GUBI</h2>
                <p class="font-bold text-black mb-3"><strong>Opnunartími</strong></p>
                <p>Alla virka daga frá 9-18</p>
                <p>Laugardaga 11-15 í nóv og des</p>
                <p class="font-bold text-black mb-3 mt-3"><strong>Heimilsfang:</strong></p>
                <p>Skipholt 37, Reykjavík, Ísland</p>
                <p class="font-bold text-black mb-3 mt-3"><strong>Símanúmer:</strong></p>
                <p>568-8388</p>
            </div>
            <div class="contact-map">
                {!! $map['html'] !!}
            </div>
        </article>
        <article class="contact-forma lg:flex lg:flex-wrap md:flex md:flex-wrap py-10">
            <div class="contact-addresse">
                <h2 class="text-3xl uppercase font-serif">Hafðu Samband</h2>
            </div>
            <div class="contact-map">
                <contact></contact>
            </div>
        </article>
    </section>
@stop


