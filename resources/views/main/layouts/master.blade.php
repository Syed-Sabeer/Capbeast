<!doctype html>
<html lang="en" data-bs-theme="light" data-footer="dark">

    <head>

        <meta charset="utf-8">
        <title>Monkey Beanies</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Toner - eCommerce + Admin HTML Template Build with HTML, React, Laravel, Nodejs" name="description">
        <meta content="Themesbrand" name="author">
        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">

        <!--Swiper slider css-->
        <link href="{{ asset('assetsMain/libs/swiper/swiper-bundle.min.css') }}" rel="stylesheet" type="text/css" />

        <!-- Bootstrap Css -->
        <link href="{{ asset('assetsMain/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="{{ asset('assetsMain/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="{{ asset('assetsMain/css/app.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assetsMain/css/custom.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assetsMain/css/repeatClass.css') }}" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        <link href="{{ asset('assetsMain/css/custom.min.css') }}" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.5.0/remixicon.css" integrity="sha512-6p+GTq7fjTHD/sdFPWHaFoALKeWOU9f9MPBoPnvJEWBkGS4PKVVbCpMps6IXnTiXghFbxlgDE8QRHc3MU91lJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" integrity="sha512-dPXYcDub/aeb08c63jRq/k6GaKccl256JQy/AnOq7CAnEZ9FzSL9wSbcZkMp4R26vBsMLFYH4kQ67/bbV8XaCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/7.4.47/css/materialdesignicons.min.css" integrity="sha512-/k658G6UsCvbkGRB3vPXpsPHgWeduJwiWGPCGS14IQw3xpr63AEMdA8nMYG2gmYkXitQxDTn6iiK/2fD4T87qA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body>


        @include('main.layouts.nav')



        @yield('main-container')

    <!--start back-to-top-->
    <button onclick="topFunction()" class="btn btn-info btn-icon" style="bottom: 50px;" id="back-to-top">
        <i class="ri-arrow-up-line"></i>
    </button>
    <!--end back-to-top-->



    @include('main.layouts.footer')

         <!-- JAVASCRIPT -->
         <script src="{{ asset('assetsMain/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
         <script src="{{ asset('assetsMain/libs/simplebar/simplebar.min.js') }}"></script>
         <script src="{{ asset('assetsMain/js/plugins.js') }}"></script>

         <!-- isotope-layout -->
         <script src="{{ asset('assetsMain/libs/isotope-layout/isotope.pkgd.min.js') }}"></script>

         <!--Swiper slider js-->
         <script src="{{ asset('assetsMain/libs/swiper/swiper-bundle.min.js') }}"></script>

         <!-- Countdown js -->
         <script src="{{ asset('assetsMain/js/pages/coming-soon.init.js') }}"></script>

         <script src="{{ asset('assetsMain/js/frontend/landing-index.init.js') }}"></script>
         <script src="{{ asset('assetsMain/js/frontend/product-details.init.js') }}"></script>

         <script src="{{ asset('assetsMain/js/frontend/menu.init.js') }}"></script>

     </body>

 </html>
