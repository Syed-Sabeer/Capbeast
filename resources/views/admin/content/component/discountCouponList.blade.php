@extends('admin.layouts/layoutMaster')

@section('title', 'eCommerce Product List - Apps')

@section('vendor-style')
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/datatables-buttons-bs5/buttons.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/select2/select2.css') }}" />
@endsection

@section('vendor-script')
    <script src="{{ asset('assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/select2/select2.js') }}"></script>
@endsection

@section('content')
<h4 class="py-3 mb-4">
    <span class="text-muted fw-light">Discount /</span>Coupon List
</h4>

<!-- Internal Status Table -->
<div class="card">
    <div class="card-header">
        <h5 class="card-title mb-0">Discount Coupon List</h5>
    </div>
    <div class="card-datatable table-responsive">
        <table class="table">
            <thead class="border-top">
                <tr>
                    <th></th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($discountCoupons as $coupon)
                <tr>
                    <td>{{ $coupon->title }}</td>
                    <td>{{ $coupon->code }}</td>
                    <td>{{ $coupon->discount_type == 1 ? 'Product' : 'Printing' }}</td>
                    <td>{{ $coupon->percentage }}%</td>
                    <td>
                        <a href="{{ route('content-discount-coupon-edit', $coupon->id) }}" class="btn btn-primary">Edit</a>
                        <form action="{{ route('content-discount-coupon-delete', $coupon->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
