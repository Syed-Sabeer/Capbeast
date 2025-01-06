<nav class="navbar navbar-expand-lg ecommerce-navbar h-auto" id="navbar">
    <div class="container">
        <a class="navbar-brand d-none d-lg-block" href="{{ route('home') }}">
            <div>
                <img src="{{ asset('assetsMain/images/logo-dark.png') }}" alt="logo image" height="100" />
            </div>
        </a>
        <button class="btn btn-soft-primary btn-icon d-lg-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <i class="bi bi-list fs-20"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-lg-auto mb-2 mb-lg-0" id="navigation-menu">
                <li class="nav-item d-block d-lg-none">
                    <a class="d-block p-3 h-auto text-center" href="{{ route('home') }}">
                        <img src="{{ asset('assetsMain/images/logo-dark.png') }}" alt height="25" class="card-logo-dark mx-auto" />
                        <img src="{{ asset('assetsMain/images/logo-light.png') }}" alt height="25"
                            class="card-logo-light mx-auto" />
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('home') }}" data-key="t-home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('about') }}" data-key="t-about">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('products') }}" data-key="t-shop">Shop</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('faqs') }}" data-key="t-faqs">FAQs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('contact') }}" data-key="t-contact">Contact</a>
                </li>
            </ul>
        </div>
        <div class="bg-overlay navbar-overlay" data-bs-toggle="collapse"  data-bs-target="#navbarSupportedContent.show"></div>

        <div class="d-flex align-items-center">
            <button type="button" class="btn btn-icon btn-topbar btn-ghost-dark rounded-circle text-muted" data-bs-toggle="modal" data-bs-target="#searchModal">
                <i class="bx bx-search fs-22"></i>
            </button>
            <div class="topbar-head-dropdown ms-1 header-item">
                <button type="button" class="btn btn-icon btn-topbar btn-ghost-dark rounded-circle text-muted" 
                        data-bs-toggle="offcanvas" data-bs-target="#ecommerceCart" 
                        aria-controls="ecommerceCart" onclick="window.location.href='{{ route('cart') }}';">
                    <i class="ph-shopping-cart fs-18"></i>
                    <span class="position-absolute topbar-badge cartitem-badge fs-10 translate-middle badge rounded-pill bg-danger">4</span>
                </button>
            </div>
            

            {{-- <div class="dropdown topbar-head-dropdown ms-2 header-item dropdown-hover-end">
                <button type="button" class="btn btn-icon btn-topbar btn-ghost-dark rounded-circle text-muted" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="bi bi-sun align-middle fs-20"></i>
                </button>
                <div class="dropdown-menu p-2 dropdown-menu-end" id="light-dark-mode">
                    <a href="#!" class="dropdown-item" data-mode="light"><i class="bi bi-sun align-middle me-2"></i> Default (light mode)</a>
                    <a href="#!" class="dropdown-item" data-mode="dark"><i class="bi bi-moon align-middle me-2"></i> Dark</a>
                    <a href="#!" class="dropdown-item" data-mode="auto"><i class="bi bi-moon-stars align-middle me-2"></i> Auto (system default)</a>
                </div>
            </div> --}}
            <div class="dropdown header-item dropdown-hover-end">
                <button type="button" class="btn" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="rounded-circle header-profile-user" src="../assets/images/users/avatar-1.jpg" alt="Header Avatar">
                </button>
                <!-- <button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="ph-user-circle fs-22"></i>
                </button>    -->
                <div class="dropdown-menu dropdown-menu-end">
                    <!-- item-->
                    @auth
                    <h6 class="dropdown-header">Welcome  {{ Auth::user()->email }}</h6>
                   
                    <a class="dropdown-item" href="order-history.html"><i
                            class="bi bi-cart4 text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle">Order History</span></a>
                    <a class="dropdown-item" href="track-order.html"><i
                            class="bi bi-truck text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle">Track Orders</span></a>
                    <a class="dropdown-item" href="../backend/index.html"><i
                            class="bi bi-speedometer2 text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle">Dashboard</span></a>
                    <a class="dropdown-item" href="ecommerce-faq.html"><i
                            class="mdi mdi-lifebuoy text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle">Help</span></a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="account.html"><i
                            class="bi bi-coin text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle">Balance : <b>$8451.36</b></span></a>
                    <a class="dropdown-item" href="account.html">
                        <i class="mdi mdi-cog-outline text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle">Settings</span></a>

                    <!-- Logout Form -->
                    <form action="{{ route('user.logout') }}" method="POST">
                        @csrf
                        <button type="submit" class="dropdown-item">
                            <i class="bi bi-box-arrow-right text-muted fs-16 align-middle me-1"></i>
                            <span class="align-middle" data-key="t-logout">Logout</span>
                        </button>
                    </form>

                    @else

                    <a href="{{ route('user.login') }}" class="dropdown-item"><i
                            class="bi bi-box-arrow-right text-muted fs-16 align-middle me-1"></i>
                        <span class="align-middle" data-key="t-logout">Login</span></a>
                    @endauth

                </div>
            </div>
        </div>
    </div>
</nav>
