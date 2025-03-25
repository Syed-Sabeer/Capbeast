@extends('main.layouts.master')


@section('main-container')
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aldrich|Allan|Allerta|Allerta+Stencil|Anton|Archivo+Black|Arvo|Atomic+Age|Audiowide|Bangers|Berkshire+Swash|Bitter|Black+Ops+One|Butcherman|Calligraffitti|Ceviche+One|Changa+One|Chewy|Comfortaa|Coming+Soon|Contrail+One|Courgette|Coustard|Crafty+Girls|Domine|Fjalla+One|Fontdiner+Swanky|Francois+One|Geostar+Fill|Gloria+Hallelujah|Graduate|Grand+Hotel|Griffy|Hanalei+Fill|Indie+Flower|Jockey+One|Kaushan+Script|Keania+One|La+Belle+Aurore|Leckerli+One|Lilita+One|Lily+Script+One|Lobster|Marck+Script|Merienda+One|Mountains+of+Christmas|Mr+Dafoe|Nosifer|Nunito|Orbitron|Pacifico|Passero+One|Pathway+Gothic+One|Permanent+Marker|Piedra|Pirata+One|Plaster|Playball|Press+Start+2P|Quantico|Racing+Sans+One|Rationale|Rock+Salt|Ruslan+Display|Sancreek|Shadows+Into+Light+Two|Shojumaru|Sigmar+One|Six+Caps|Slackey|Special+Elite|UnifrakturCook|UnifrakturMaguntia|Waiting+for+the+Sunrise|Yanone+Kaffeesatz">


    @component('main.components.breadcrumb', [
        'pageTitle' => 'Product Details',
        'pageRoute' => '',
        'imageURL' => asset('assetsMain/images/PDetails.jpg'), // Evaluated here
    ])
    @endcomponent

