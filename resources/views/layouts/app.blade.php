<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Gubi') }}</title>

    <!-- Scripts -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900|Source+Sans+Pro:300,400,600,700,900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/5c4b9f650a.js"></script>
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">


    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    <img src="/img/logo.png" alt="logo">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
        </main>
        @include('flash::message')
        <flash message="{{ session('flash') }}"></flash>
    </div>
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://cdn.tiny.cloud/1/pqzo8668c0pqg1f82x0vh2w9c9uzzmaic494i8jwhzx9aemq/tinymce/5/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector:'textarea',
        content_css : '/css/app.css',
        plugins: ['wordcount', 'code']
    });
</script>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(330)
                    .height(300);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script>
    function opti(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();

            reader.onload = function (e) {
                $('#blahhh')
                    .attr('src', e.target.result)
                    .width(120)
                    .height(120);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script>
    $('div.alert').not('.alert-important').delay(4000).fadeOut(350);

    $('#flash-overlay-modal').modal();
</script>
<script>
    function readURLL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();

            reader.onload = function (e) {
                $('#blahh')
                    .attr('src', e.target.result)
                    .width(330)
                    .height(300);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script>
    $(function() {
        let filesInput = document.getElementById("files");
        if (filesInput) {
            filesInput.addEventListener("change", function(event){
                let files = event.target.files; //FileList object
                let output = document.getElementById("result");
                for(let i = 0; i< files.length; i++) {
                    let file = files[i];
                    if(!file.type.match('image'))
                        continue;
                    let picReader = new FileReader();
                    picReader.addEventListener("load",function(event){
                        let picFile = event.target;
                        let div = document.createElement("div");
                        div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "' width='80' height='80'/> <a class='remove_pict cursor-pointer'>X</a><input class='w-full border mt-1' name='name_var" + i +"' type='text'>";
                        output.insertBefore(div,null);
                        div.children[1].addEventListener("click", function(event){
                            div.parentNode.removeChild(div);
                        });
                    });
                    picReader.readAsDataURL(file);
                }
            });
        }
    })
</script>
<script>
    $(function() {
        let filesInput = document.getElementById("variations");
        if (filesInput) {
            filesInput.addEventListener("change", function(event){
                let files = event.target.files; //FileList object
                let output = document.getElementById("results-var");
                for(let i = 0; i< files.length; i++) {
                    let file = files[i];
                    if(!file.type.match('image'))
                        continue;
                    let picReader = new FileReader();
                    picReader.addEventListener("load",function(event){
                        let picFile = event.target;
                        let div = document.createElement("div");
                        div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "' width='80' height='80'/> <a class='remove_pict cursor-pointer'>X</a><input class='w-full border mt-1' name='vari" + i +"' type='text'>";
                        output.insertBefore(div,null);
                        div.children[1].addEventListener("click", function(event){
                            div.parentNode.removeChild(div);
                        });
                    });
                    picReader.readAsDataURL(file);
                }
            });
        }
    })
</script>
<script>
    $(function() {
        let filesInput = document.getElementById("slika");
        if (filesInput) {
            filesInput.addEventListener("change", function(event){
                let files = event.target.files; //FileList object
                let output = document.getElementById("result");
                for(let i = 0; i< files.length; i++) {
                    let file = files[i];
                    if(!file.type.match('image'))
                        continue;
                    let picReader = new FileReader();
                    picReader.addEventListener("load",function(event){
                        let picFile = event.target;
                        let div = document.createElement("div");
                        div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "' width='80' height='80'/> <a class='remove_pict cursor-pointer'>X</a><input class='w-full border mt-1' name='name_var" + i +"' type='text'>";
                        output.insertBefore(div,null);
                        div.children[1].addEventListener("click", function(event){
                            div.parentNode.removeChild(div);
                        });
                    });
                    picReader.readAsDataURL(file);
                }
            });
        }
    })
</script>
<script>
    $(function() {
        let filesInput = document.getElementById("inspiration");
        if (filesInput) {
            filesInput.addEventListener("change", function(event){
                let files = event.target.files; //FileList object
                let output = document.getElementById("results-insp");
                for(let i = 0; i< files.length; i++) {
                    let file = files[i];
                    if(!file.type.match('image'))
                        continue;
                    let picReader = new FileReader();
                    picReader.addEventListener("load",function(event){
                        let picFile = event.target;
                        let div = document.createElement("div");
                        div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "' width='80' height='80'/> <a class='remove_pict cursor-pointer'>X</a><input class='w-full border mt-1' name='name_var" + i +"' type='text'>";
                        output.insertBefore(div,null);
                        div.children[1].addEventListener("click", function(event){
                            div.parentNode.removeChild(div);
                        });
                    });
                    picReader.readAsDataURL(file);
                }
            });
        }
    })
</script>
<script>
    setTimeout(() => {
        $('.alert-danger').css('display', 'none')
    }, 4000)
</script>