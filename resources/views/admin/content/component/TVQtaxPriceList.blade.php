@extends('admin.layouts.layoutMaster')

@section('title', 'Tax Pricing Modification')

@section('content')
<h4 class="py-3 mb-4">
    <span class="text-muted fw-light">Component /</span> TVQ Tax Pricing Modification
</h4>

<div class="card">
    <div class="card-header">
        <h5 class="card-title mb-0">TVQ Tax Percentage</h5>
    </div>
    <div class="card-datatable table-responsive">
        <table class="table ">
            <thead class="border-top">
                <tr>
                    <th >Tax No</th>
                    <th >Tax Percentage</th>
                    <th >Actions</th>
                </tr>
            </thead>
            <tbody>
                @if($taxPercentage)
                <tr>
                    <td>{{ $taxPercentage->taxno }}</td>
                    <td>{{ $taxPercentage->percentage }}%</td>
                    <td>
                        <a href="{{ route($prefix .'.TVQtax_price.edit', $taxPercentage->id) }}" class="btn btn-warning">Edit</a>
                        <form action="{{ route($prefix .'.TVQtax_price.destroy', $taxPercentage->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                    </td>
                </tr>
                @else
                <tr>
                    <td colspan="2" class="text-center">
                        <a href="{{ route($prefix .'.TVQtax_price.create') }}" class="btn btn-primary">Add</a>
                    </td>
                </tr>
                @endif
            </tbody>
        </table>
    </div>
</div>
@endsection
