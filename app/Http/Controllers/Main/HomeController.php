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
        $instagramPosts = $this->getInstagramPosts();

        return view('main.pages.home', compact('products', 'instagramPosts'));
    }

    /**
     * Fetch latest Instagram posts using the Graph API.
     *
     * @return array
     */
    private function getInstagramPosts()
    {
        try {
            $client = new Client();
            $response = $client->get("https://graph.facebook.com/v18.0/638554745279134/media", [
                'query' => [
                    'fields' => 'id,caption,media_type,media_url,permalink',
                    'access_token' => env('INSTAGRAM_ACCESS_TOKEN'),
                    'limit' => 6
                ]
            ]);
    
            $data = json_decode($response->getBody(), true);
    
            if (!isset($data['data'])) {
                Log::error('Instagram API response does not contain data.', ['response' => $data]);
                return [];
            }
    
            return array_map(function ($post) {
                return [
                    'link' => $post['permalink'] ?? '',
                    'image' => $post['media_url'] ?? '',
                ];
            }, $data['data']);
    
        } catch (\Exception $e) {
            Log::error('Instagram API error: ' . $e->getMessage());
            return [];
        }
    }
    
    
    
}
