@extends('main.layouts.master')

@section('main-container')


  <!--cart -->
  <div class="offcanvas offcanvas-end product-list" tabindex="-1" id="ecommerceCart"
  aria-labelledby="ecommerceCartLabel">
  <div class="offcanvas-header border-bottom">
      <h5 class="offcanvas-title" id="ecommerceCartLabel">
          My Cart
          <span class="badge bg-danger align-middle ms-1 cartitem-badge">4</span>
      </h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body px-0">
      <div data-simplebar class="h-100">
          <ul class="list-group list-group-flush cartlist">
              <li class="list-group-item product">
                  <div class="d-flex gap-3">
                      <div class="flex-shrink-0">
                          <div class="avatar-md" style="height: 100%">
                              <div class="avatar-title bg-warning-subtle rounded-3">
                                  <img src="../assetsMain/images/products/img-4.png" alt="" class="avatar-sm" />
                              </div>
                          </div>
                      </div>
                      <div class="flex-grow-1">
                          <a href="#!">
                              <h5 class="fs-15">Borosil Paper Cup</h5>
                          </a>
                          <div class="d-flex mb-3 gap-2">
                              <div class="text-muted fw-medium mb-0">
                                  $<span class="product-price">24.00</span>
                              </div>
                              <div class="vr"></div>
                              <span class="text-success fw-medium">In Stock</span>
                          </div>
                          <div class="input-step">
                              <button type="button" class="minus">–</button>
                              <input type="number" class="product-quantity" value="2" min="0" max="100"
                                  readonly />
                              <button type="button" class="plus">+</button>
                          </div>
                      </div>
                      <div class="flex-shrink-0 d-flex flex-column justify-content-between align-items-end">
                          <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                              data-bs-toggle="modal" data-bs-target="#removeItemModal">
                              <i class="ri-close-fill fs-16"></i>
                          </button>
                          <div class="fw-medium mb-0 fs-16">
                              $<span class="product-line-price">48.00</span>
                          </div>
                      </div>
                  </div>
              </li>
              <li class="list-group-item product">
                  <div class="d-flex gap-3">
                      <div class="flex-shrink-0">
                          <div class="avatar-md" style="height: 100%">
                              <div class="avatar-title bg-info-subtle rounded-3">
                                  <img src="../assetsMain/images/products/img-1.png" alt="" class="avatar-sm" />
                              </div>
                          </div>
                      </div>
                      <div class="flex-grow-1">
                          <a href="#!">
                              <h5 class="fs-15">Rockerz Ear Bluetooth Hea...</h5>
                          </a>
                          <div class="d-flex mb-3 gap-2">
                              <div class="text-muted fw-medium mb-0">
                                  $<span class="product-price">160.00</span>
                              </div>
                              <div class="vr"></div>
                              <span class="text-success fw-medium">In Stock</span>
                          </div>
                          <div class="input-step">
                              <button type="button" class="minus">–</button>
                              <input type="number" class="product-quantity" value="1" min="0" max="100"
                                  readonly />
                              <button type="button" class="plus">+</button>
                          </div>
                      </div>
                      <div class="flex-shrink-0 d-flex flex-column justify-content-between align-items-end">
                          <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                              data-bs-toggle="modal" data-bs-target="#removeItemModal">
                              <i class="ri-close-fill fs-16"></i>
                          </button>
                          <div class="fw-medium mb-0 fs-16">
                              $<span class="product-line-price">160.00</span>
                          </div>
                      </div>
                  </div>
              </li>
              <li class="list-group-item product">
                  <div class="d-flex gap-3">
                      <div class="flex-shrink-0">
                          <div class="avatar-md" style="height: 100%">
                              <div class="avatar-title bg-danger-subtle rounded-3">
                                  <img src="../assetsMain/images/products/img-6.png" alt="" class="avatar-sm" />
                              </div>
                          </div>
                      </div>
                      <div class="flex-grow-1">
                          <a href="#!">
                              <h5 class="fs-15">Monte Carlo Sweaters</h5>
                          </a>
                          <div class="d-flex mb-3 gap-2">
                              <div class="text-muted fw-medium mb-0">
                                  $ <span class="product-price">244.99</span>
                              </div>
                              <div class="vr"></div>
                              <span class="text-success fw-medium">In Stock</span>
                          </div>
                          <div class="input-step">
                              <button type="button" class="minus">–</button>
                              <input type="number" class="product-quantity" value="3" min="0" max="100"
                                  readonly />
                              <button type="button" class="plus">+</button>
                          </div>
                      </div>
                      <div class="flex-shrink-0 d-flex flex-column justify-content-between align-items-end">
                          <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                              data-bs-toggle="modal" data-bs-target="#removeItemModal">
                              <i class="ri-close-fill fs-16"></i>
                          </button>
                          <div class="fw-medium mb-0 fs-16">
                              $<span class="product-line-price">734.97</span>
                          </div>
                      </div>
                  </div>
              </li>
              <li class="list-group-item product">
                  <div class="d-flex gap-3">
                      <div class="flex-shrink-0">
                          <div class="avatar-md" style="height: 100%">
                              <div class="avatar-title bg-primary-subtle rounded-3">
                                  <img src="../assetsMain/images/products/img-8.png" alt="" class="avatar-sm" />
                              </div>
                          </div>
                      </div>
                      <div class="flex-grow-1">
                          <a href="#!">
                              <h5 class="fs-15">Men's Running Shoes Act...</h5>
                          </a>
                          <div class="d-flex mb-3 gap-2">
                              <div class="text-muted fw-medium mb-0">
                                  $<span class="product-price">120.30</span>
                              </div>
                              <div class="vr"></div>
                              <span class="text-success fw-medium">In Stock</span>
                          </div>
                          <div class="input-step">
                              <button type="button" class="minus">–</button>
                              <input type="number" class="product-quantity" value="2" min="0" max="100"
                                  readonly />
                              <button type="button" class="plus">+</button>
                          </div>
                      </div>
                      <div class="flex-shrink-0 d-flex flex-column justify-content-between align-items-end">
                          <button type="button" class="btn btn-icon btn-sm btn-ghost-secondary remove-item-btn"
                              data-bs-toggle="modal" data-bs-target="#removeItemModal">
                              <i class="ri-close-fill fs-16"></i>
                          </button>
                          <div class="fw-medium mb-0 fs-16">
                              $<span class="product-line-price">240.60</span>
                          </div>
                      </div>
                  </div>
              </li>
          </ul>

          <div class="table-responsive mx-2 border-top border-top-dashed">
              <table class="table table-borderless mb-0 fs-14 fw-semibold">
                  <tbody>
                      <tr>
                          <td>Sub Total :</td>
                          <td class="text-end cart-subtotal">$1183.57</td>
                      </tr>
                      <tr>
                          <td>Discount <span class="text-muted">(Toner15)</span>:</td>
                          <td class="text-end cart-discount">- $177.54</td>
                      </tr>
                      <tr>
                          <td>Shipping Charge :</td>
                          <td class="text-end cart-shipping">$65.00</td>
                      </tr>
                      <tr>
                          <td>Estimated Tax (12.5%) :</td>
                          <td class="text-end cart-tax">$147.95</td>
                      </tr>
                  </tbody>
              </table>
          </div>
      </div>
  </div>
  <div class="offcanvas-footer border-top p-3 text-center">
      <div class="d-flex justify-content-between align-items-center mb-3">
          <h6 class="m-0 fs-16 text-muted">Total:</h6>
          <div class="px-2">
              <h6 class="m-0 fs-16 cart-total">$1218.98</h6>
          </div>
      </div>
      <div class="row g-2">
          <div class="col-6">
              <button type="button" class="btn btn-light w-100" id="reset-layout">
                  View Cart
              </button>
          </div>
          <div class="col-6">
              <a href="#!" target="_blank" class="btn btn-info w-100">Continue to Checkout</a>
          </div>
      </div>
  </div>
