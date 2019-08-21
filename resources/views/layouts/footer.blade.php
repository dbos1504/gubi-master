
<section class="container text-center">
    <hr class="mb-8">
    {{--    <article class="newsletter">--}}
    {{--        <h6 class="font-serif text-black text-2xl mb-3">NEWSLETTER</h6>--}}
    {{--        <p class="mb-3">Sign up to our newsletter and be the first to know about the latest GUBI news</p>--}}
    {{--        <form action="/newsletter" method="POST">--}}
    {{--            @csrf--}}
    {{--            <input class="p-2 border w-1/4" type="email" name="email" placeholder="Email Addresse">--}}
    {{--            <button class="py-2 px-6 border border-black text-black font-bold" type="submit">SIGN UP</button>--}}
    {{--        </form>--}}
    {{--        <p class="text-xs font-bold mt-4 mb-4">We respect your privacy.</p>--}}
    {{--    </article>--}}
    <article class="footer-menu">
        @foreach($navigation as $nav)
            <a class="font-serif mx-2" href="{{ $nav->location }}">{{ $nav->name }}</a>
        @endforeach
    </article>
    <article class="adresse">
        <h6 class="font-serif font-bold text-sm mt-4">GUBI</h6>
        <p class="mt-2">Skipholt 37, 105 Reykjavík, Iceland</p>
        <p>+354-568-8388</p>
        <h6 class="font-serif font-bold text-sm uppercase mt-4">Opnunartími</h6>
        <p class="mt-2">Mánudaga til föstudaga 9-18 | Laugardaga 11-15 í nóv og des</p>
        <h6 class="font-serif font-bold text-sm uppercase mt-4 mb-3">Fylgstu með okkur</h6>
        <div class="footer-social mb-10 flex justify-center">
            <a class="mx-2" href="">
                <img src="/img/pinterest.svg" alt="Pinterst">
            </a> &nbsp;
            <a class="mx-2" href="">
                <img src="/img/facebook.svg" alt="Facebook">
            </a> &nbsp;
            <a class="mx-2" href="">
                <img src="/img/linkedin.svg" alt="Linkedin">
            </a> &nbsp;
            <a class="mx-2" href="">
                <img src="/img/instagram.svg" alt="Instagram">
            </a>
        </div>
    </article>
</section>

