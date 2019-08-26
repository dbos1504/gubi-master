<div class="container border-b header-pretraga py-1">
    <form action="/search" method="GET">
        <button class="p-2" type="submit"><i class="fas fa-search"></i></button>
        <input type="text" class="p-1" name="search" placeholder="Search...">
    </form>
</div>
<div class="container flex justify-between items-center py-4">
    <div class="logo">
        <a class="navbar-brand" href="/">
            <img src="/img/logo.png" alt="logo">
        </a>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                @foreach($navigation as $nav)
                    <li class="nav-item">
                        <a class="nav-link font-serif text-black" href="{{ $nav->location }}">{{  $nav->name }}</a>
                    </li>
                @endforeach
            </ul>
        </div>
    </nav>
</div>

