@props(['country'])

@if($country === 'USA')
    {{-- Display USD symbol before the amount --}}
    <span>$</span>
@endif
