@extends('main.layouts.master')
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="{{ asset('assetsMain/js/frontend/owl.carousel.min.js')}}"></script>
<link href="{{ asset('assetsMain/css/owl.carousel.min.css')}}" rel="stylesheet" type="text/css" />

@section('main-container')

<section class="position-relative">
    <div class="video-container">
        <video autoplay muted loop playsinline>
            <source src="{{ asset('assetsMain/videos/1.mp4')}}" type="video/mp4" />
            Your browser does not support the video tag.
        </video>
    </div>
</section>

<!-- START PRODUCT -->
<section class="section pt-0 mt-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="text-center">
                    <h3 class="mb-3">Top Picks Products Of The Week</h3>
                    <p class="text-muted fs-15 mb-0">
                        This ranges from women and men's outfits to children's clothing, shoes, accessories, and more. People love their clothes, and fashion isn't going anywhere!
                    </p>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            @foreach ($products as $product)
                <div class="col-md-4 col-lg-3 mb-4">
                    <div class="product-card">
                        <div class="ProductCardBadge">HOT</div>
                        
                        {{-- Check if base_images exists and use default if not --}}
                        <img src="{{ asset('storage/' . ($product->productBaseImages->first()->base_image ?? 'ProductImages/default.jpg')) }}" 
                        alt="product" 
                        class="img-fluid" 
                        id="mainImage{{ $product->id }}">
                   
                        <div class="color-slider-container">
                            <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                            <div class="color-slider" id="colorSlider{{ $product->id }}">
                                {{-- Check if colors exist before looping --}}
                                @if ($product->productColors->isNotEmpty())
                                    @foreach ($product->productColors as $productColor)
                                        <div class="color-option"
                                             style="background-color: {{ $productColor->componentColor->color_code }};"
                                             title="Color: {{ $productColor->componentColor->color_name }}"
                                             data-image="{{ asset('storage/' . $productColor->image) }}">
                                        </div>
                                    @endforeach
                                @else
                                    <p>No colors available</p>
                                @endif
                            </div>
                            <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                        </div>
                        
                        
                      
                      

                        <h5 class="card-title">{{ $product->title }}</h5>
                        <div class="stars">
                            @for ($i = 0; $i < 5; $i++)
                                <i class="fas fa-star"></i>
                            @endfor
                        </div>

                        <form action="{{ route('product.detail', ['id' => $product->id]) }}" method="GET">
                            <button type="submit" class="add-to-cart-btn font-weight-bold">
                                <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                            </button>
                        </form>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="mt-4 text-center">
            <a href="{{ route('products') }}" class="btn btn-soft-primary btn-hover">View All Products <i class="mdi mdi-arrow-right align-middle ms-1"></i></a>
        </div>
    </div>
</section>
<!-- END PRODUCT -->



<div class="container">
    <div class="row justify-content-center g-0">
        <div class="col-lg-7">
            <div class="text-center">
                <h3 class="mb-3">Our Valuable Partners</h3>
                <p class="text-muted fs-15">
                    The most common approach that peoples use to say follow me on Instagram is by sending a direct message.
                </p>
            </div>
        </div>
    </div>
</div>

<div class="logo_wrapper mt-5">
    
    <div class="container">
        <div class="owl-carousel logo_active">
            <img class="img-fluid brand-logo" src="{{ asset('assetsMain/images/fixed/capbeast.png')}}" alt="logo">
            {{-- <img class="img-fluid brand-logo" src="{{ asset('img/47.png')}}" alt="logo"> --}}
            
            {{-- <img class="img-fluid brand-logo" src="{{ asset('img/adidas.png')}}" alt="logo"> --}}
            <img class="img-fluid brand-logo" src="{{ asset('assetsMain/images/fixed/flexfit.png')}}" alt="logo">
            <img class="img-fluid brand-logo" src="{{ asset('assetsMain/images/fixed/oaklay.png')}}" alt="logo">
            {{-- <img class="img-fluid brand-logo" src="{{ asset('img/carhartt.png')}}" alt="logo"> --}}
            <img class="img-fluid brand-logo" src="{{ asset('assetsMain/images/fixed/the-north-face.png')}}" alt="logo">
            <img class="img-fluid brand-logo" src="{{ asset('assetsMain/images/fixed/yapoong.png')}}" alt="logo">
        </div>
    </div>
</div>


    
    
  
<!-- START INSTAGRAM -->
<section class="section pb-0">
    <div class="container">
        <div class="row justify-content-center g-0">
            <div class="col-lg-7">
                <div class="text-center">
                    <h3 class="mb-3">Follow Us On Instagram</h3>
                    <p class="text-muted fs-15">
                        Check out our latest updates and moments on Instagram. Follow us for more!
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="position-relative">
        <div class="row g-0 mt-5">
            @if (!empty($instagramPosts) && count($instagramPosts) > 0)
                @foreach ($instagramPosts as $index => $post)
                    <div class="col {{ $index > 2 ? 'd-none d-lg-block' : '' }}">
                        <div class="insta-img">
                            <a href="{{ $post['link'] }}" target="_blank" class="stretched-link">
                                <img src="{{ $post['image'] }}" class="img-fluid ig-img" alt="Instagram Post" />
                                <i class="ri-instagram-line"></i>
                            </a>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-12 text-center">
                    <p class="text-muted">Unable to fetch Instagram posts at the moment. Please try again later.</p>
                </div>
            @endif
        </div>

        <div class="insta-lable text-center">
            <a href="https://www.instagram.com/monkey_beanies/" target="_blank" class="btn btn-primary btn-hover">
                <i class="ph-instagram-logo align-middle me-1"></i>
                Follow On Instagram
            </a>
        </div>
    </div>
</section>
<!-- END INSTAGRAM -->


<script src="{{ asset('assetsMain/js/frontend/productcardcolorchange.js') }}"></script>
<script type="text/javascript">
        
    function logo_carouselInit() {
        $('.owl-carousel.logo_active').owlCarousel({
            dots: false,
            loop: true,
            margin: 30,
            stagePadding: 2,
            smartSpeed: 1000,
            autoplay: true,
            autoplayTimeout: 1500,
            autoplayHoverPause: true,
            responsive: {
                0: {
                    items: 2
                },
                576: {
                    items: 3,
                },
                768: {
                    items: 4,
                },
                992: {
                    items: 5
                }
            }
        });
    }
    logo_carouselInit();

</script>
@endsection
