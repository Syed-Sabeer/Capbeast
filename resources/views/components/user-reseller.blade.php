
<div>
    @if($isReseller == 0)
    Is Reseller:  No
    @else
    Is Reseller: Yes
        @if($neqNumber)
            <br>NEQ Number: {{ $neqNumber }}
        @endif
    @endif
</div>
