<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-teal" href="{{ url('/') }}">PenjahitKu</a>

        <div class="d-flex align-items-center ms-auto">
            <!-- Tombol Keranjang: ganti sesuai implementasi keranjang di projectmu -->
            <a href="{{ route('cart.index') }}" class="btn btn-outline-secondary me-3">
                <i class="fa fa-shopping-cart"></i>
                Keranjang ({{ \Cart::count() ?? 0 }})
            </a>

            @auth
                <!-- Tombol Loyalty: buka di tab baru. Gunakan config('loyalty.url') atau env fallback -->
                <a href="{{ rtrim(config('loyalty.url', env('LOYALTY_APP_URL')), '/') }}/dashboard"
                   target="_blank"
                   rel="noopener noreferrer"
                   class="btn btn-outline-info me-3 btn-loyalty">
                    <i class="fa fa-gem"></i>
                    Loyalty
                </a>

                <span class="me-2">Halo, {{ Auth::user()->name }}!</span>

                <form method="POST" action="{{ route('logout') }}" class="d-inline">
                    @csrf
                    <button class="btn btn-danger">Logout</button>
                </form>
            @else
                <a href="{{ route('login') }}" class="btn btn-primary">Login</a>
            @endauth
        </div>
    </div>
</nav>