</div>


<section class="ecommerce-about" style="
background-image: url('{{ asset('assetsMain/images/profile-bg.jpg') }}');
background-size: cover;
background-position: center;
">
<div class="bg-overlay bg-primary-about" style="opacity: 0.7"></div>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="text-center">
                <h1 class="text-white mb-0">Product Details</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-light justify-content-center mt-4">
                        <li class="breadcrumb-item"><a href="#">Product</a></li>
                        <li class="breadcrumb-item active" aria-current="page">
                          <a href="{{ route('product.detail', ['id' => $product->id]) }}">
                          {{ $product->title }}
                          </a>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
</section>

<section class="section pt-0 pb-0">
    <h4 class="lh-base mb-1 p-3 mt-3" style="font-size: 2rem; color: #1d497e; background-color: #ECF1F4; text-align: center">
        {{ $product->title }}
    </h4>
<div class="container mt-5">
    <div class="row">
        <div class="col-lg-12">

            <ul class="nav nav-tabs nav-tabs-custom mb-3" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#pricechart" role="tab">
                        Price Chart
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#home1" role="tab">
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
                <div class="tab-pane active" id="pricechart" role="tabpanel">
                    <table class="table fs-15 align-middle table-nowrap mt-4">
                        <thead>
                            <tr>
                                <th scope="col">Qty</th>
                                @foreach($quantities as $quantity)
                                    <th scope="col" class="text-align-center" data-quantity="{{ $quantity }}">{{ $quantity }}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a href="#" class="text-body">Price</a>
                                </td>
                                @foreach($prices as $price)
                                <td class="fw-medium text-align-center" data-price="{{ $price }}" id="pricing-{{ $price }}" >
                                    ${{ number_format($price, 2) }}
                                </td>
                            @endforeach
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="tab-pane" id="home1" role="tabpanel">


                    <p class=" fs-15">
                        {{ $product->description }}
                    </p>
                </div>
                <div class="tab-pane" id="profile1" role="tabpanel">
                    <div>
                        <div class="d-flex flex-wrap gap-4 justify-content-between align-items-center mt-4">
                            <div class="flex-shrink-0">
                                <h5 class="fs-15 mb-3 fw-medium">Total Rating's</h5>
                                <h2 class="fw-bold mb-3">10.14k</h2>
                                <p class="text-muted mb-0">
                                    Growth in reviews on this year
                                </p>
                            </div>
                            <hr class="vr" />
                            <div class="flex-shrink-0">
                                <h5 class="fs-15 mb-3 fw-medium">Average Rating</h5>
                                <h2 class="fw-bold mb-3">
                                    5.6
                                    <span class="fs-16 align-middle text-warning ms-2">
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-fill"></i>
                                        <i class="ri-star-half-fill"></i>
                                    </span>
                                </h2>
                                <p class="text-muted mb-0">Average rating on this year</p>
                            </div>
                            <hr class="vr" />
                            <div class="flex-shrink-0 w-xl">
                                <div class="row align-items-center g-3 align-items-center mb-2">
                                    <div class="col-auto">
                                        <div>
                                            <h6 class="mb-0 text-muted fs-13">
                                                <i class="ri-star-fill text-warning me-1 align-bottom"></i>5
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <div class="progress animated-progress progress-sm">
                                                <div class="progress-bar bg-primary" role="progressbar"
                                                    style="width: 50.16%" aria-valuenow="50.16"
                                                    aria-valuemin="0" aria-valuemax="100"></div>
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
                                            <h6 class="mb-0 text-muted fs-13">
                                                <i class="ri-star-fill text-warning me-1 align-bottom"></i>4
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <div class="progress animated-progress progress-sm">
                                                <div class="progress-bar bg-success" role="progressbar"
                                                    style="width: 29.32%" aria-valuenow="29.32"
                                                    aria-valuemin="0" aria-valuemax="100"></div>
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
                                            <h6 class="mb-0 text-muted fs-13">
                                                <i class="ri-star-fill text-warning me-1 align-bottom"></i>3
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <div class="progress animated-progress progress-sm">
                                                <div class="progress-bar bg-info" role="progressbar"
                                                    style="width: 18.12%" aria-valuenow="18.12"
                                                    aria-valuemin="0" aria-valuemax="100"></div>
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
                                            <h6 class="mb-0 text-muted fs-13">
                                                <i class="ri-star-fill text-warning me-1 align-bottom"></i>2
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <div class="progress animated-progress progress-sm">
                                                <div class="progress-bar bg-secondary" role="progressbar"
                                                    style="width: 4.98%" aria-valuenow="4.98" aria-valuemin="0"
                                                    aria-valuemax="100"></div>
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
                                            <h6 class="mb-0 text-muted fs-13">
                                                <i class="ri-star-fill text-warning me-1 align-bottom"></i>2
                                            </h6>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div>
                                            <div class="progress animated-progress progress-sm">
                                                <div class="progress-bar bg-danger" role="progressbar"
                                                    style="width: 7.42%" aria-valuenow="7.42" aria-valuemin="0"
                                                    aria-valuemax="100"></div>
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
                                    <img class="avatar-xs rounded-circle"
                                        src="../assetsMain/images/users/avatar-5.jpg" alt="" />
                                </div>
                                <div class="flex-grow-1">
                                    <div class="d-flex mb-3">
                                        <div class="flex-grow-1">
                                            <div>
                                                <div class="mb-2 fs-12">
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-line text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-line text-warning align-bottom"></i></span>
                                                </div>
                                                <h6 class="mb-0">Donald Risher</h6>
                                            </div>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <p class="mb-0 text-muted">
                                                <i class="ri-calendar-event-fill me-2 align-middle"></i>Aug 16,
                                                2022
                                            </p>
                                        </div>
                                    </div>
                                    <div>
                                        <h5 class="lh-base fs-15">Design Quality</h5>
                                        <p class="mb-0">
                                            " This is an incredible framework worth so much in
                                            the right hands! Nowhere else are you going to get
                                            so much flexibility and great code for a few
                                            dollars. Highly recommend purchasing today! Like
                                            right now! "
                                        </p>
                                    </div>
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0 me-3">
                                            <img class="avatar-xs rounded-circle"
                                                src="../assetsMain/images/users/avatar-1.jpg" alt="" />
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
                                                    <p class="mb-0 text-muted">
                                                        <i
                                                            class="ri-calendar-event-fill me-2 align-middle"></i>Aug
                                                        16, 2022
                                                    </p>
                                                </div>
                                            </div>
                                            <p class="mb-0">Thank You</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex p-3 border-bottom border-bottom-dashed">
                                <div class="flex-shrink-0 me-3">
                                    <img class="avatar-xs rounded-circle"
                                        src="../assetsMain/images/users/avatar-3.jpg" alt="" />
                                </div>
                                <div class="flex-grow-1">
                                    <div class="d-flex mb-3">
                                        <div class="flex-grow-1">
                                            <div>
                                                <div class="mb-2 fs-12">
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                </div>
                                                <h6 class="mb-0">Richard Smith</h6>
                                            </div>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <p class="mb-0 text-muted">
                                                <i class="ri-calendar-event-fill me-2 align-middle"></i>Dec 10,
                                                2022
                                            </p>
                                        </div>
                                    </div>
                                    <div>
                                        <h5 class="lh-base fs-15">Feature Availability</h5>
                                        <p class="mb-0">
                                            " Hello everyone, I would like to suggest here two
                                            contents that you could create. Course pages and
                                            blog pages. In them you could insert the listing and
                                            management of courses and listing and management of
                                            blog. The theme is perfect, one of the best
                                            purchases I've ever made. "
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex p-3 border-bottom border-bottom-dashed mb-3">
                                <div class="flex-shrink-0 me-3">
                                    <img class="avatar-xs rounded-circle"
                                        src="../assetsMain/images/users/avatar-8.jpg" alt="" />
                                </div>
                                <div class="flex-grow-1">
                                    <div class="d-flex mb-3">
                                        <div class="flex-grow-1">
                                            <div>
                                                <div class="mb-2 fs-12">
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-half-fill text-warning align-bottom"></i></span>
                                                    <span>
                                                        <i
                                                            class="ri-star-line text-warning align-bottom"></i></span>
                                                </div>
                                                <h6 class="mb-0">Pauline Moll</h6>
                                            </div>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <p class="mb-0 text-muted">
                                                <i class="ri-calendar-event-fill me-2 align-middle"></i>Aug 16,
                                                2022
                                            </p>
                                        </div>
                                    </div>
                                    <div>
                                        <h5 class="lh-base fs-15">Design Quality</h5>
                                        <p class="mb-0">
                                            "We have used your other templates as well and seems
                                            it's amazing with the design and code quality. Wish
                                            you best for the future updates. Keep updated you
                                            will be #1 in near future. "
                                        </p>
                                    </div>
                                    <div class="d-flex mt-4">
                                        <div class="flex-shrink-0 me-3">
                                            <img class="avatar-xs rounded-circle"
                                                src="../assetsMain/images/users/avatar-1.jpg" alt="" />
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
                                                    <p class="mb-0 text-muted">
                                                        <i
                                                            class="ri-calendar-event-fill me-2 align-middle"></i>Aug
                                                        16, 2022
                                                    </p>
                                                </div>
                                            </div>
                                            <p class="mb-0">Thank You</p>
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
                                            <span class="fs-14">
                                                <i class="ri-star-fill text-warning align-bottom"></i></span>
                                            <span class="fs-14">
                                                <i class="ri-star-fill text-warning align-bottom"></i></span>
                                            <span class="fs-14">
                                                <i class="ri-star-fill text-warning align-bottom"></i></span>
                                            <span class="fs-14">
                                                <i class="ri-star-fill text-warning align-bottom"></i></span>
                                            <span class="fs-14">
                                                <i
                                                    class="ri-star-half-fill text-warning align-bottom"></i></span>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control" name="your-name" placeholder="Title"
                                            type="text" />
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" name="your-comment"
                                            placeholder="Enter your comments & reviews" rows="4"></textarea>
                                    </div>
                                    <div class="text-end">
                                        <button class="btn btn-primary btn-hover" type="submit" value="Submit">
                                            Send Review
                                            <i class="ri-send-plane-2-line align-bottom ms-1"></i>
                                        </button>
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

