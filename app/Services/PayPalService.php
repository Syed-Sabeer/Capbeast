<?php

namespace App\Services;

use PayPal\Api\Amount;
use PayPal\Api\Transaction;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\RedirectUrls;
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;

class PayPalService
{
    protected $apiContext;

    public function __construct()
    {
        // Using the provided PayPal credentials
        $paypalClientId = 'ASStNaPPMXc8Duo9rq6d9HJgrj2UwfvgSPcVr2JDqUricsCT0sFK0JamNgJuyk8fQ9k-gt-QDWDAoG85';
        $paypalSecret = 'EPsGPhhyUX_C9FCW1cs45OwiHL_NMHCjeaPwIYfwfBQoP8xjCihHeiEkfKei69LUH-l6aT5MQQvffiVh';

        $this->apiContext = new ApiContext(new OAuthTokenCredential($paypalClientId, $paypalSecret));
        $this->apiContext->setConfig([
            'mode' => 'sandbox',  // Set this to 'live' for production
        ]);
    }

    public function createPayment($totalPrice)
    {
        $payer = new Payer();
        $payer->setPaymentMethod('paypal');

        $amount = new Amount();
        $amount->setTotal($totalPrice)
            ->setCurrency('USD');  // Set the currency to your preference

        $transaction = new Transaction();
        $transaction->setAmount($amount)
            ->setDescription('Order Payment');

        $redirectUrls = new RedirectUrls();
        $redirectUrls->setReturnUrl(route('payment.success'))
            ->setCancelUrl(route('payment.cancel'));

        $payment = new Payment();
        $payment->setIntent('sale')
            ->setPayer($payer)
            ->setTransactions([$transaction])
            ->setRedirectUrls($redirectUrls);

        try {
            $payment->create($this->apiContext);
            return $payment;
        } catch (\Exception $e) {
            throw new \Exception("Error creating PayPal payment: " . $e->getMessage());
        }
    }

    public function executePayment($paymentId, $payerId)
    {
        $payment = Payment::get($paymentId, $this->apiContext);

        $execution = new PaymentExecution();
        $execution->setPayerId($payerId);

        try {
            $payment->execute($execution, $this->apiContext);
            return $payment;
        } catch (\Exception $e) {
            throw new \Exception("Error executing PayPal payment: " . $e->getMessage());
        }
    }
}
