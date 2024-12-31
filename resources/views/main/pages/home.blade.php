@extends('main.layouts.master')

@section('main-container')



<section class="position-relative">
    <div class="video-container">
        <video autoplay muted loop playsinline>
            <source src="../assetsMain/videos/1.mp4" type="video/mp4" />
            Your browser does not support the video tag.
        </video>
    </div>

</section>

<!-- START INSTAGRAM -->
<section class="section pb-0">
    <div class="container">
        <div class="row justify-content-center g-0">
            <div class="col-lg-7">
                <div class="text-center">
                    <h3 class="mb-3">Follow Us In Instagram</h3>
                    <p class="text-muted fs-15">
                        The most common approach that peoples use to say
                        follow me on
                        Instagram is by sending a direct message.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="position-relative">
        <div class="row g-0 mt-5">
            <div class="col">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-1.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>

            <div class="col">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-2.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>

            <div class="col d-none d-md-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-3.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>

            <div class="col d-none d-md-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-4.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>
            <div class="col d-none d-lg-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-5.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>
            <div class="col d-none d-lg-block">
                <div class="insta-img">
                    <a href="#!" class="stretched-link">
                        <img src="../assetsMain/images/ecommerce/instagram/img-6.jpg" class="img-fluid" alt />
                        <i class="ri-instagram-line"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="insta-lable text-center">
            <a href="#!" class="btn btn-primary btn-hover">
                <i class="ph-instagram-logo align-middle me-1"></i>
                Follow In
                Instagram
            </a>
        </div>
    </div>
</section>
<!-- END INSTAGRAM -->




@endsection
