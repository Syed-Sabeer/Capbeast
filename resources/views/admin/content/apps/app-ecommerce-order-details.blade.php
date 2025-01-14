@extends('admin.layouts/layoutMaster')

@section('title', 'eCommerce Order Details - Apps')

@section('vendor-style')
<link rel="stylesheet" href="{{asset('assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css')}}" />
<link rel="stylesheet" href="{{asset('assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css')}}" />
<link rel="stylesheet" href="{{asset('assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css')}}" />
<link rel="stylesheet" href="{{asset('assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css')}}" />
<link rel="stylesheet" href="{{asset('assets/vendor/libs/sweetalert2/sweetalert2.css')}}" />
<link rel="stylesheet" href="{{asset('assets/vendor/libs/select2/select2.css')}}" />
<link rel="stylesheet" href="{{asset('assets/vendor/libs/@form-validation/umd/styles/index.min.css')}}" />
@endsection

@section('vendor-script')
<script src="{{asset('assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js')}}"></script>
<script src="{{asset('assets/vendor/libs/cleavejs/cleave.js')}}"></script>
<script src="{{asset('assets/vendor/libs/cleavejs/cleave-phone.js')}}"></script>
<script src="{{asset('assets/vendor/libs/select2/select2.js')}}"></script>
<script src="{{asset('assets/vendor/libs/@form-validation/umd/bundle/popular.min.js')}}"></script>
<script src="{{asset('assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js')}}"></script>
<script src="{{asset('assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js')}}"></script>
<script src="{{asset('assets/vendor/libs/sweetalert2/sweetalert2.js')}}"></script>
@endsection

@section('page-script')
<script src="{{asset('assets/js/app-ecommerce-order-details.js')}}"></script>
<script src="{{asset('assets/js/modal-edit-user.js')}}"></script>
<script src="{{asset('assets/js/modal-add-new-address.js')}}"></script>
@endsection

@section('content')
<h4 class="py-3 mb-2">
  <span class="text-muted fw-light">eCommerce /</span> Order Details
</h4>

<div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">

  <div class="d-flex flex-column justify-content-center gap-2 gap-sm-0">
    <h5 class="mb-1 mt-3 d-flex flex-wrap gap-2 align-items-end">Order #{{$order->order_id}} <span class="badge bg-label-success">Paid</span> <span class="badge bg-label-info">Ready to Pickup</span></h5>
    <p class="text-body">
      Date: {{ \Carbon\Carbon::parse($order->created_at)->format('F j, Y') }}
      {{-- Time: <span id="orderYear">{{ \Carbon\Carbon::parse($order->created_at)->timezone('America/New_York')->format('g:i A') }}</span> (ET) --}}
  </p>
  
  
  
  
  
  
  </div>
  <div class="d-flex align-content-center flex-wrap gap-2">
    <button class="btn btn-label-danger delete-order">Delete Order</button>
  </div>
</div>
<style>
  /* Ensuring all cards have the same height */
.card-equal-height {
  display: flex;
  flex-direction: column;
  height: 100%;
}

</style>

<!-- Order Details Table -->

