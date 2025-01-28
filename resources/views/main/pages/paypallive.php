<!-- ENV -->
PAYPAL_CLIENT_ID=AeahRqJThPaFSXH8KFte9e62eoeeC0S3S3DpzCj-VMimrfaFd6n4tJYkpATAwn2xH920BXQG-uwpm-Hp
PAYPAL_SECRET=EGXOBhmwVk0117x9Q-zj8Yr57DmhTWv9DFXzFL2P6WH2Vf2BM80X07I73mqM-Q5iKPzMjU-5Qoe4srMq
PAYPAL_MODE=live

<!-- Config/paypal.php -->

return [

    'client_id' => 'AeahRqJThPaFSXH8KFte9e62eoeeC0S3S3DpzCj-VMimrfaFd6n4tJYkpATAwn2xH920BXQG-uwpm-Hp',
    'secret' => 'EGXOBhmwVk0117x9Q-zj8Yr57DmhTWv9DFXzFL2P6WH2Vf2BM80X07I73mqM-Q5iKPzMjU-5Qoe4srMq',

    'settings' => array(

    'mode' => 'live',
    'http.ConnectionTimeOut' => 1000,
    'log.LogEnabled' => true,
    'log.FileName' => storage_path() . '/logs/paypal.log',
    'log.LogLevel' => 'FINE'

    ),
    ];

    <!-- PaypalModel.php (vendor/paypal/rest-api-sdk-php/lib/paypal/common/paypalmodel.php)-->
<!-- command:
composer require paypal/rest-api-sdk-php -->


    private function _convertToArray($param)
    {
        $ret = array();
        foreach ($param as $k => $v) {
            if ($v instanceof PayPalModel) {
                $ret[$k] = $v->toArray();
            } else if (is_array($v) && sizeof($v) <= 0 ) {
                $ret[$k] = array();
            } else if (is_array($v)) {
                $ret[$k] = $this->_convertToArray($v);
            } else {
                $ret[$k] = $v;
            }
        }
        // If the array is empty, which means an empty object,
        // we need to convert array to StdClass object to properly
        // represent JSON String
        if (sizeof($ret) <= 0) {
            $ret = new PayPalModel();
        }
        return $ret;
    }
