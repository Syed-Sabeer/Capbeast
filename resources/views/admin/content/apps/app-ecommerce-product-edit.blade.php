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
        <span class="text-muted fw-light">eCommerce /</span> Product Edit
    </h4>

    <!-- Product Edit Form -->
    <div class="card">
        <div class="card-header">
            <h5 class="card-title mb-0">Edit Product</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('app-ecommerce-product-update', $product->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('POST') <!-- Use POST for update -->

                <div class="mb-3">
                    <label for="title" class="form-label">Product Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="{{ $product->title }}" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Product Description</label>
                    <textarea class="form-control" id="description" name="description" required>{{ $product->description }}</textarea>
                </div>

                <div class="mb-3">
                    <label for="is_pompom" class="form-label">Is PomPom</label>
                    <select class="form-control" id="is_pompom" name="is_pompom" required>
                        <option value="1" {{ $product->is_pompom ? 'selected' : '' }}>Yes</option>
                        <option value="0" {{ !$product->is_pompom ? 'selected' : '' }}>No</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="base_image" class="form-label">Base Image</label>
                    <input type="file" class="form-control" id="base_image" name="base_image">
                    @if($product->productBaseImages->isNotEmpty())
                        <h6>Current Base Image:</h6>
                        @foreach ($product->productBaseImages as $image)
                            <div class="mb-2">
                                <img src="{{ asset('storage/' . $image->base_image) }}" alt="Current Image" width="100">
                            </div>
                        @endforeach
                    @endif
                </div>
           
                <div class="mb-3">
                    <label for="color_images" class="form-label">Color Images</label>
                    <div class="row">
                        @foreach ($product->productColors as $color)
                            <div class="col-12 mb-3">
                                <div class="row">
                                    <div class="col-6">
                                        <select class="form-control" name="color[]">
                                            @foreach ($colorData as $availableColor)
                                                <option value="{{ $availableColor->id }}" {{ $color->color_id == $availableColor->id ? 'selected' : '' }}>
                                                    {{ $availableColor->color_name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <input type="file" name="images[{{ $loop->index }}][]" class="form-control" multiple>
                                        
                                        @if ($color->image)
                                            <div class="mb-2">
                                                <img src="{{ asset('storage/' . $color->image) }}" alt="Color Image" width="100">
                                            </div>
                                        @else
                                            <p>No image for this color.</p>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                
                                

                <!-- Add additional fields for other properties like pricing, stock, etc. -->
                <button type="submit" class="btn btn-primary">Update Product</button>
            </form>
        </div>
    </div>

    <script>
        // Add any additional JavaScript or event listeners needed for the form
    </script>

@endsection
