@extends('admin.layouts/layoutMaster')

@section('title', 'eCommerce Order Details - Apps')

@section('vendor-style')
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/sweetalert2/sweetalert2.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/select2/select2.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/@form-validation/umd/styles/index.min.css') }}" />
@endsection

@section('vendor-script')
    <script src="{{ asset('assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/cleavejs/cleave.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/cleavejs/cleave-phone.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/select2/select2.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/@form-validation/umd/bundle/popular.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/sweetalert2/sweetalert2.js') }}"></script>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/app-ecommerce-order-details.js') }}"></script>
    <script src="{{ asset('assets/js/modal-edit-user.js') }}"></script>
    <script src="{{ asset('assets/js/modal-add-new-address.js') }}"></script>
@endsection

@section('content')
    <h4 class="py-3 mb-2">
        <span class="text-muted fw-light">eCommerce /</span> Order Details
    </h4>

    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">

        <div class="d-flex flex-column justify-content-center gap-2 gap-sm-0">
            <h5 class="mb-1 mt-3 d-flex flex-wrap gap-2 align-items-end">Order #{{ $order->order_id }} <span
                    class="badge bg-label-success">Paid</span> <span class="badge bg-label-info">Ready to Pickup</span></h5>
            <p class="text-body">
                Date: {{ \Carbon\Carbon::parse($order->created_at)->format('F j, Y') }}
                {{-- Time: <span id="orderYear">{{ \Carbon\Carbon::parse($order->created_at)->timezone('America/New_York')->format('g:i A') }}</span> (ET) --}}
            </p>






        </div>
        {{-- <div class="d-flex align-content-center flex-wrap gap-2">
    <button class="btn btn-label-danger delete-order">Delete Order</button>
  </div> --}}
    </div>
    <style>
        .card-equal-height {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
    </style>

    <div class="row">
        <div class="col-12 col-lg-12">
            <div class="row">

                <!-- Customer Details Card -->
                <div class="col-md-4 col-lg-4">
                    <div class="card mb-4 card-equal-height">
                        <div class="card-header">
                            <h6 class="card-title m-0">Customer details</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-start align-items-center mb-4">
                                <div class="avatar me-2">
                                    <img src="{{ asset('assets/img/avatars/1.png') }}" alt="Avatar" class="rounded-circle">
                                </div>
                                <div class="d-flex flex-column">
                                    <a href="{{ url('app/user/view/account') }}" class="text-body text-nowrap">
                                        <h6 class="mb-0">{{ $order->user->email }}</h6>
                                    </a>
                                    <small class="text-muted">Customer ID: #{{ $order->user->id }}</small>
                                </div>
                            </div>
                            <div class="d-flex justify-content-start align-items-center mb-4">
                                <span
                                    class="avatar rounded-circle bg-label-success me-2 d-flex align-items-center justify-content-center"><i
                                        class='ti ti-shopping-cart ti-sm'></i></span>
                                <h6 class="text-body text-nowrap mb-0">{{ $order->user->count() }} Orders</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6>Reseller info</h6>

                            </div>
                            <p class="mb-1"> <x-user-reseller :isReseller="$order->user->is_reseller" :neqNumber="$order->user->neq_number" /></p>

                        </div>
                    </div>
                </div>

                <!-- Shipping Address Card -->
                <div class="col-md-4 col-lg-6">
                    <div class="card mb-4 card-equal-height">
                        <div class="card-header d-flex justify-content-between">
                            <h6 class="card-title m-0">Shipping Details</h6>
                        </div>
                        <div class="card-body">
                            <p class="mb-0"><Span style="font-weight: bold">Firstname:</Span>
                                {{ $order->ShippingDetails->firstname }}</p>
                            <p class="mb-0"><Span style="font-weight: bold">Lastname:</Span>
                                {{ $order->ShippingDetails->lastname }}</p>
                            <p class="mb-0"><Span style="font-weight: bold">Company Name:</Span>
                                {{ $order->ShippingDetails->companyname }}</p>
                            <p class="mb-0"><Span style="font-weight: bold">Email:</Span>
                                {{ $order->ShippingDetails->email }}</p>
                            <p class="mb-0"><Span style="font-weight: bold">Phone:</Span>
                                {{ $order->ShippingDetails->phone }}</p>
                            <p class="mb-0"><Span style="font-weight: bold">Address:</Span>
                                {{ $order->ShippingDetails->address }}</p>
                            <p class="mb-0"><Span style="font-weight: bold">Additional Info:</Span>
                                {{ $order->ShippingDetails->additional_info }}</p>
                        </div>
                    </div>
                </div>

                <!-- Order Details Card -->
                <div class="col-md-4 col-lg-2">
                    <div class=" mb-6">
                        <label for="select2Basic" class="form-label">Update Internal Status</label>
                        <select id="select2Basic" class="select2 form-select form-select-lg">
                            <option value="RI">Rhode Island</option>
                            <option value="SC">South Carolina</option>
                            <option value="VT">Vermont</option>
                            <option value="VA">Virginia</option>
                            <option value="WV">West Virginia</option>
                        </select>
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
                    <table class=" table border-top">
                        <thead>
                            <tr>
                                <th></th>
                                <th>products</th>
                                <th>qty</th>
                                <th>Color</th>
                                <th>Product Price</th>
                                <th>Printing Price</th>
                                <th>Delivery Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($order->items as $item)
                                <tr>
                                    <td></td>
                                    <td>{{ $item->product->title }}</td>
                                    <td>{{ $item->quantity }}</td>
                                    <td>{{ $item->color->color }}</td>
                                    <td>{{ $item->product_price * $item->quantity }} $</td>
                                    <td>{{ $item->printing_price * $item->quantity }} $</td>
                                    <td>{{ $item->delivery_price * $item->quantity }} $</td>
                                    <td></td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="d-flex justify-content-end align-items-center m-3 mb-2 p-1">
                        <div class="order-calculations">
                            <div class="d-flex justify-content-between mb-2">
                                <span class="w-px-100 text-heading">Subtotal:</span>
                                <h6 class="mb-0">${{ $order->total_price }}</h6>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <span class="w-px-100 text-heading">Discount:</span>
                                <h6 class="mb-0">$0.00</h6>
                            </div>
                            {{-- <div class="d-flex justify-content-between mb-2">
              <span class="w-px-100 text-heading">Tax:</span>
              <h6 class="mb-0">$30</h6>
            </div> --}}
                            <div class="d-flex justify-content-between">
                                <h6 class="w-px-100 mb-0">Total:</h6>
                                <h6 class="mb-0">${{ $order->total_price }}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-8 col-lg-8 mt-4">
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="card-title m-0">Internal Status Activity</h5>
                </div>
                <div class="card-body">
                    <ul class="timeline pb-0 mb-0">
                        <li class="timeline-item timeline-item-transparent border-primary">
                            <span class="timeline-point timeline-point-primary"></span>
                            <div class="timeline-event">
                                <div class="timeline-header">
                                    <h6 class="mb-0">Order was placed (Order ID: #{{ $order->order_id }})</h6>
                                    <span class="text-muted">Tuesday 11:29 AM</span>
                                </div>
                                <p class="mt-2">Your order has been placed successfully</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-4 col-lg-4 mt-4">
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="card-title m-0">Upload File</h5>
                </div>
                <div class="card-body">
                    @foreach ($order->Order_files as $item)
                        @php
                            $fileExtension = pathinfo($item->file, PATHINFO_EXTENSION);
                        @endphp

                        <div class="mb-2 d-flex align-items-center"> <!-- Use d-flex to align items horizontally -->
                            <!-- Dynamic icon based on file type -->
                            @if (in_array($fileExtension, ['jpg', 'jpeg', 'png', 'gif']))
                                <img src="{{ asset($item->file) }}" alt="img" class="wh-42" width="20%">
                            @elseif(in_array($fileExtension, ['pdf']))
                                <!-- Embed or provide a download link -->
                                <a href="{{ asset($item->file) }}" class="fs-12 fw-500 color-primary"
                                    target="_blank">View PDF</a>
                            @elseif(in_array($fileExtension, ['zip']))
                                <img src="{{ asset($item->file) }}" alt="img" class="wh-42">
                            @else
                                <img src="{{ asset($item->file) }}" alt="img" class="wh-42">
                            @endif

                            <div class="ms-3"> <!-- Add margin-left for spacing between the image and text -->
                                <h4>{{ $item->title }}</h4>
                                <a href="{{ asset($item->file) }}" class="fs-12 fw-500 color-primary"
                                    download>Download</a>
                            </div>
                        </div>
                    @endforeach

                    <div class="mb-3 text-end">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#fileUploadModal">
                            Upload File
                        </button>
                    </div>
                </div>


            </div>
          </div>

        </div>

            <div class="modal fade" id="fileUploadModal" tabindex="-1" aria-labelledby="fileUploadModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="fileUploadModalLabel">Upload File</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <form action="{{ route('order.file.upload', $order->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="modal-body">
                                <!-- Title Field -->
                                <div class="mb-3">
                                    <label for="title" class="form-label">Title</label>
                                    <input type="text" class="form-control" id="title" name="title"
                                        placeholder="Enter file title" required>
                                </div>
                                <!-- File Input Field -->
                                <div class="mb-3">
                                    <label for="file" class="form-label">Select File</label>
                                    <input type="file" class="form-control" id="file" name="file" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Upload</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            @include('admin._partials/_modals/modal-edit-user')
            @include('admin._partials/_modals/modal-add-new-address')
        @endsection




        {{-- <li class="timeline-item timeline-item-transparent border-transparent pb-0">
          <span class="timeline-point timeline-point-primary"></span>
          <div class="timeline-event pb-0">
            <div class="timeline-header">
              <h6 class="mb-0">Delivery</h6>
            </div>
            <p class="mt-2 mb-0">Package will be delivered by tomorrow</p>
          </div>
        </li> --}}
