@extends('main.layouts.master')


<title>Design Your Own Beanie Hat in Montreal, Canada</title>
<meta name="description"
    content="Design Your Own Beanie Hat in Montreal, Canada, with custom colors and logos. Stand out in style and comfort—Design Your Own Beanie Hat today!">
<meta name="keywords" content="Design Your Own Beanie Hat in Montreal, Design Your Own Beanie Hat in Canada">
<link rel="canonical" href="https://monkeybeanies.com/products">


@section('main-container')
    @component('main.components.breadcrumb', [
        'pageTitle' => 'Products',
        'pageRoute' => 'products',
        'imageURL' => asset('assetsMain/images/profile-bg.jpg'), // Evaluated here
    ])
    @endcomponent

    <style>
        .category-container {
            position: relative;
            width: 100%;
            max-width: 1200px;
            overflow: hidden;
            padding: 20px 0;
        }

        .category-slider {
            display: flex;
            gap: 15px;
            overflow-x: auto;
            scroll-behavior: smooth;
            padding: 15px;
            scrollbar-width: none;
        }

        .category-slider::-webkit-scrollbar {
            display: none;
        }

        .category-card {
            flex: 0 0 auto;
            width: 160px;
            height: 200px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
            border-radius: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .category-card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .category-card img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 10px;
            border: 3px solid #000;
        }

        .category-card p {
            margin: 0;
            font-size: 15px;
            font-weight: bold;
            color: black;
        }

        .categoryarrow {
            position: absolute;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 15px;
            cursor: pointer;
            font-size: 24px;
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
            transition: background 0.3s ease;
        }

        .categoryarrow:hover {
            background: rgba(0, 0, 0, 0.7);
        }



        .categoryarrow-left {
            left: 10px;
        }

        .categoryarrow-right {
            right: 10px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .category-card {
                width: 130px;
                height: 160px;
            }

            .category-card img {
                width: 80px;
                height: 80px;
            }

            .categoryarrow {
                padding: 12px;
                font-size: 18px;
            }
        }

        .category-card.active {
            border: 2px solid black;
            background: #f0f0f0;
            transform: scale(1.1);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }
    </style>

    {{-- <div class="position-relative section">
        <div class="container">
            <div class="ecommerce-product gap-4">
                <div class="flex-grow-1">


                    <div class="category-container">
                        <button class="categoryarrow categoryarrow-left" onclick="scrollSlider(-200)">&#10094;</button>
                        <div class="category-slider" id="categorySlider">
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?cap" alt="Caps">
                                <p>Caps</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?beanie" alt="Beanies">
                                <p>Beanies</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?shoes" alt="Shoes">
                                <p>Shoes</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?jacket" alt="Jackets">
                                <p>Jackets</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?watch" alt="Watches">
                                <p>Watches</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?shoes" alt="Shoes">
                                <p>Shoes</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?jacket" alt="Jackets">
                                <p>Jackets</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?watch" alt="Watches">
                                <p>Watches</p>
                            </div>
                            <div class="category-card">
                                <img src="https://source.unsplash.com/150x150/?glasses" alt="Glasses">
                                <p>Glasses</p>
                            </div>
                        </div>
                        <button class="categoryarrow categoryarrow-right" onclick="scrollSlider(200)">&#10095;</button>
                    </div>


                    <div class="d-flex align-items-center gap-2 mb-4">
                        <p class="text-muted flex-grow-1 mb-0">
                            Showing 1-12 of 84 results
                        </p>

                        <div class="flex-shrink-0">
                            <div class="d-flex gap-2">
                                <div class="flex-shrink-0">
                                    <label for="sort-elem" class="col-form-label">Sort By:</label>
                                </div>
                                <div class="flex-shrink-0">
                                    <select class="form-select w-md" id="sort-elem">
                                        <option value="">All</option>
                                        <option value="low_to_high">Low to High</option>
                                        <option value="high_to_low">High to Low</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card">
                                <div class="ProductCardBadge">HOT</div>

                                <img src="" alt="product" class="img-fluid" id="mainImage">

                                <div class="color-slider-container">
                                    <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                    <div class="color-slider" id="colorSlider">

                                        <div class="color-option" style="background-color: red;" title="Color: Red"
                                            data-image="">
                                        </div>

                                    </div>
                                    <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                                </div>




                                <h5 class="card-title">JDKDJKJKD</h5>
                                <div class="stars mb-4">
                                    @for ($i = 0; $i < 5; $i++)
                                        <i class="fas fa-star"></i>
                                    @endfor
                                </div>


                                <a href="" class="add-to-cart-btn font-weight-bold"
                                    style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                                    <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                                </a>

                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card">
                                <div class="ProductCardBadge">HOT</div>

                                <img src="" alt="product" class="img-fluid" id="mainImage">

                                <div class="color-slider-container">
                                    <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                    <div class="color-slider" id="colorSlider">

                                        <div class="color-option" style="background-color: red;" title="Color: Red"
                                            data-image="">
                                        </div>

                                    </div>
                                    <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                                </div>




                                <h5 class="card-title">JDKDJKJKD</h5>
                                <div class="stars mb-4">
                                    @for ($i = 0; $i < 5; $i++)
                                        <i class="fas fa-star"></i>
                                    @endfor
                                </div>


                                <a href="" class="add-to-cart-btn font-weight-bold"
                                    style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                                    <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                                </a>

                            </div>
                        </div>


                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card">
                                <div class="ProductCardBadge">HOT</div>

                                <img src="" alt="product" class="img-fluid" id="mainImage">

                                <div class="color-slider-container">
                                    <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                    <div class="color-slider" id="colorSlider">

                                        <div class="color-option" style="background-color: red;" title="Color: Red"
                                            data-image="">
                                        </div>

                                    </div>
                                    <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                                </div>




                                <h5 class="card-title">JDKDJKJKD</h5>
                                <div class="stars mb-4">
                                    @for ($i = 0; $i < 5; $i++)
                                        <i class="fas fa-star"></i>
                                    @endfor
                                </div>


                                <a href="" class="add-to-cart-btn font-weight-bold"
                                    style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                                    <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                                </a>

                            </div>
                        </div>

                        <div class="col-md-4 col-lg-3 mb-4">
                            <div class="product-card">
                                <div class="ProductCardBadge">HOT</div>

                                <img src="" alt="product" class="img-fluid" id="mainImage">

                                <div class="color-slider-container">
                                    <span class="arrow left"><i class="fa-solid fa-circle-chevron-left"></i></span>
                                    <div class="color-slider" id="colorSlider">

                                        <div class="color-option" style="background-color: red;" title="Color: Red"
                                            data-image="">
                                        </div>

                                    </div>
                                    <span class="arrow right"><i class="fa-solid fa-circle-chevron-right"></i></span>
                                </div>




                                <h5 class="card-title">JDKDJKJKD</h5>
                                <div class="stars mb-4">
                                    @for ($i = 0; $i < 5; $i++)
                                        <i class="fas fa-star"></i>
                                    @endfor
                                </div>


                                <a href="" class="add-to-cart-btn font-weight-bold"
                                    style="margin-top: 5% !important; padding-right: 40px; padding-left:40px;">
                                    <i class="fa-solid fa-pen-to-square"></i> &nbsp;&nbsp;Customize
                                </a>

                            </div>
                        </div>

                    </div>

                    <div class="row" id="pagination-element">
                        <div class="col-lg-12">
                            <div
                                class="pagination-block pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">

                            </div>
                        </div>
                    </div>

                    <div class="row d-none" id="search-result-elem">
                        <div class="col-lg-12">
                            <div class="text-center py-5">
                                <div class="avatar-lg mx-auto mb-4">
                                    <div class="avatar-title bg-primary-subtle text-primary rounded-circle fs-24">
                                        <i class="bi bi-search"></i>
                                    </div>
                                </div>
                                <h5>No matching records found</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}

    <div class="position-relative section">
        <div class="container">
            <div class="ecommerce-product gap-4">
                {{-- <div class="sidebar small-sidebar flex-shrink-0">
                  <div class="card overflow-hidden">
                      <div class="card-header">
                          <div class="d-flex mb-3">
                              <div class="flex-grow-1">
                                  <h5 class="fs-16">Filters</h5>
                              </div>
                              <div class="flex-shrink-0">
                                  <a href="#" class="text-decoration-underline" id="clearall">Clear All</a>
                              </div>
                          </div>

                          <div class="search-box">
                              <input type="text" class="form-control" id="searchProductList" autocomplete="off" placeholder="Search Products...">
                              <i class="ri-search-line search-icon"></i>
                          </div>
                      </div>

                      <div class="accordion accordion-flush filter-accordion">

                          <div class="card-body border-bottom">
                              <div>
                                  <p class="text-muted text-uppercase fs-13 fw-medium mb-3">Products</p>
                                  <ul class="list-unstyled mb-0 filter-list">
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Grocery</h5>
                                              </div>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Fashion</h5>
                                              </div>
                                              <div class="flex-shrink-0 ms-2">
                                                  <span class="badge bg-light text-muted">5</span>
                                              </div>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Watches</h5>
                                              </div>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Electronics</h5>
                                              </div>
                                              <div class="flex-shrink-0 ms-2">
                                                  <span class="badge bg-light text-muted">5</span>
                                              </div>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Furniture</h5>
                                              </div>
                                              <div class="flex-shrink-0 ms-2">
                                                  <span class="badge bg-light text-muted">6</span>
                                              </div>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Automotive Accessories</h5>
                                              </div>
                                          </a>
                                      </li>
                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Appliances</h5>
                                              </div>
                                              <div class="flex-shrink-0 ms-2">
                                                  <span class="badge bg-light text-muted">7</span>
                                              </div>
                                          </a>
                                      </li>

                                      <li>
                                          <a href="javascript:void(0)" class="d-flex py-1 align-items-center">
                                              <div class="flex-grow-1">
                                                  <h5 class="fs-14 mb-0 listname">Kids</h5>
                                              </div>
                                          </a>
                                      </li>
                                  </ul>
                              </div>
                          </div>

                          <div class="card-body border-bottom">
                              <p class="text-muted text-uppercase fs-13 fw-medium mb-4">Price</p>

                              <div id="product-price-range" data-slider-color="info"></div>
                              <div class="formCost d-flex gap-2 align-items-center mt-3">
                                  <input class="form-control form-control-sm" type="text" id="minCost" value="0"> <span class="fw-semibold text-muted">to</span> <input class="form-control form-control-sm" type="text" id="maxCost" value="1000">
                              </div>
                          </div>

                          <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingColors">
                                  <button class="accordion-button bg-transparent shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseColors" aria-expanded="true" aria-controls="flush-collapseColors">
                                      <span class="text-muted text-uppercase fs-13 fw-medium">Colors</span> <span class="badge bg-success rounded-pill align-middle ms-1 filter-badge"></span>
                                  </button>
                              </h2>

                              <div id="flush-collapseColors" class="accordion-collapse collapse show" aria-labelledby="flush-headingColors">
                                  <div class="accordion-body text-body pt-0">
                                      <ul class="clothe-colors list-unstyled hstack gap-3 mb-0 flex-wrap" id="color-filter">
                                          <li>
                                              <input type="radio" name="colors" value="success" id="color-1">
                                              <label class="avatar-xs btn btn-success p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-1"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="info" id="color-2">
                                              <label class="avatar-xs btn btn-info p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-2"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="warning" id="color-3">
                                              <label class="avatar-xs btn btn-warning p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-3"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="danger" id="color-4">
                                              <label class="avatar-xs btn btn-danger p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-4"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="primary" id="color-5">
                                              <label class="avatar-xs btn btn-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-5"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="secondary" id="color-6">
                                              <label class="avatar-xs btn btn-secondary p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-6"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="dark" id="color-7">
                                              <label class="avatar-xs btn btn-dark p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-7"></label>
                                          </li>
                                          <li>
                                              <input type="radio" name="colors" value="light" id="color-8">
                                              <label class="avatar-xs btn btn-light p-0 d-flex align-items-center justify-content-center rounded-circle" for="color-8"></label>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                          <!-- end accordion-item -->

                          <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingSize">
                                  <button class="accordion-button bg-transparent shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSize" aria-expanded="true" aria-controls="flush-collapseSize">
                                      <span class="text-muted text-uppercase fs-13 fw-medium">Sizes</span> <span class="badge bg-success rounded-pill align-middle ms-1 filter-badge"></span>
                                  </button>
                              </h2>

                              <div id="flush-collapseSize" class="accordion-collapse collapse show" aria-labelledby="flush-headingSize">
                                  <div class="accordion-body text-body pt-0">
                                      <ul class="clothe-size list-unstyled hstack gap-3 mb-0 flex-wrap" id="size-filter">
                                          <li>
                                              <input type="radio" name="sizes" value="xs" id="sizeXs">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="sizeXs">XS</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="s" id="sizeS">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="sizeS">S</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="m" id="sizeM">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="sizeM">M</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="l" id="sizeL">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="sizeL">L</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="xl" id="sizeXl">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="sizeXl">XL</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="2xl" id="size2xl">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="size2xl">2XL</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="3xl" id="size3xl">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="size3xl">3XL</label>
                                          </li>
                                          <li>
                                              <input type="radio" name="sizes" value="4xl" id="size4xl">
                                              <label class="avatar-xs btn btn-soft-primary p-0 d-flex align-items-center justify-content-center rounded-circle" for="size4xl">4XL</label>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                          <!-- end accordion-item -->

                          <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingBrands">
                                  <button class="accordion-button bg-transparent shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseBrands" aria-expanded="true" aria-controls="flush-collapseBrands">
                                      <span class="text-muted text-uppercase fs-13 fw-medium">Brands</span> <span class="badge bg-success rounded-pill align-middle ms-1 filter-badge"></span>
                                  </button>
                              </h2>

                              <div id="flush-collapseBrands" class="accordion-collapse collapse show" aria-labelledby="flush-headingBrands">
                                  <div class="accordion-body text-body pt-0">
                                      <div class="search-box search-box-sm">
                                          <input type="text" class="form-control bg-light border-0" id="searchBrandsList" placeholder="Search Brands...">
                                          <i class="ri-search-line search-icon"></i>
                                      </div>
                                      <div class="d-flex flex-column gap-2 mt-3 filter-check">
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="Boat" id="productBrandRadio5">
                                              <label class="form-check-label" for="productBrandRadio5">Boat</label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="OnePlus" id="productBrandRadio4">
                                              <label class="form-check-label" for="productBrandRadio4">OnePlus</label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="Realme" id="productBrandRadio3">
                                              <label class="form-check-label" for="productBrandRadio3">Realme</label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="Sony" id="productBrandRadio2">
                                              <label class="form-check-label" for="productBrandRadio2">Sony</label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="JBL" id="productBrandRadio1">
                                              <label class="form-check-label" for="productBrandRadio1">JBL</label>
                                          </div>

                                          <div>
                                              <button type="button" class="btn btn-link text-decoration-none text-uppercase fw-medium p-0">1,235
                                                  More</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- end accordion-item -->

                          <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingDiscount">
                                  <button class="accordion-button bg-transparent shadow-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseDiscount" aria-expanded="true" aria-controls="flush-collapseDiscount">
                                      <span class="text-muted text-uppercase fs-13 fw-medium">Discount</span> <span class="badge bg-success rounded-pill align-middle ms-1 filter-badge"></span>
                                  </button>
                              </h2>
                              <div id="flush-collapseDiscount" class="accordion-collapse collapse" aria-labelledby="flush-headingDiscount">
                                  <div class="accordion-body text-body pt-1">
                                      <div class="d-flex flex-column gap-2 filter-check" id="discount-filter">
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="50" id="productdiscountRadio6">
                                              <label class="form-check-label" for="productdiscountRadio6">50% or more</label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="40" id="productdiscountRadio5">
                                              <label class="form-check-label" for="productdiscountRadio5">40% or more</label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="30" id="productdiscountRadio4">
                                              <label class="form-check-label" for="productdiscountRadio4">
                                                  30% or more
                                              </label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="20" id="productdiscountRadio3">
                                              <label class="form-check-label" for="productdiscountRadio3">
                                                  20% or more
                                              </label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="10" id="productdiscountRadio2">
                                              <label class="form-check-label" for="productdiscountRadio2">
                                                  10% or more
                                              </label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="0" id="productdiscountRadio1">
                                              <label class="form-check-label" for="productdiscountRadio1">
                                                  Less than 10%
                                              </label>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- end accordion-item -->

                          <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingRating">
                                  <button class="accordion-button bg-transparent shadow-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseRating" aria-expanded="false" aria-controls="flush-collapseRating">
                                      <span class="text-muted text-uppercase fs-13 fw-medium">Rating</span> <span class="badge bg-success rounded-pill align-middle ms-1 filter-badge"></span>
                                  </button>
                              </h2>

                              <div id="flush-collapseRating" class="accordion-collapse collapse" aria-labelledby="flush-headingRating">
                                  <div class="accordion-body text-body">
                                      <div class="d-flex flex-column gap-2 filter-check" id="rating-filter">
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="4" id="productratingRadio4">
                                              <label class="form-check-label" for="productratingRadio4">
                                                  <span class="text-muted">
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star"></i>
                                                  </span> 4 & Above
                                              </label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="3" id="productratingRadio3">
                                              <label class="form-check-label" for="productratingRadio3">
                                                  <span class="text-muted">
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star"></i>
                                                      <i class="mdi mdi-star"></i>
                                                  </span> 3 & Above
                                              </label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="2" id="productratingRadio2">
                                              <label class="form-check-label" for="productratingRadio2">
                                                  <span class="text-muted">
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star"></i>
                                                      <i class="mdi mdi-star"></i>
                                                      <i class="mdi mdi-star"></i>
                                                  </span> 2 & Above
                                              </label>
                                          </div>
                                          <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="1" id="productratingRadio1">
                                              <label class="form-check-label" for="productratingRadio1">
                                                  <span class="text-muted">
                                                      <i class="mdi mdi-star text-warning"></i>
                                                      <i class="mdi mdi-star"></i>
                                                      <i class="mdi mdi-star"></i>
                                                      <i class="mdi mdi-star"></i>
                                                      <i class="mdi mdi-star"></i>
                                                  </span> 1
                                              </label>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- end accordion-item -->
                      </div>
                  </div>
                  <!-- end card -->
              </div> --}}
                <div class="flex-grow-1">
                    <div class="d-flex align-items-center gap-2 mb-4">
                        <p class="text-muted flex-grow-1 mb-0">Showing 1-12 of 84 results</p>

                        <div class="flex-shrink-0">
                            <div class="d-flex gap-2">
                                <div class="flex-shrink-0">
                                    <label for="sort-elem" class="col-form-label">Sort By:</label>
                                </div>
                                <div class="flex-shrink-0">
                                    <select class="form-select w-md" id="sort-elem">
                                        <option value="">All</option>
                                        <option value="low_to_high">Low to High</option>
                                        <option value="high_to_low">High to Low</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Products -->
                        <div class="col-xxl-3 col-lg-4 col-md-6">
                            <div class="card ecommerce-product-widgets border-0 rounded-0 shadow-none overflow-hidden">
                                <div class="bg-light bg-opacity-50 rounded py-4 position-relative">
                                    <img src="{{asset('assetsMain/images/products/img-8.png')}}" alt=""
                                        style="max-height: 200px;max-width: 100%;" class="mx-auto d-block rounded-2">
                                    <div class="action vstack gap-2">
                                        <button class="btn btn-danger avatar-xs p-0 btn-soft-warning custom-toggle product-action"
                                            data-bs-toggle="button">
                                            <span class="icon-on"><i class="ri-heart-line"></i></span>
                                            <span class="icon-off"><i class="ri-heart-fill"></i></span>
                                        </button>
                                    </div>
                                    <div class="avatar-xs label">
                                        <div class="avatar-title bg-danger rounded-circle fs-11">25%</div>
                                    </div>
                                </div>
                                <div class="pt-4">
                                    <div>
                                        <ul class="clothe-colors list-unstyled hstack gap-1 mb-3 flex-wrap">
                                            <li>
                                                <input type="radio" name="sizes1" id="product-color-12">
                                                <label
                                                    class="avatar-xxs btn btn-success p-0 d-flex align-items-center justify-content-center rounded-circle"
                                                    for="product-color-12"></label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sizes1" id="product-color-13">
                                                <label
                                                    class="avatar-xxs btn btn-info p-0 d-flex align-items-center justify-content-center rounded-circle"
                                                    for="product-color-13"></label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sizes1" id="product-color-14">
                                                <label
                                                    class="avatar-xxs btn btn-warning p-0 d-flex align-items-center justify-content-center rounded-circle"
                                                    for="product-color-14"></label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sizes1" id="product-color-15">
                                                <label
                                                    class="avatar-xxs btn btn-danger p-0 d-flex align-items-center justify-content-center rounded-circle"
                                                    for="product-color-15"></label>
                                            </li>
                                        </ul>
                                        <a href="#!">
                                            <h6 class="text-capitalize fs-15 lh-base text-truncate mb-0">World's most
                                                expensive t shirt</h6>
                                        </a>
                                        <div class="mt-2">
                                            <span class="float-end">4.9 <i
                                                    class="ri-star-half-fill text-warning align-bottom"></i></span>
                                            <h5 class="text-secondary mb-0">$266.24 <span
                                                    class="text-muted fs-12"><del>$354.99</del></span></h5>
                                        </div>
                                        <div class="tn mt-3">
                                            <a href="#!" class="btn btn-primary btn-hover w-100 add-btn"> <i class="mdi mdi-cart me-1"></i> Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="pagination-element">
                        <div class="col-lg-12">
                            <div
                                class="pagination-block pagination pagination-separated justify-content-center justify-content-sm-end mb-sm-0">
                                <div class="page-item">
                                    <a href="javascript:void(0);" class="page-link" id="page-prev">Previous</a>
                                </div>
                                <span id="page-num" class="pagination"></span>
                                <div class="page-item">
                                    <a href="javascript:void(0);" class="page-link" id="page-next">Next</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row d-none" id="search-result-elem">
                        <div class="col-lg-12">
                            <div class="text-center py-5">
                                <div class="avatar-lg mx-auto mb-4">
                                    <div class="avatar-title bg-primary-subtle text-primary rounded-circle fs-24">
                                        <i class="bi bi-search"></i>
                                    </div>
                                </div>

                                <h5>No matching records found</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--end container-->
    </div>

    <section class="section bg-light bg-opacity-25" style="background-image: url('{{asset('assetsMain/images/ecommerce/bg-effect.png')}}');background-position: center; background-size: cover;">
      <div class="container">
          <div class="row align-items-center justify-content-between">
              <div class="col-lg-6">
                  <div>
                      <p class="fs-15 text-uppercase fw-medium"><span class="fw-semibold text-danger">25% Up to</span> off all Products</p>
                      <h1 class="lh-base text-capitalize mb-3">Stay home & get your daily needs from our shop</h1>
                      <p class="fs-15 mb-4 pb-2">Start You'r Daily Shopping with <a href="#!" class="link-info fw-medium">Toner</a></p>
                      <form action="#!">
                          <div class="position-relative ecommerce-subscript">
                              <input type="email" class="form-control rounded-pill" placeholder="Enter your email">
                              <button type="submit" class="btn btn-primary btn-hover rounded-pill">Subscript Now</button>
                          </div>
                      </form>
                  </div>
              </div><!--end col-->
              <div class="col-lg-4">
                  <div class="mt-4 mt-lg-0">
                      <img src="{{asset('assetsMain/images/ecommerce/subscribe.png')}}" alt="" class="img-fluid">
                  </div>
              </div><!--end col-->
          </div><!--end row-->
      </div><!--end container-->
  </section>

  <section class="position-relative py-5">
      <div class="container">
          <div class="row gy-4 gy-lg-0">
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/fast-delivery.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">Fast &amp; Secure Delivery</h5>
                          <p class="text-muted mb-0">Tell about your service.</p>
                      </div>
                  </div>
              </div><!--end col-->
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/returns.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">2 Days Return Policy</h5>
                          <p class="text-muted mb-0">No question ask.</p>
                      </div>
                  </div>
              </div><!--end col-->
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/guarantee-certificate.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">Money Back Guarantee</h5>
                          <p class="text-muted mb-0">Within 5 business days</p>
                      </div>
                  </div>
              </div><!--end col-->
              <div class="col-lg-3 col-sm-6">
                  <div class="d-flex align-items-center gap-3">
                      <div class="flex-shrink-0">
                          <img src="{{asset('assetsMain/images/ecommerce/24-hours-support.png')}}" alt="" class="avatar-sm">
                      </div>
                      <div class="flex-grow-1">
                          <h5 class="fs-15">24 X 7 Service</h5>
                          <p class="text-muted mb-0">Online service for customer</p>
                      </div>
                  </div>
              </div><!--end col-->
          </div><!--end row-->
      </div><!--end container-->
  </section>


    {{-- <script>
        const slider = document.getElementById("categorySlider");
        let autoScrollInterval;
        const cards = document.querySelectorAll(".category-card");

        // Function to scroll the slider
        function scrollSlider(amount) {
            slider.scrollBy({
                left: amount,
                behavior: "smooth"
            });
        }

        // Auto-scroll function
        function autoScroll() {
            if (!document.querySelector(".category-card.active")) {
                if (slider.scrollLeft + slider.clientWidth >= slider.scrollWidth) {
                    slider.scrollTo({
                        left: 0,
                        behavior: "smooth"
                    });
                } else {
                    slider.scrollBy({
                        left: 200,
                        behavior: "smooth"
                    });
                }
            }
        }

        // Start auto-scroll
        autoScrollInterval = setInterval(autoScroll, 4000);

        // Function to center the active card
        function centerActiveCard(card) {
            const cardRect = card.getBoundingClientRect();
            const sliderRect = slider.getBoundingClientRect();
            const offset = cardRect.left - sliderRect.left - (sliderRect.width / 2) + (cardRect.width / 2);
            slider.scrollBy({
                left: offset,
                behavior: "smooth"
            });
        }

        // Handle card selection
        cards.forEach(card => {
            card.addEventListener("click", () => {
                document.querySelector(".category-card.active")?.classList.remove("active");
                card.classList.add("active");

                // Stop auto-scroll when a card is active
                clearInterval(autoScrollInterval);

                // Center the selected card
                centerActiveCard(card);
            });
        });
    </script> --}}

    {{-- <script src="{{ asset('assetsMain/js/frontend/productcardcolorchange.js') }}"></script> --}}
    <!-- Product-grid init js -->
    {{-- <script src="{{ asset('assetsMain/js/frontend/product-grid.init.js') }}"></script> --}}
@endsection