<section class="section" >
<div class="container">
    <div class="row gx-2">
        <div class="col-lg-4">
            <div class="row">
                <div class="col-md-3 mb-3">
                    <div thumbsSlider="" class="swiper productSwiper mb-3 mb-lg-0 d-flex">
                        <div class="swiper-wrapper d-flex" id="thumbnail-wrapper">
                          @foreach($product->base_images as $image)
                          <div class="swiper-slide base-image">
                              <div class="product-thumb rounded cursor-pointer">
                                  <img src="{{ asset('storage/' . $image) }}" alt="Product Base Image" class="img-fluid" />
                              </div>
                          </div>
                      @endforeach

                      @if($colors && !empty($colors->images))
                          @foreach($colors->images as $index => $image)
                              <div class="swiper-slide color-image" data-color="{{ strtolower($colors->color[$index]) }}">
                                  <div class="product-thumb rounded cursor-pointer">
                                      <img src="{{ asset('storage/' . $image) }}" alt="Product Color Image" class="img-fluid" />
                                  </div>
                              </div>
                          @endforeach
                      @endif
                        </div>

                    </div>
                </div>

                <!-- Main Product Images -->
                <div class="col-md-10">
                    <div class="bg-light rounded-2 position-relative ribbon-box overflow-hidden">
                        <div class="ribbon ribbon-danger ribbon-shape trending-ribbon">
                            <span class="trending-ribbon-text">Trending</span>
                            <i class="ri-flashlight-fill text-white align-bottom float-end ms-1"></i>
                        </div>
                        <div class="swiper productSwiper2">
                            <div class="swiper-wrapper" id="main-view-wrapper">
                              @foreach($product->base_images as $image)
                              <div class="swiper-slide base-image">
                                  <img src="{{ asset('storage/' . $image) }}" alt="Product Image" class="img-fluid" />
                              </div>
                          @endforeach

                          @if($colors && !empty($colors->images))
                          @foreach($colors->images as $index => $image)
                                  <div class="swiper-slide color-image"data-color="{{ strtolower($colors->color[$index]) }}">
                                      <img src="{{ asset('storage/' . $image) }}" alt="Color Variation Image" class="img-fluid" />
                                  </div>
                              @endforeach
                          @endif
                            </div>


                            <div class="swiper-button-next bg-transparent"></div>
                            <div class="swiper-button-prev bg-transparent"></div>
                        </div>
                    </div>
                </div>


            </div>

            <!-- Product Action Buttons -->
            <div class="col-lg-12">
                <div class="mt-3">
                    <div class="hstack gap-2">
                        <button type="button" class="btn btn-success btn-hover w-100">
                            <i class="bi bi-basket2 me-2"></i> Add To Cart
                        </button>
                        <button type="button" class="btn btn-primary btn-hover w-100">
                            <i class="bi bi-cart2 me-2"></i> Buy Now
                        </button>
                        <button class="btn btn-soft-danger custom-toggle btn-hover" data-bs-toggle="button" aria-pressed="true">
                            <span class="icon-on"><i class="ri-heart-line"></i></span>
                            <span class="icon-off"><i class="ri-heart-fill"></i></span>
                        </button>
                    </div>
                </div>
            </div>

            <!--end row-->
        </div>
        <!--end col-->
        <div class="col-lg-8 ms-auto">

            <div class="container">
                <div class="customization-section bg-white border border-light" id="customization-section">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <!-- Step 1 on the left -->
                        <div class="d-flex align-items-center">
                            <div class="step me-3">
                                <strong>STEP 1</strong>
                            </div>
                            <h2 class="h4 mb-0">Enter Quantity</h2>
                        </div>

                        <!-- Total quantity and price on the right -->
                        <div class="price-details">
                            Total Qty: <span id="total-qty">0</span> | Price: <span id="total-price">$0.00</span>
                        </div>
                    </div>


                    <div>
                        <input
                            type="number"
                            id="quantity-input"
                            placeholder="Qty"
                            class="form-control"
                            min="0"
                        >
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="customization-section bg-white border border-light">
                  <!-- Header -->
                  <div class="d-flex justify-content-between align-items-center mb-3">
                    <!-- Step 2 on the left -->
                    <div class="d-flex align-items-center">
                        <div class="step me-3">
                            <strong>STEP 2</strong>
                        </div>
                        <h2 class="h4 mb-0">Customization</h2>
                    </div>

                    <!-- Total quantity and price on the right -->
                    <div class="price-details">
                        Total Qty: <span id="total-qty2">0</span> | Price: <span id="total-price2">$0.00</span>
                    </div>
                </div>


                  <!-- Dropdown Section -->
                  <div class="form-group">
                    <label for="beanie-color" class="section-header">Select Beanies Color</label>
                    <select id="beanie-color" class="form-control">
                        <option>Select Beanies Color</option>
                        <option value="all">All Colors</option>
                        @if(!empty($colorNames))
                            @foreach($colorNames as $colorName)
                                <option value="{{ strtolower($colorName) }}">{{ ucfirst($colorName) }}</option>
                            @endforeach
                        @else
                            <option>No colors available</option>
                        @endif
                    </select>




  <div class="section-header mt-4">
      Select Printing Option
  </div>

  <div class="printing-options">
      @if($productPrintings->isNotEmpty())
          @foreach($productPrintings as $printing)
              <div class="option-card printing-option"
                   data-id="{{ $printing->id }}"
                   data-title="{{ $printing->title }}"
                   data-quantities="{{ json_encode($printing->quantity) }}"
                   data-prices="{{ json_encode($printing->price) }}">
                  <img src="{{ asset('storage/' . $printing->image) }} " alt="{{ $printing->title }}">
                  <h3>{{ $printing->title }}</h3>
              </div>
          @endforeach
      @else
          <p>No printing options available.</p>
      @endif
  </div>





                      <div class="container my-5" id="artwork-upload">
                        <h2 class="text-center mb-4">Upload Your Artwork</h2>

                        <!-- Artwork Type -->
                        <div class="mb-3">
                            <label for="artworkType" class="form-label fw-bold">Artwork Type</label>
                            <select id="artworkType" class="form-select">
                                <option value="upload">Upload my Artwork</option>
                                <option value="message">Enter Your Message</option>
                            </select>
                        </div>

                        <!-- File Upload -->
                        <div class="mb-3">
                            <label for="fileUpload" class="form-label fw-bold">Browse Files To Upload</label>
                            <input type="file" id="fileUpload" class="form-control">
                            <div class="form-text">
                                File Accepted: JPEG, JPG, GIF, PNG, EPS, PDF, PSD, AI, BMP, TIF, TIFF<br>
                                <strong>Preferred File Type for Better Quality Product:</strong> AI, EPS, PSD, PDF
                            </div>
                        </div>

                        <!-- Patch Dimensions -->
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="patchLength" class="form-label fw-bold">Patch Length</label>
                                <input type="text" id="patchLength" class="form-control" placeholder="Patch Length">
                                <small class="form-text text-muted">Min Length - 1", Max Length - 4"</small>
                            </div>
                            <div class="col-md-6">
                                <label for="patchHeight" class="form-label fw-bold">Patch Height</label>
                                <input type="text" id="patchHeight" class="form-control" placeholder="Patch Height">
                                <small class="form-text text-muted">Max Height - 2"</small>
                            </div>
                        </div>

                        <!-- Font Style -->
                        <div class="mb-3">
                            <label for="fontStyle" class="form-label fw-bold">Select Font Style</label>
                            <select id="fontStyle" class="form-select">
                                <option value="arial">Arial</option>
                                <option value="times">Times New Roman</option>
                                <option value="courier">Courier New</option>
                            </select>
                        </div>

                        <!-- Imprint Colors -->
                        <div class="mb-3">
                            <label for="imprintColors" class="form-label fw-bold">Select Number Of Imprint Colors</label>
                            <select id="imprintColors" class="form-select">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>

                  </div>
                </div>
              </div>





                </div>


                <div class="container">
                  <div class="customization-section bg-white border border-light">

                      <div class="d-flex justify-content-between align-items-center mb-3">
                          <div class="step">
                              STEP 3
                          </div>
                          <h2 class="h4 mb-0 ml-2">Shipping</h2>
                          <div class="price-details">
                              Total Qty: <span id="total-qty3"></span> | Price: <span id="total-price3">$168.12</span>
                          </div>
                      </div>
                      <div class="radio-options">
                          <label>
                              <input type="radio" name="shippingOption" value="pickYourself" checked onchange="toggleOptions()"> Pick Yourself
                          </label>
                          <label>
                              <input type="radio" name="shippingOption" value="viewBundle" onchange="toggleOptions()"> View Shipping Bundle
                          </label>
                      </div>
                      <div id="pickYourselfBox" class="option-box">
                          <ul class="dselects">
                              <li>
                                  <span class="check">

                                      <i class="fa-solid fa-truck"></i>
                                  </span>
                                  <div class="delivery_date w3_bg">Pick Yourself


                                  </div>
                                  <div class="delivery_price w3_bg">
                                      <span class="delivery_price_number text-danger"
                                          style="font-weight:700">FREE</span>
                                  </div>
                              </li>
                                  </ul>
                      </div>
                      <div id="viewBundleBox" class="option-box" style="display: none;">

                        @if ($latestProductDelivery)

                        <ul class="dselects">
                            @php
                                $quantitiesdelivery = json_decode($latestProductDelivery->quantity, true);
                                $pricesDelivery = json_decode($latestProductDelivery->pricing, true);
                            @endphp

                            @if ($quantitiesdelivery && $pricesDelivery && count($quantitiesdelivery) === count($pricesDelivery))
                                @foreach ($quantitiesdelivery as $index => $quantitydelivery)
                                    <li>
                                        <span class="check"><i class="fa-solid fa-truck"></i></span>
                                        <div class="delivery_date w3_bg">Qty: {{ $quantitydelivery }}</div>
                                        <div class="delivery_price w3_bg">Price: ${{ number_format($pricesDelivery[$index], 2) }}</div>
                                    </li>
                                @endforeach
                            @else
                                <li>
                                    <div class="delivery_date w3_bg">Data mismatch or incomplete</div>
                                </li>
                            @endif
                        </ul>
                    @else
                        <p>No delivery records found.</p>
                    @endif

                      </div>





                      <div class="col-md-12 content-outer delivery-outer-box review-order-detail mt-2 w3_bg">
                          <div class="review_order w3_bg">
                              <div class="order_details_review order-detail w3_bg">
                                  <div class="row w3_bg">
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p class="order-overview-selected-product"> Product:</p>
                                          <p></p>
                                      </div>
                                      <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="s3-total-product-name">  {{ $product->title }}</span>
                                          </p>
                                      </div>
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p> Total Quantity: </p>
                                      </div>
                                      <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="s3-total-qty">12</span><span
                                                  class="get_free_offer_qty text-warning text_theme_color"></span><span
                                                  class="amount" style="display: none;"></span></p>
                                      </div>
                                      <div style="display:none"
                                          class="s3-increment-on-total-parent col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p> Setup Charge: </p>
                                          <p></p>
                                      </div>
                                      <div style="display:none"
                                          class="s3-increment-on-total-parent col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="dollar_sign">$</span><span
                                                  class="amount s3-increment-on-total">0.00</span><span
                                                  class="dollar_sign"></span></p>
                                      </div>
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                        <p> Amount Calculaion: </p>
                                        <p></p>
                                    </div>
                                    <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                        <p><span class="amount s3-total-price">Product Price: &nbsp;</span>
                                          <span class="dollar_sign">$</span><span id="product_price">2430.32</span></p>

                                          <p><span class="amount s3-total-price">Customization: &nbsp;</span>
                                            <span class="dollar_sign">$</span><span id="customization_price">2430.32</span></p>


                                          <p><span class="amount s3-total-price">Delivery Price: &nbsp;</span>
                                            <span class="dollar_sign">$</span><span id="delivery_price">2430.32</span></p>

                                    </div>
                                      <div class="col-md-5 my-1 col-4 pr-0 px-md-1 w3_bg">
                                          <p> Total Amount: </p>
                                          <p></p>
                                      </div>
                                      <div class="col-md-7 col-8 my-1 pr-0 pr-md-1 w3_bg">
                                          <p><span class="dollar_sign">$</span><span
                                                  class="amount s3-total-price">130.32</span><span
                                                  class="dollar_sign"></span> (All Inclusive)</p>
                                      </div>


                                  </div>


                                  <div class="form-group w3_bg" id="other_reason_div" style="display: none">
                                      <div class="text-left mb-1 mt-3 w3_bg">
                                          <input type="text" class="form-control" name="other_reason"
                                              onchange="selectOrderFor(this,'input')" id="other_reason"
                                              placeholder="Enter details...." value="">
                                      </div>
                                  </div>

                              </div>
                          </div>
                          <input type="radio" class="d-none" name="product_id" checked="" value="716">
                          <input type="hidden" name="action" value="addToCart">
                          <input type="hidden" name="sample" value="true" class="d-none smp-contents">
                          <div class="order-button-box w3_bg">
                              <div class="order-button-payment text-center w3_bg">
                                  <button class="btn btn-success btnAddToCart" aria-hidden="true">
                                      <svg style="margin-right: 10px; margin-bottom: 5px;" width="23" height="22"
                                          viewBox="0 0 23 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                          <path
                                              d="M1 1H4.81818L7.37636 13.7524C7.46365 14.1909 7.70273 14.5847 8.05175 14.865C8.40077 15.1454 8.83748 15.2943 9.28545 15.2857H18.5636C19.0116 15.2943 19.4483 15.1454 19.7973 14.865C20.1464 14.5847 20.3854 14.1909 20.4727 13.7524L22 5.7619H5.77273M9.59091 20.0476C9.59091 20.5736 9.16354 21 8.63636 21C8.10918 21 7.68182 20.5736 7.68182 20.0476C7.68182 19.5216 8.10918 19.0952 8.63636 19.0952C9.16354 19.0952 9.59091 19.5216 9.59091 20.0476ZM20.0909 20.0476C20.0909 20.5736 19.6635 21 19.1364 21C18.6092 21 18.1818 20.5736 18.1818 20.0476C18.1818 19.5216 18.6092 19.0952 19.1364 19.0952C19.6635 19.0952 20.0909 19.5216 20.0909 20.0476Z"
                                              stroke="white" stroke-width="2" stroke-linecap="round"
                                              stroke-linejoin="round"></path>
                                      </svg>
                                      Add To Cart</button>
                                  <div class="cartLoad ximgLoading w3_bg" style="display:none;"><img
                                          data-class="LazyLoad" src="https://www.imprintnow.ca/cache/blank.png"
                                          data-src="https://d3ngdnua5h1yvk.cloudfront.net/images/mload.gif"></div>
                              </div>
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
<!--end container-->
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const quantityInput = document.getElementById("quantity-input");
        const totalQty = document.getElementById("total-qty");
        const totalQtyCustomization = document.getElementById("total-qty2");
        const totalQtyDelivery = document.getElementById("total-qty3");
        const totalPrice = document.getElementById("total-price");
        const totalPriceCustomization = document.getElementById("total-price2");
        const totalPriceDelivery = document.getElementById("total-price3");
        const printingOptions = document.querySelectorAll(".printing-option");
        const shippingOptions = document.querySelectorAll('input[name="shippingOption"]');
        const pickYourselfBox = document.getElementById('pickYourselfBox');
        const viewBundleBox = document.getElementById('viewBundleBox');
        const artworkSelection = document.getElementById("artwork-upload");

        let selectedPrintingPrice = 0;
        let selectedPrintingQuantities = [];
        let pricesForSelectedPrinting = [];

        // Quantities and prices from server (ensure they are numbers)
        const quantities = @json($quantities).map(Number);
        const prices = @json($prices).map(Number);
        const quantitiesDelivery = @json($quantitiesdelivery).map(Number);
        const pricesDelivery = @json($pricesDelivery).map(Number);

        // Handle printing option selection
        printingOptions.forEach(option => {
            option.addEventListener("click", function () {
                printingOptions.forEach(opt => opt.classList.remove("active"));
                this.classList.add("active");

                try {
                    selectedPrintingQuantities = JSON.parse(this.dataset.quantities).map(Number);
                    pricesForSelectedPrinting = JSON.parse(this.dataset.prices).map(Number);
                    updatePrintingPriceAndTotal();
                } catch (error) {
                    console.error("Error parsing quantities or prices data:", error);
                }
            });
        });

        // Function to calculate printing price based on quantity
        function calculatePrice(quantity, quantities, prices) {
            quantity = parseInt(quantity);
            if (isNaN(quantity)) return 0;

            let price = 0;
            for (let i = quantities.length - 1; i >= 0; i--) {
                if (quantity >= quantities[i]) {
                    price = prices[i];
                    break;
                }
            }
            return price;
        }

        // Update printing price and total price
        function updatePrintingPriceAndTotal() {
            const enteredQty = parseInt(quantityInput.value) || 0;
            totalQty.textContent = enteredQty;
            totalQtyCustomization.textContent = enteredQty;
            totalQtyDelivery.textContent = enteredQty;

            selectedPrintingPrice = calculatePrice(enteredQty, selectedPrintingQuantities, pricesForSelectedPrinting);
            calculateTotalPrice();
        }

        // Update total price based on quantity and selected printing option
        function calculateTotalPrice() {
            const enteredQty = parseInt(quantityInput.value) || 0;
            let calculatedPrice = calculatePrice(enteredQty, quantities, prices);
            const total = calculatedPrice * enteredQty;

            totalPrice.textContent = `$${total.toFixed(2)}`;
            totalPriceCustomization.textContent = `$${(selectedPrintingPrice * enteredQty).toFixed(2)}`;

            if (selectedPrintingPrice === 0 && total >= 1) {
                artworkSelection.style.display = "none";
            } else {
                artworkSelection.style.display = "block";
            }

            // Update background color based on calculated price
            document.querySelectorAll('[id^="pricing-"]').forEach(function(priceElement) {
                const priceValue = parseFloat(priceElement.getAttribute('data-price')); // Get the price value

                if (priceValue === calculatedPrice) {
                    priceElement.style.backgroundColor = "#1D4B8F";
                    priceElement.style.color = "#fff";
                } else {
                    priceElement.style.backgroundColor = "";
                    priceElement.style.color = "black";
                }
            });
        }

        // Update delivery price and total cost for "View Shipping Bundle"
        function updateDeliveryPriceAndTotal() {
            const enteredQty = parseInt(quantityInput.value) || 0;
            const deliveryPrice = calculatePrice(enteredQty, quantitiesDelivery, pricesDelivery);
            const totalDelivery = deliveryPrice * enteredQty;
            totalPriceDelivery.textContent = `$${totalDelivery.toFixed(2)}`;
        }

        // Toggle between "Pick Yourself" and "View Shipping Bundle"
        function toggleOptions() {
            const selectedOption = document.querySelector('input[name="shippingOption"]:checked').value;

            if (selectedOption === 'pickYourself') {
                pickYourselfBox.style.display = 'block';
                viewBundleBox.style.display = 'none';
                totalPriceDelivery.textContent = '$0.00';
                resetTotalPrice();
            } else {
                pickYourselfBox.style.display = 'none';
                viewBundleBox.style.display = 'block';
                updateDeliveryPriceAndTotal();
            }
        }

        // Reset the total price to $0 for "Pick Yourself"
        function resetTotalPrice() {
            totalPrice.textContent = "$0.00";
            totalPriceCustomization.textContent = "$0.00";
        }

        // Listen to changes in shipping options and update the view
        shippingOptions.forEach(option => {
            option.addEventListener('change', toggleOptions);
        });

        // Recalculate total price and update view on quantity change
        quantityInput.addEventListener("input", function () {
            const selectedOption = document.querySelector('input[name="shippingOption"]:checked').value;
            
            if (selectedOption === 'pickYourself') {
                totalPriceDelivery.textContent = '$0.00';
                resetTotalPrice();
            } else {
                updateDeliveryPriceAndTotal();
            }

            updatePrintingPriceAndTotal();
        });

        // Ensure correct view on page load
        toggleOptions();

        // Prevent entering a value below the minimum quantity and update the UI accordingly
        quantityInput.addEventListener("blur", function () {
            const enteredQty = parseInt(quantityInput.value) || 0;
            const minQty = Math.min(...quantities);
            
            if (enteredQty < minQty) {
                quantityInput.value = minQty;
                calculateTotalPrice();
            }

            // Ensure the total quantity and price are updated
            totalQty.textContent = quantityInput.value;
            totalQtyCustomization.textContent = quantityInput.value;
            totalQtyDelivery.textContent = quantityInput.value;
        });
    });
</script>




@endsection
