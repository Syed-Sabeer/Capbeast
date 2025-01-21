<?php

namespace App\Http\Controllers\Main;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use GuzzleHttp\Client;

class HomeController extends Controller
{
    /**
     * Display the homepage with products and Instagram posts.
     */
    public function index()
    {
        // Fetch latest products
        $products = Product::where('visibility', 1)
            ->latest()
            ->take(8)
            ->get();

        // Fetch Instagram posts
        $instagramPosts = $this->getInstagramPostsByUsername('monkey_beanies');

        return view('main.pages.home', compact('products', 'instagramPosts'));
    }

    /**
     * Fetch Instagram posts by username using a third-party API.
     *
     * @param string $username
     * @return array
     */
    private function getInstagramPostsByUsername($username)
    {
        try {
            $client = new Client();
            $response = $client->get('https://api.rapidapi.com/monkey_beanies', [
                'headers' => [
                    'x-rapidapi-key' => env('RAPIDAPI_KEY'), // Add this key to your .env file
                    'x-rapidapi-host' => 'instagram-scraper.p.rapidapi.com',
                ],
                'query' => [
                    'username' => $username,
                ],
            ]);

            $data = json_decode($response->getBody(), true);

            // Limit posts to 7 if the response contains data
            return array_slice($data['posts'], 0, 7);

        } catch (\Exception $e) {
            // Log error for debugging
            Log::error('Failed to fetch Instagram posts: ' . $e->getMessage());
            return [];
        }
    }
}
