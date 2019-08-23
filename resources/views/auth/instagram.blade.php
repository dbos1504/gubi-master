@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif

                        <section class="flex flex-wrap">
                            <aside class="w-1/6 bg-gray-900 p-6">
                                @include('auth.aside')
                            </aside>
                            <main class="w-10/12 p-6">
                                <h3 class="font-serif font-bold text-3xl">Instagram</h3>
                                <hr>
                                <br>
                                <p>First you must get Access Token, please follow this:
                                    <a class="text-black font-bold" target="_blank"
                                       href="https://instagram.pixelunion.net/?error_reason=user_denied&error=access_denied&error_description=The+user+denied+your+request.">
                                        link - access_token.
                                    </a>
                                </p>
                                <p class="my-2">Token format looks something like this <span class="font-bold text-gray-500">8370008889.1677ed0.1751966ae72a4047a0c278b841dfd97a</span></p>
                                <p>After you get Access Token please paste it to required column. That is it.</p>
                                @foreach($instagram as $insta)
                                    <form action="/home/instagram/{{ $insta->id }}" method="POST" class="mt-8">
                                        @csrf
                                        @method('PATCH')
                                        <div class="form-group">
                                            <label class="uppercase text-xs font-bold" for="token">Instagram Access Token:</label>
                                            <input class="form-control" type="text" name="token" id="token" placeholder="Paste Instagram Access Token:">
                                        </div>
                                        <div class="form-group text-right">
                                            <button type="submit" class="text-xs uppercase text-white bg-gray-900 font-bold py-2 px-16 border">Submit token</button>
                                        </div>
                                    </form>
                                @endforeach

                            </main>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection







