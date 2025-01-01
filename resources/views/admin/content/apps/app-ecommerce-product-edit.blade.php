@extends('admin.layouts.layoutMaster')

@section('title', 'Edit Product - Ecommerce')

@section('content')
<form method="POST" action="{{ route('app-ecommerce-product-update', $product->id) }}" enctype="multipart/form-data">
    @csrf
    <div class="row">
        <div class="col-12 col-lg-8">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="title" class="form-control" value="{{ $product->title }}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="5" required>{{ $product->description }}</textarea>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">Colors</div>
                <div class="card-body" id="color-section">
                    @foreach ($productColors as $index => $color)
                    <div class="color-item">
                        <div class="row mb-3">
                            <div class="col-6">
                                <label class="form-label">Color</label>
                                <select name="color[]" class="form-select" required multiple>
                                    @foreach ($colors as $colorData)
                                        <option value="{{ $colorData['hex'] }}" 
                                            {{ in_array($colorData['hex'], (array) $color) ? 'selected' : '' }}>
                                            {{ $colorData['name'] }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-6">
                                <label class="form-label">Images</label>
                                <input type="file" name="images[{{ $index }}][]" class="form-control" multiple>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-header">Pricing</div>
                <div class="card-body" id="pricing-section">
                    @foreach ($productPricing as $pricing)
                    <div class="pricing-item">
                        <div class="row mb-3">
                            <div class="col-6">
                                <label class="form-label">Quantity</label>
                                <input type="number" name="quantity[]" class="form-control" value="{{ is_array($pricing->quantity) ? $pricing->quantity[0] : $pricing->quantity }}" required>
                            </div>
                
                            <div class="col-6">
                                <label class="form-label">Price</label>
                                <input type="text" name="pricing[]" class="form-control" value="{{ is_array($pricing->pricing) ? $pricing->pricing[0] : $pricing->pricing }}" required>
                            </div>
                        </div>
                    </div>
                @endforeach
                
                </div>
            </div>
        </div>

        <div class="col-12 col-lg-4">
            <div class="card mb-4">
                <div class="card-header">Base Images</div>
                <div class="card-body" id="base-image-section">
                    <div class="mb-3">
                        <label class="form-label">Images</label>
                        <input type="file" name="base_images[]" class="form-control" multiple>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button type="submit" class="btn btn-success">Update Product</button>
</form>
@endsection
