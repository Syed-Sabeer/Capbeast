<!doctype html>
<html lang="en" data-bs-theme="light" data-footer="dark">

    <head>

        {{-- <script src="https://www.paypal.com/sdk/js?client-id=ASStNaPPMXc8Duo9rq6d9HJgrj2UwfvgSPcVr2JDqUricsCT0sFK0JamNgJuyk8fQ9k-gt-QDWDAoG85&components=buttons"></script> --}}


        <meta charset="utf-8">
        <title>Monkey Beanies</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      

        <!--Swiper slider css-->
        {{-- <link href="{{ asset('assetsMain/libs/swiper/swiper-bundle.min.css') }}" rel="stylesheet" type="text/css" /> --}}

        <!-- Bootstrap Css -->
        <link href="{{ asset('assetsMain/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="{{ asset('assetsMain/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="{{ asset('assetsMain/css/app.min.css') }}" rel="stylesheet" type="text/css" />
        
        <link href="{{ asset('assetsMain/css/repeatClass.css') }}" rel="stylesheet" type="text/css" />
        <!-- custom Css-->
        {{-- <link href="{{ asset('assetsMain/css/custom.min.css') }}" rel="stylesheet" type="text/css" /> --}}
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.5.0/remixicon.css" integrity="sha512-6p+GTq7fjTHD/sdFPWHaFoALKeWOU9f9MPBoPnvJEWBkGS4PKVVbCpMps6IXnTiXghFbxlgDE8QRHc3MU91lJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css" integrity="sha512-dPXYcDub/aeb08c63jRq/k6GaKccl256JQy/AnOq7CAnEZ9FzSL9wSbcZkMp4R26vBsMLFYH4kQ67/bbV8XaCQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/7.4.47/css/materialdesignicons.min.css" integrity="sha512-/k658G6UsCvbkGRB3vPXpsPHgWeduJwiWGPCGS14IQw3xpr63AEMdA8nMYG2gmYkXitQxDTn6iiK/2fD4T87qA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta name="csrf-token" content="{{ csrf_token() }}">
<link href="{{ asset('assetsMain/css/custom.css') }}" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link
        rel="stylesheet"
        href="https://site-assets.fontawesome.com/releases/v6.4.2/css/all.css"
      >
    </head>

    <body>

        <div id="google_translate_element"></div>



        @if (!in_array(request()->route()->getName(), ['user.register', 'user.login','main.pages.success']))
            @include('main.layouts.nav')
        @endif



        @yield('main-container')

    <!--start back-to-top-->
    <button onclick="topFunction()" class="btn btn-info btn-icon" style="bottom: 50px;" id="back-to-top">
        <i class="ri-arrow-up-line"></i>
    </button>
    <!--end back-to-top-->



    @if (!in_array(request()->route()->getName(), ['user.register', 'user.login','main.pages.success']))
            @include('main.layouts.footer')
        @endif

        

         <!-- JAVASCRIPT -->
         <script src="{{ asset('assetsMain/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
         {{-- <script src="{{ asset('assetsMain/libs/simplebar/simplebar.min.js') }}"></script> --}}
         {{-- <script src="{{ asset('assetsMain/js/plugins.js') }}"></script> --}}

         <!-- isotope-layout -->
         {{-- <script src="{{ asset('assetsMain/libs/isotope-layout/isotope.pkgd.min.js') }}"></script> --}}
{{--  --}}
         <!--Swiper slider js-->
         {{-- <script src="{{ asset('assetsMain/libs/swiper/swiper-bundle.min.js') }}"></script> --}}

         <!-- Countdown js -->
         {{-- <script src="{{ asset('assetsMain/js/pages/coming-soon.init.js') }}"></script> --}}

         {{-- <script src="{{ asset('assetsMain/js/frontend/landing-index.init.js') }}"></script>
         <script src="{{ asset('assetsMain/js/frontend/product-details.init.js') }}"></script> --}}

         {{-- <script src="{{ asset('assetsMain/js/frontend/menu.init.js') }}"></script> --}}

         <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    pageLanguage: 'en',
                    includedLanguages: 'en,fr,pt-PT,es',
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE
                }, 'google_translate_element');
            }
        </script>
        
        
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>


        <!-- Meta Pixel Code -->
<script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '527798759752509');
    fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=527798759752509&ev=PageView&noscript=1"
    /></noscript>
    <!-- End Meta Pixel Code -->
        
     </body>

 </html>