<style>
    .avatar-xs{
  height: 2rem;
    width: 2rem;
}
</style>

    <section class="section pt-0 pb-0">
        <h4 class="lh-base mb-1 p-3 mt-3"
            style="font-size: 2rem; color: #00000; background-color: rgba(34, 34, 34, 0.1); text-align: center">
            {{ $product->title }}
        </h4>
        
    </section>

    {{-- <section class="section">
        <div class="container">
            <div class="row gx-2">
                <div class="slider-container mt-3">
                    <button class="ProductSliderArrow left" onclick="changeSlide(-1)">&lt;</button> --}}

                    <!-- Display main product image (first base image) -->
                    {{-- <img src="{{ asset('storage/' . ($product->productBaseImages->first()->base_image ?? 'placeholder.png')) }}"
                        alt="Main Product" class="main-image" id="mainImage"> --}}

                    {{-- <button class="ProductSliderArrow right" onclick="changeSlide(1)">&gt;</button>

                    <div class="thumbnail-container"> --}}
                        <!-- Display all product base images as thumbnails -->
                        {{-- @foreach ($product->productBaseImages as $image)
                            <img src="{{ asset('storage/' . $image->base_image) }}" alt="Product Thumbnail"
                                class="thumbnail {{ $loop->first ? 'active' : '' }}" onclick="changeImage(this)">
                        @endforeach --}}

                        <!-- Display color-related images if available -->
                        {{-- @if ($product->productColors && $product->productColors->isNotEmpty())
                            @foreach ($product->productColors as $color)
                                <img src="{{ asset('storage/' . $color->image) }}" alt="Color Thumbnail" class="thumbnail"
                                    data-color-id="{{ $color->id }}" onclick="changeImage(this)">
                            @endforeach
                        @endif --}}
{{-- 
                    </div>
                </div>


                
                <div class="col-lg-8 ms-auto">

                    <div class="container">
                        <div class="customization-section bg-white border border-light" id="customization-section">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="d-flex align-items-center">
                                    <div class="step me-3">
                                        <strong>STEP 1</strong>
                                    </div>
                                    <h2 class="h4 mb-0">Enter Quantity</h2>
                                </div>
                                <div class="price-details">
                                    Total Qty: <span class="total-qty">0</span> | Price: 
                                 
                                    <span id="total-price">0.00</span>
                                 
                                </div>
                            </div>
                            
                            <div>
                                <input type="number" id="quantity-input" placeholder="Qty" class="form-control"
                                    min="0">
                            </div>
                        </div>
                    </div>

                </div>
            </div>


        </div>
        
        </div>
        
    </section> --}}





    <section class="section">
        <div class="container">
            <div class="row gx-2">
                <div class="slider-container mt-3">
                    <button class="ProductSliderArrow left" onclick="changeSlide(-1)">&lt;</button>


                    <img src="{{ asset('storage/' . (
                                $product->productColors->first()->front_image 
                                ?? $product->productColors->first()->right_image 
                                ?? $product->productColors->first()->left_image 
                                ?? $product->productColors->first()->back_image 
                                ?? 'ProductImages/default.jpg'
                            )) }}"
                        alt="Main Product" class="main-image" id="mainImage">

                    <button class="ProductSliderArrow right" onclick="changeSlide(1)">&gt;</button>

                    <div class="thumbnail-container">
                        <!-- Display all product base images as thumbnails -->
                        {{-- @foreach ($product->productBaseImages as $image)
                            <img src="{{ asset('storage/' . $image->base_image) }}" alt="Product Thumbnail"
                                class="thumbnail {{ $loop->first ? 'active' : '' }}" onclick="changeImage(this)">
                        @endforeach --}}

                        <!-- Display color-related images if available -->
                        {{-- @if ($product->productColors && $product->productColors->isNotEmpty())
                            @foreach ($product->productColors as $color)
                                <img src="{{ asset('storage/' . $color->image) }}" alt="Color Thumbnail" class="thumbnail"
                                    data-color-id="{{ $color->id }}" onclick="changeImage(this)">
                            @endforeach
                        @endif --}}

                    </div>
                </div>
                <div class="col-lg-5 ms-auto">
                    <div class="ecommerce-product-widgets mt-4 mt-lg-0">
                        <div class="mb-4">
                            <div class="d-flex gap-3 mb-2">
                                <div class="fs-15 text-warning">
                                    <i class="ri-star-fill align-bottom"></i>
                                    <i class="ri-star-fill align-bottom"></i>
                                    <i class="ri-star-fill align-bottom"></i>
                                    <i class="ri-star-fill align-bottom"></i>
                                    <i class="ri-star-half-fill align-bottom"></i>
                                </div>
                                <span class="fw-medium"> (50 Review)</span>
                            </div>
                            <h4 class="lh-base mb-1">Opinion Striped Round Neck Green T-shirt</h4>
                            <p class="text-muted mb-4">The best part about stripped t shirt denim & white sneakers or wear it with a cool chinos and blazer to dress up <a href="javascript:void(0);" class="link-info">Read More</a></p>
                            <h5 class="fs-24 mb-4">$185.79 <span class="text-muted fs-14"><del>$280.99</del></span> <span class="fs-14 ms-2 text-danger"> (50% off)</span></h5>
                            <ul class="list-unstyled vstack gap-2">
                                <li class=""><i class="bi bi-check2-circle me-2 align-middle text-success"></i>In stock</li>
                                <li class=""><i class="bi bi-check2-circle me-2 align-middle text-success"></i>Free delivery available</li>
                                <li class=""><i class="bi bi-check2-circle me-2 align-middle text-success"></i>Sales 10% Off Use Code: <b>FASHION10</b></li>
                            </ul>
                            <h6 class="fs-14 text-muted mb-3">Available offers :</h6>
                            <ul class="list-unstyled vstack gap-2 mb-0">
                                <li>
                                    <div class="d-flex gap-3">
                                        <div class="flex-shrink-0">
                                            <i class="bi bi-tag-fill text-success align-middle fs-15"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <b>Bank Offer</b> 10% instant discount on Federal Bank Debit Cards, up to ₹3000 on orders of ₹5,000 and above <a href="#!" data-bs-toggle="tooltip" data-bs-title="Terms & Conditions">T&C</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex gap-3">
                                        <div class="flex-shrink-0">
                                            <i class="bi bi-tag-fill text-success align-middle fs-15"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <b>Bank Offer</b> 10% instant discount on Federal Bank Debit Cards, up to ₹3000 on orders of ₹5,000 and above <a href="#!" data-bs-toggle="tooltip" data-bs-title="Terms & Conditions">T&C</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="d-flex align-items-center mb-4">
                            <h5 class="fs-15 mb-0">Quantity:</h5>
                            <div class="input-step ms-2">
                                <button type="button" class="minus">–</button>
                                <input type="number" class="product-quantity1" value="1" min="0" max="100" readonly="">
                                <button type="button" class="plus">+</button>
                            </div>
                        </div>
                        <div class="row gy-3">
                            <div class="col-md-6">
                                <div>
                                    <h6 class="fs-14 fw-medium text-muted">Sizes:</h6>
                                    <ul class="clothe-size list-unstyled hstack gap-2 mb-0 flex-wrap">
                                        <li> <input type="radio" name="sizes7" id="product-color-72"> <label class="avatar-xs btn btn-soft-primary text-uppercase p-0 fs-12 d-flex align-items-center justify-content-center rounded-circle" for="product-color-72">s</label> </li>
                                        <li> <input type="radio" name="sizes7" id="product-color-73"> <label class="avatar-xs btn btn-soft-primary text-uppercase p-0 fs-12 d-flex align-items-center justify-content-center rounded-circle" for="product-color-73">m</label> </li>
                                        <li> <input type="radio" name="sizes7" checked id="product-color-74"> <label class="avatar-xs btn btn-soft-primary text-uppercase p-0 fs-12 d-flex align-items-center justify-content-center rounded-circle" for="product-color-74">l</label> </li>
                                        <li> <input type="radio" name="sizes7" id="product-color-75"> <label class="avatar-xs btn btn-soft-primary text-uppercase p-0 fs-12 d-flex align-items-center justify-content-center rounded-circle" for="product-color-75">xl</label> </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h6 class="fs-14 fw-medium text-muted">Colors: </h6>
                                <ul class="clothe-colors list-unstyled hstack gap-1 mb-0 flex-wrap ms-2">
                                    <li>
                                        <input type="radio" name="sizes" id="product-color-2">
                                        <label class="avatar-xs btn btn-info p-0 d-flex align-items-center justify-content-center rounded-circle" for="product-color-2"></label>
                                    </li>
                                    <li>
                                        <input type="radio" name="sizes" id="product-color-3">
                                        <label class="avatar-xs btn btn-light p-0 d-flex align-items-center justify-content-center rounded-circle" for="product-color-3"></label>
                                    </li>
                                    <li>
                                        <input type="radio" name="sizes" id="product-color-4" checked>
                                        <label class="avatar-xs btn btn-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="product-color-4"></label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section pt-0">
        <div class="container">           
            <div class="row">
                <div class="col-lg-12">
                    <ul class="nav nav-tabs nav-tabs-custom mb-3" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#home1" role="tab">
                                Description
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#profile1" role="tab">
                                Ratings & Reviews
                            </a>
                        </li>
                    </ul>
                    
                    <!-- Tab panes -->
                    <div class="tab-content text-muted">
                        <div class="tab-pane active" id="home1" role="tabpanel">
                            <table class="table table-sm table-borderless align-middle">
                                <tr>
                                    <th>Type</th>
                                    <td>Round Neck</td>
                                </tr>
                                <tr>
                                    <th>Sleeve</th>
                                    <td>Short Sleeve</td>
                                </tr>
                                <tr>
                                    <th>Fit</th>
                                    <td>Regular</td>
                                </tr>
                                <tr>
                                    <th>Sales Package</th>
                                    <td>1 T shirt</td>
                                </tr>
                                <tr>
                                    <th>Pack of</th>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <th>Style Code</th>
                                    <td>HYP02</td>
                                </tr>
                                <tr>
                                    <th>Neck Type</th>
                                    <td>Round Neck</td>
                                </tr>
                                <tr>
                                    <th>Ideal For</th>
                                    <td>Men</td>
                                </tr>
                                <tr>
                                    <th>Size</th>
                                    <td>L</td>
                                </tr>
                                <tr>
                                    <th>Pattern</th>
                                    <td>Solid</td>
                                </tr>
                                <tr>
                                    <th>Suitable For</th>
                                    <td>Western Wear</td>
                                </tr>
                                <tr>
                                    <th>Fabric Care</th>
                                    <td>Do not bleach</td>
                                </tr>
                                <tr>
                                    <th>Seller</th>
                                    <td>Zibra Fashion</td>
                                </tr>
                                <tr>
                                    <th>Color</th>
                                    <td>
                                        <div class="avatar-xs">
                                            <div class="avatar-title rounded"></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>

                            <p class="text-muted fs-15">Clothing serves many purposes: it can serve as protection from the elements, rough surfaces, sharp stones, rash-causing plants, insect bites, by providing a barrier between the skin and the environment. It is worth noting that a man's style goes beyond his outward appearance. Style is about more than the clothes you wear. It's who you are on the inside and how you present yourself to the outside world. It's having appreciation and cultivating gratitude.</p>
                        </div>
                        <div class="tab-pane" id="profile1" role="tabpanel">

                            <div>
                                <div class="d-flex flex-wrap gap-4 justify-content-between align-items-center mt-4">
                                    <div class="flex-shrink-0">
                                        <h5 class="fs-15 mb-3 fw-medium">Total Rating's</h5>
                                        <h2 class="fw-bold mb-3">10.14k</h2>
                                        <p class="text-muted mb-0">Growth in reviews on this year</p>
                                    </div>
                                    <hr class="vr">
                                    <div class="flex-shrink-0">
                                        <h5 class="fs-15 mb-3 fw-medium">Average Rating</h5>
                                        <h2 class="fw-bold mb-3">5.6 <span class="fs-16 align-middle text-warning ms-2">
                                            <i class="ri-star-fill"></i>
                                            <i class="ri-star-fill"></i>
                                            <i class="ri-star-fill"></i>
                                            <i class="ri-star-fill"></i>
                                            <i class="ri-star-half-fill"></i>
                                        </span></h2>
                                        <p class="text-muted mb-0">Average rating on this year</p>
                                    </div>
                                    <hr class="vr">
                                    <div class="flex-shrink-0 w-xl">
                                        <div class="row align-items-center g-3 align-items-center mb-2">
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13"><i class="ri-star-fill text-warning me-1 align-bottom"></i>5</h6>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="progress animated-progress progress-sm">
                                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 50.16%" aria-valuenow="50.16" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13">2758</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row align-items-center g-3 mb-2">
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13"><i class="ri-star-fill text-warning me-1 align-bottom"></i>4</h6>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="progress animated-progress progress-sm">
                                                        <div class="progress-bar bg-success" role="progressbar" style="width: 29.32%" aria-valuenow="29.32" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13">1063</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row align-items-center g-3 mb-2">
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13"><i class="ri-star-fill text-warning me-1 align-bottom"></i>3</h6>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="progress animated-progress progress-sm">
                                                        <div class="progress-bar bg-info" role="progressbar" style="width: 18.12%" aria-valuenow="18.12" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13">997</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row align-items-center g-3 mb-2">
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13"><i class="ri-star-fill text-warning me-1 align-bottom"></i>2</h6>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="progress animated-progress progress-sm">
                                                        <div class="progress-bar bg-secondary" role="progressbar" style="width: 4.98%" aria-valuenow="4.98" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13">227</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row align-items-center g-3">
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13"><i class="ri-star-fill text-warning me-1 align-bottom"></i>2</h6>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div>
                                                    <div class="progress animated-progress progress-sm">
                                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 7.42%" aria-valuenow="7.42" aria-valuemin="0" aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <div>
                                                    <h6 class="mb-0 text-muted fs-13">408</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4" data-simplebar style="max-height: 350px">
                                    <div class="d-flex p-3 border-bottom border-bottom-dashed">
                                        <div class="flex-shrink-0 me-3">
                                            <img class="avatar-xs rounded-circle" src="../assets/images/users/avatar-5.jpg" alt="">
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <div>
                                                        <div class="mb-2 fs-12">
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-line text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-line text-warning align-bottom"></i></span>
                                                        </div>
                                                        <h6 class="mb-0">Donald Risher</h6>
                                                    </div>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0 text-muted"><i class="ri-calendar-event-fill me-2 align-middle"></i>Aug 16, 2022</p>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="lh-base fs-15">Design Quality</h5>
                                                <p class="mb-0">
                                                    " This is an incredible framework worth so much in the right hands! Nowhere else are you going to get so much flexibility and great code for a few dollars. Highly recommend purchasing today! Like right now! "
                                                </p>
                                            </div>
                                            <div class="d-flex mt-4">
                                                <div class="flex-shrink-0 me-3">
                                                    <img class="avatar-xs rounded-circle" src="../assets/images/users/avatar-1.jpg" alt="">
                                                </div>
                                                <div class="flex-grow-1">
                                                    <div class="d-flex mb-3">
                                                        <div class="flex-grow-1">
                                                            <div>
                                                                <h6 class="mb-2">Jansh Brown</h6>
                                                                <p class="mb-0 text-muted fs-13">Admin</p>
                                                            </div>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <p class="mb-0 text-muted"><i class="ri-calendar-event-fill me-2 align-middle"></i>Aug 16, 2022</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0">
                                                        Thank You
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex p-3 border-bottom border-bottom-dashed">
                                        <div class="flex-shrink-0 me-3">
                                            <img class="avatar-xs rounded-circle" src="../assets/images/users/avatar-3.jpg" alt="">
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <div>
                                                        <div class="mb-2 fs-12">
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                        </div>
                                                        <h6 class="mb-0">Richard Smith</h6>
                                                    </div>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0 text-muted"><i class="ri-calendar-event-fill me-2 align-middle"></i>Dec 10, 2022</p>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="lh-base fs-15">Feature Availability</h5>
                                                <p class="mb-0">
                                                    " Hello everyone, I would like to suggest here two contents that you could create. Course pages and blog pages. In them you could insert the listing and management of courses and listing and management of blog. The theme is perfect, one of the best purchases I've ever made. "
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex p-3 border-bottom border-bottom-dashed mb-3">
                                        <div class="flex-shrink-0 me-3">
                                            <img class="avatar-xs rounded-circle" src="../assets/images/users/avatar-8.jpg" alt="">
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex mb-3">
                                                <div class="flex-grow-1">
                                                    <div>
                                                        <div class="mb-2 fs-12">
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-half-fill text-warning align-bottom"></i></span>
                                                            <span> <i class="ri-star-line text-warning align-bottom"></i></span>
                                                        </div>
                                                        <h6 class="mb-0">Pauline Moll</h6>
                                                    </div>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <p class="mb-0 text-muted"><i class="ri-calendar-event-fill me-2 align-middle"></i>Aug 16, 2022</p>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="lh-base fs-15">Design Quality</h5>
                                                <p class="mb-0">
                                                    "We have used your other templates as well and seems it's amazing with the design and code quality. Wish you best for the future updates. Keep updated you will be #1 in near future. "
                                                </p>
                                            </div>
                                            <div class="d-flex mt-4">
                                                <div class="flex-shrink-0 me-3">
                                                    <img class="avatar-xs rounded-circle" src="../assets/images/users/avatar-1.jpg" alt="">
                                                </div>
                                                <div class="flex-grow-1">
                                                    <div class="d-flex mb-3">
                                                        <div class="flex-grow-1">
                                                            <div>
                                                                <h6 class="mb-2">Jansh Brown</h6>
                                                                <p class="mb-0 text-muted fs-13">Admin</p>
                                                            </div>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <p class="mb-0 text-muted"><i class="ri-calendar-event-fill me-2 align-middle"></i>Aug 16, 2022</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0">
                                                        Thank You
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="pt-3">
                                    <h5 class="fs-18">Add a Review</h5>
                                    <div>
                                        <form action="#" class="form">
                                            <div class="d-flex align-items-center mb-3">
                                                <span class="fs-14">Your rating:</span>
                                                <div class="ms-3">
                                                    <span class="fs-14"> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span class="fs-14"> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span class="fs-14"> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span class="fs-14"> <i class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span class="fs-14"> <i class="ri-star-half-fill text-warning align-bottom"></i></span>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <input class="form-control" name="your-name" placeholder="Title" type="text">
                                            </div>
                                            <div class="mb-3">
                                                <textarea class="form-control" name="your-comment" placeholder="Enter your comments & reviews" rows="4"></textarea>
                                            </div>
                                            <div class="text-end">
                                                <button class="btn btn-primary btn-hover" type="submit" value="Submit">Send Review <i class="ri-send-plane-2-line align-bottom ms-1"></i></button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end col-->
            </div>
            <!--end row-->
        </div>
    </section>


@endsection 
