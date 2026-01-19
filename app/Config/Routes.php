<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');

$routes->group('admin', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
    $routes->get('/', 'Dashboard::index');
    $routes->get('dashboard', 'Dashboard::index');

    $routes->group('product-categories', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'ProductCategory::index');
        $routes->post('addFiles', 'ProductCategory::addFiles');
        $routes->get('removeFiles', 'ProductCategory::removeFiles');
        $routes->get('save', 'ProductCategory::save');
        $routes->get('save/(:num)', 'ProductCategory::save/$1');
        $routes->post('save', 'ProductCategory::save');
        $routes->post('save/(:num)', 'ProductCategory::save/$1');
        $routes->get('remove/(:num)', 'ProductCategory::remove/$1');
    });

    $routes->group('login', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Login::index');
        $routes->post('login', 'Login::login');
        $routes->get('logout', 'Login::logout');
    });

    $routes->group('customers', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Customer::index');
    });

    $routes->group('orders', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Orders::index');
    });

    $routes->group('products', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Product::index');
        $routes->post('addFiles', 'Product::addFiles');
        $routes->get('removeFiles', 'Product::removeFiles');
        $routes->get('save', 'Product::save');
        $routes->post('save', 'Product::save');
        $routes->get('save/(:num)', 'Product::save/$1');
        $routes->post('save/(:num)', 'Product::save/$1');
        $routes->get('remove/(:num)', 'Product::remove/$1');
        $routes->get('removeFile/(:num)', 'Product::removeFile/$1');
        $routes->post('generateProductFromCSV', 'Product::generateProductFromCSV');
    });

    $routes->group('banner', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Banner::index');
        $routes->post('addFiles', 'Banner::addFiles');
        $routes->get('removeFiles', 'Banner::removeFiles');
        $routes->add('save', 'Banner::save');
        $routes->add('save/(:num)', 'Banner::save/$1');
        $routes->get('remove/(:num)', 'Banner::remove/$1');
        $routes->get('removeFile/(:num)', 'Banner::removeFile/$1');
    });

    $routes->group('pages', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Pages::index');
        $routes->post('addFiles', 'Pages::addFiles');
        $routes->get('removeFiles', 'Pages::removeFiles');
        $routes->get('save', 'Pages::save');
        $routes->post('save', 'Pages::save');
        $routes->get('save/(:num)', 'Pages::save/$1');
        $routes->post('save/(:num)', 'Pages::save/$1');
        $routes->get('remove/(:num)', 'Pages::remove/$1');
    });

    $routes->group('special-blocks', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'SpecialBlocks::index');
        $routes->post('addFiles', 'SpecialBlocks::addFiles');
        $routes->get('removeFiles', 'SpecialBlocks::removeFiles');
        $routes->add('save', 'SpecialBlocks::save');
        $routes->add('save/(:num)', 'SpecialBlocks::save/$1');
        $routes->get('remove/(:num)', 'SpecialBlocks::remove/$1');
    });

    $routes->group('seo', ['namespace' => 'App\Controllers\Admin'], function ($routes) {
        $routes->get('/', 'Seo::index');
        $routes->add('save', 'Seo::save');
        $routes->add('save/(:num)', 'Seo::save/$1');
    });
});

$routes->group('api', ['namespace' => 'App\Controllers\Api'], function ($routes) {
    $routes->group('v1', ['namespace' => 'App\Controllers\Api'], function ($routes) {
        $routes->get('product/categories', 'Product::getCategories');
        $routes->get('product/categories/(:num)', 'Product::getProductsbyCatId/$1');
        $routes->get('product/search', 'Product::productSearch');
        $routes->get('product/(:num)', 'Product::getProductsbyId/$1');
        $routes->post('user/login', 'User::login');
        $routes->get('user/shipping-address/(:num)', 'User::getShippingAddress/$1');
        $routes->post('user/shipping-address/(:num)', 'User::saveShippingAddress/$1');
        $routes->post('user/profile/(:num)', 'User::profileUpdate/$1');
        $routes->post('order/cal-shipping-charge', 'Order::calShippingCharges');
        $routes->post('order/create', 'Order::createOrder');
        $routes->get('order/details/(:num)', 'Order::getOrderDetailsById/$1');
        $routes->get('order/(:num)', 'Order::getOrderByCustomerId/$1');
        $routes->get('page/(:num)', 'Page::getPageById/$1');
        // $routes->add('product', 'Product::productList');
    });
});

// $routes->add('cart', 'Cart::index');
// $routes->add('cart/index', 'Cart::index');
// $routes->add('category', 'Category::index');
// $routes->add('product/(:any)', 'Product::index/$1');
// $routes->add('product-details/(:any)', 'ProductDetails::index/$1');
// // $routes->add('product', 'Product::index');

// $routes->add('products', 'Collections::productByCategory');

// $routes->add('my-account', 'User::index');
// $routes->add('loginBfrOtp', 'User::loginBfrOtp');
// $routes->add('loginAftrOtp', 'User::loginAftrOtp');
// $routes->add('registerBfrOtp', 'User::registerBfrOtp');
// $routes->add('registerAftrOtp', 'User::registerAftrOtp');

$routes->get('about-us', 'Page::index/about-us');
$routes->get('privacy-policy', 'Page::index/privacy-policy');
$routes->get('refund-policy', 'Page::index/refund-policy');
$routes->get('shipping-policy', 'Page::index/shipping-policy');
$routes->get('terms-and-condition', 'Page::index/terms-and-condition');
$routes->get('severance', 'Page::index/severance');
$routes->get('warranty', 'Page::index/warranty');
