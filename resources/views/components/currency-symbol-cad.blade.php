@props(['country'])

@if($country === 'CANADA')
    {{-- Display CAD symbol after the amount --}}
    <span>$</span>
@endif