<div class="row">
  <div class="col-12 col-lg-12">
    <!-- Row to display cards in a single row -->
    <div class="row">
  
      <!-- Customer Details Card -->
      <div class="col-md-4">
        <div class="card mb-4 card-equal-height">
          <div class="card-header">
            <h6 class="card-title m-0">Customer details</h6>
          </div>
          <div class="card-body">
            <div class="d-flex justify-content-start align-items-center mb-4">
              <div class="avatar me-2">
                <img src="{{ asset('assets/img/avatars/1.png')}}" alt="Avatar" class="rounded-circle">
              </div>
              <div class="d-flex flex-column">
                <a href="{{url('app/user/view/account')}}" class="text-body text-nowrap">
                  <h6 class="mb-0">Shamus Tuttle</h6>
                </a>
                <small class="text-muted">Customer ID: #58909</small>
              </div>
            </div>
            <div class="d-flex justify-content-start align-items-center mb-4">
              <span class="avatar rounded-circle bg-label-success me-2 d-flex align-items-center justify-content-center"><i class='ti ti-shopping-cart ti-sm'></i></span>
              <h6 class="text-body text-nowrap mb-0">12 Orders</h6>
            </div>
            <div class="d-flex justify-content-between">
              <h6>Contact info</h6>
              <h6><a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#editUser">Edit</a></h6>
            </div>
            <p class="mb-1">Email: Shamus889@yahoo.com</p>
            <p class="mb-0">Mobile: +1 (609) 972-22-22</p>
          </div>
        </div>
      </div>
  
      <!-- Shipping Address Card -->
      <div class="col-md-4">
        <div class="card mb-4 card-equal-height">
          <div class="card-header d-flex justify-content-between">
            <h6 class="card-title m-0">Shipping address</h6>
            <h6 class="m-0"><a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#addNewAddress">Edit</a></h6>
          </div>
          <div class="card-body">
            <p class="mb-0">45 Roker Terrace <br>Latheronwheel <br>KW5 8NW, London <br>UK</p>
          </div>
        </div>
      </div>
  
      <!-- Order Details Card -->
      <div class="col-md-4">
        <div class="card mb-4 card-equal-height">
          <div class="card-header d-flex justify-content-between">
            <h6 class="card-title m-0">Order Details</h6>
          </div>
          <div class="card-body">
            <div class="d-flex justify-content-start align-items-center">
              <p class="text-body mb-0 me-3">
                Date: {{ \Carbon\Carbon::parse($order->created_at)->format('F j, Y') }}
              </p>
              <p class="text-body mb-0">
                Time: <span id="orderYear">{{ \Carbon\Carbon::parse($order->created_at)->timezone('America/New_York')->format('g:i A') }}</span> (ET)
              </p>
            </div>
          </div>
        </div>
      </div>
  
    </div>
  </div>
  
  
  <div class="col-12 col-lg-12 mt-5">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="card-title m-0">Order details</h5>
        <h6 class="m-0"><a href=" javascript:void(0)">Edit</a></h6>
      </div>
      <div class="card-datatable table-responsive">
        <table class="datatables-order-details table border-top">
          <thead>
            <tr>
              <th></th>
              <th></th>
              <th class="w-50">products</th>
              <th class="w-25">price</th>
              <th class="w-25">qty</th>
              <th>total</th>
            </tr>
          </thead>
        </table>
        <div class="d-flex justify-content-end align-items-center m-3 mb-2 p-1">
          <div class="order-calculations">
            <div class="d-flex justify-content-between mb-2">
              <span class="w-px-100 text-heading">Subtotal:</span>
              <h6 class="mb-0">$6398</h6>
            </div>
            <div class="d-flex justify-content-between mb-2">
              <span class="w-px-100 text-heading">Discount:</span>
              <h6 class="mb-0">$22</h6>
            </div>
            <div class="d-flex justify-content-between mb-2">
              <span class="w-px-100 text-heading">Tax:</span>
              <h6 class="mb-0">$30</h6>
            </div>
            <div class="d-flex justify-content-between">
              <h6 class="w-px-100 mb-0">Total:</h6>
              <h6 class="mb-0">$6450</h6>
            </div>
          </div>
        </div>
      </div>
    </div>
    {{-- <div class="card mb-4">
      <div class="card-header">
        <h5 class="card-title m-0">Shipping activity</h5>
      </div>
      <div class="card-body">
        <ul class="timeline pb-0 mb-0">
          <li class="timeline-item timeline-item-transparent border-primary">
            <span class="timeline-point timeline-point-primary"></span>
            <div class="timeline-event">
              <div class="timeline-header">
                <h6 class="mb-0">Order was placed (Order ID: #{{$order->order_id}})</h6>
                <span class="text-muted">Tuesday 11:29 AM</span>
              </div>
              <p class="mt-2">Your order has been placed successfully</p>
            </div>
          </li>
          <li class="timeline-item timeline-item-transparent border-primary">
            <span class="timeline-point timeline-point-primary"></span>
            <div class="timeline-event">
              <div class="timeline-header">
                <h6 class="mb-0">Pick-up</h6>
                <span class="text-muted">Wednesday 11:29 AM</span>
              </div>
              <p class="mt-2">Pick-up scheduled with courier</p>
            </div>
          </li>
          <li class="timeline-item timeline-item-transparent border-primary">
            <span class="timeline-point timeline-point-primary"></span>
            <div class="timeline-event">
              <div class="timeline-header">
                <h6 class="mb-0">Dispatched</h6>
                <span class="text-muted">Thursday 11:29 AM</span>
              </div>
              <p class="mt-2">Item has been picked up by courier</p>
            </div>
          </li>
          <li class="timeline-item timeline-item-transparent border-primary">
            <span class="timeline-point timeline-point-primary"></span>
            <div class="timeline-event">
              <div class="timeline-header">
                <h6 class="mb-0">Package arrived</h6>
                <span class="text-muted">Saturday 15:20 AM</span>
              </div>
              <p class="mt-2">Package arrived at an Amazon facility, NY</p>
            </div>
          </li>
          <li class="timeline-item timeline-item-transparent border-left-dashed">
            <span class="timeline-point timeline-point-primary"></span>
            <div class="timeline-event">
              <div class="timeline-header">
                <h6 class="mb-0">Dispatched for delivery</h6>
                <span class="text-muted">Today 14:12 PM</span>
              </div>
              <p class="mt-2">Package has left an Amazon facility, NY</p>
            </div>
          </li>
          <li class="timeline-item timeline-item-transparent border-transparent pb-0">
            <span class="timeline-point timeline-point-secondary"></span>
            <div class="timeline-event pb-0">
              <div class="timeline-header">
                <h6 class="mb-0">Delivery</h6>
              </div>
              <p class="mt-2 mb-0">Package will be delivered by tomorrow</p>
            </div>
          </li>
        </ul>
      </div>
    </div> --}}
  </div>
  
</div>

<!-- Modals -->
@include('admin._partials/_modals/modal-edit-user')
@include('admin._partials/_modals/modal-add-new-address')


@endsection
