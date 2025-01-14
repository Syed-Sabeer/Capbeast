@props(['status'])

@if ($status == 0)
  <span class="badge bg-label-info">In Processing</span>
@elseif ($status == 1)
  <span class="badge bg-label-success">In Production</span>
@else
  <span class="badge bg-label-secondary">Unknown Status</span>
@endif
