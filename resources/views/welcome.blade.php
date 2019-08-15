<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@yield('title')</title>
        <meta name="description" content="@yield('description')">
        <meta name="keywords" content="@yield('keywords')">

        <meta property="og:url" content="@yield('location')">
        <meta property="og:type" content="article">
        <meta property="og:title" content="@yield('title-meta')">
        <meta property="og:description" content="@yield('description-meta')">
        <meta property="og:image" content="@yield('image')">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Source+Sans+Pro:300,400,600,700,900&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/5c4b9f650a.js"></script>
        <link rel="stylesheet" href="/css/app.css">
        @yield('script')

    </head>
    <body>
        <div id="app">
            <header>
                @include('layouts.header')
            </header>
            <main>
                @yield('content')
            </main>
            <footer>
                @include('layouts.footer')
            </footer>
            <flash message="{{ session('flash') }}"></flash>
        </div>
    </body>
</html>
<script src="/js/app.js"></script>