<?php

use Illuminate\Support\Facades\Route;




use App\Http\Controllers\Main\ProductDetailController;
use App\Http\Controllers\Main\ProductController;
use App\Http\Controllers\Main\AboutController;
use App\Http\Controllers\Main\HomeController;
use App\Http\Controllers\Main\ContactController;
use App\Http\Controllers\Main\AuthController;
use App\Http\Controllers\Main\FAQsController;
use App\Http\Controllers\Main\CartController;
use App\Http\Controllers\Main\OrderController;

use App\Http\Controllers\Admin\apps\EcommercePrintingList;
use App\Http\Controllers\Admin\apps\EcommerceDashboard;
use App\Http\Controllers\Admin\apps\EcommerceProductAdd;
use App\Http\Controllers\Admin\apps\EcommerceProductList;
use App\Http\Controllers\Admin\apps\EcommerceAuthController;
use App\Http\Controllers\Admin\apps\EcommercePrintingAdd;
use App\Http\Controllers\Admin\apps\EcommerceDeliveryAdd;
use App\Http\Controllers\Admin\apps\EcommerceDeliveryList;
use App\Http\Controllers\Admin\apps\EcommerceOrderList;
use App\Http\Controllers\Admin\apps\EcommerceCustomerDetailsOverview;
use App\Http\Controllers\Admin\apps\EcommerceOrderDetails;
use App\Http\Controllers\Admin\apps\EcommerceCustomerAll;

use App\Http\Controllers\Admin\components\ProductColorController;
use App\Http\Controllers\Admin\components\FontController;
use App\Http\Controllers\Admin\components\InternalStatusController;


Route::get('/', function () {
  return redirect()->route('home');
});

Route::prefix('main')->group(function () {
  // Routes that require authentication
  Route::middleware('auth')->group(function () {
    
    Route::post('/cart/add', [CartController::class, 'add'])->name('cart.add');
    Route::get('/cart', [CartController::class, 'index'])->name('cart');
    Route::delete('/cart/remove/{itemId}', [CartController::class, 'remove'])->name('cart.remove');
    Route::get('/checkout', [OrderController::class, 'index'])->name('checkout');
    Route::post('/checkout/add', [OrderController::class, 'add'])->name('checkout.add');
    Route::get('/order-success', [OrderController::class, 'orderSuccess'])->name('main.pages.success');
    Route::get('/order-history', [OrderController::class, 'orderHistory'])->name('main.pages.orderhistory');
    Route::get('/view-color-book', [ProductDetailController::class, 'showColorBook']);
  });
  Route::get('/productDetail/{id}', [ProductDetailController::class, 'index'])->name('product.detail');
  Route::get('/products', [ProductController::class, 'index'])->name('products');
  Route::get('/about', [AboutController::class, 'index'])->name('about');
  Route::get('/home', [HomeController::class, 'index'])->name('home');
  Route::get('/contact', [ContactController::class, 'index'])->name('contact');
  Route::get('/faqs', [FAQsController::class, 'index'])->name('faqs');
  // Routes for registration that do not require authentication
  // Registration Routes
  Route::get('/register', [AuthController::class, 'showRegistrationForm'])->name('user.register');
  Route::post('/register', [AuthController::class, 'register'])->name('user.register.post');

  // Login Routes
  // Login Routes
  Route::get('/login', [AuthController::class, 'showLoginForm'])->name('user.login'); // Ensure this is defined as 'user.login'
  Route::post('/login', [AuthController::class, 'login'])->name('user.login.post'); // Make sure 'user.login.post' is used here

  // Logout Routes
  Route::post('/logout', [AuthController::class, 'logout'])->name('user.logout');
});


// Routes for unauthenticated admin
Route::prefix('admin')->middleware('guest:admin')->group(function () {
  Route::get('login', [EcommerceAuthController::class, 'showLoginForm'])->name('admin.login');
  Route::post('login', [EcommerceAuthController::class, 'login'])->name('admin.login.post');
});

// Admin routes (only accessible for authenticated admins)
Route::prefix('admin')->middleware('auth:admin')->group(function () {

  Route::prefix('/component')->group(function () {
    // For Product Color
    Route::get('/productcolor/add', [ProductColorController::class, 'index'])->name('content-product-color-add');
    Route::post('/productcolor/add', [ProductColorController::class, 'store'])->name('content-product-color-store');
    Route::get('/productcolor/list', [ProductColorController::class, 'list'])->name('content-product-color-list');
    Route::get('/productcolor/edit/{id}', [ProductColorController::class, 'edit'])->name('content-product-color-edit');
    Route::post('/productcolor/update/{id}', [ProductColorController::class, 'update'])->name('content-product-color-update');
    Route::delete('/productcolor/delete/{id}', [ProductColorController::class, 'destroy'])->name('content-product-color-delete');

    Route::get('/InternalStatus/list', [InternalStatusController::class, 'index'])->name('content-embroidery-color-list');
    Route::get('/InternalStatus/add', [InternalStatusController::class, 'create'])->name('InternalStatus.index');
    // Store new color
    Route::post('/InternalStatus/store', [InternalStatusController::class, 'store'])->name('order-internal-status.store');

    // Edit color (this can be a GET route to display the edit form)
    Route::get('/InternalStatus/edit/{id}', [InternalStatusController::class, 'edit'])->name('order-internal-status.edit');

    // Update color (this can be a POST or PATCH route to update the color)
    Route::put('/InternalStatus/update/{id}', [InternalStatusController::class, 'update'])->name('order-internal-status.update');

    // Soft delete color
    Route::delete('/InternalStatus/delete/{id}', [InternalStatusController::class, 'destroy'])->name('order-internal-status.destroy');
    Route::patch('/InternalStatus/restore/{id}', [InternalStatusController::class, 'restore'])->name('order-internal-status.index');
  });




  Route::get('/component/font/add', [FontController::class, 'index'])->name('app-ecommerce-printing-add');

  Route::get('/dashboard', [EcommerceDashboard::class, 'index'])->name('app-ecommerce-dashboard');

  Route::get('/delivery/add', [EcommerceDeliveryAdd::class, 'index'])->name('app-ecommerce-delivery-add');
  Route::post('/delivery/add', [EcommerceDeliveryAdd::class, 'store'])->name('app-ecommerce-delivery-store');
  Route::get('/delivery/list', [EcommerceDeliveryList::class, 'index'])->name('app-ecommerce-delivery-list');

  Route::get('/printing/add', [EcommercePrintingAdd::class, 'index'])->name('app-ecommerce-printing-add');
  Route::post('/printing/add', [EcommercePrintingAdd::class, 'store'])->name('app-ecommerce-printing-store');
  Route::get('/printing/list', [EcommercePrintingList::class, 'index'])->name('app-ecommerce-printing-list');

  Route::get('/order/list', [EcommerceOrderList::class, 'index'])->name('app-ecommerce-order-list');
  Route::get('/order/detail/{orderId}', [EcommerceOrderDetails::class, 'index'])->name('app-ecommerce-order-detail');
  Route::post('/order/upload-file/{id}', [EcommerceOrderDetails::class, 'orderfileupload'])->name('order.file.upload');
  Route::post('/order/{orderId}/update-status', [EcommerceOrderDetails::class, 'updateOrderStatus'])->name('order-status.update');

  Route::post('/admin/orders/{id}/status', [EcommerceOrderList::class, 'updateStatus'])->name('admin.orders.updateStatus');



  Route::get('/customer/all', [EcommerceCustomerAll::class, 'index'])->name('app-ecommerce-customer-all');
  Route::get('/customer/{id}', [EcommerceCustomerDetailsOverview::class, 'index'])->name('app-ecommerce-customer-detail');
  Route::post('/update-status/{id}', [EcommerceCustomerAll::class, 'updateStatus'])->name('update.status');


  Route::get('/product/add', [EcommerceProductAdd::class, 'index'])->name('app-ecommerce-product-add');
  Route::post('/product/add', [EcommerceProductAdd::class, 'store'])->name('app-ecommerce-product-store');
  Route::get('/product/list', [EcommerceProductList::class, 'index'])->name('app-ecommerce-product-list');
  Route::delete('/product/{id}', [EcommerceProductList::class, 'destroy'])->name('products.destroy');
  Route::get('/product/edit/{id}', [EcommerceProductAdd::class, 'edit'])->name('app-ecommerce-product-edit');
  Route::post('/product/edit/{id}', [EcommerceProductAdd::class, 'update'])->name('app-ecommerce-product-update');

  Route::post('/update-visibility/{id}', [EcommerceProductList::class, 'updateVisibility'])->name('update.visibility');

  // Admin logout route
  Route::post('/logout', [EcommerceAuthController::class, 'logout'])->name('admin.logout');
});








// // Main Page Route
// Route::get('/', [Analytics::class, 'index'])->name('dashboard-analytics');
// Route::get('/dashboard/analytics', [Analytics::class, 'index'])->name('dashboard-analytics');
// Route::get('/dashboard/crm', [Crm::class, 'index'])->name('dashboard-crm');
// // locale
// Route::get('lang/{locale}', [LanguageController::class, 'swap']);

// // layout
// Route::get('/layouts/collapsed-menu', [CollapsedMenu::class, 'index'])->name('layouts-collapsed-menu');
// Route::get('/layouts/content-navbar', [ContentNavbar::class, 'index'])->name('layouts-content-navbar');
// Route::get('/layouts/content-nav-sidebar', [ContentNavSidebar::class, 'index'])->name('layouts-content-nav-sidebar');
// Route::get('/layouts/navbar-full', [NavbarFull::class, 'index'])->name('layouts-navbar-full');
// Route::get('/layouts/navbar-full-sidebar', [NavbarFullSidebar::class, 'index'])->name('layouts-navbar-full-sidebar');
// Route::get('/layouts/horizontal', [Horizontal::class, 'index'])->name('dashboard-analytics');
// Route::get('/layouts/vertical', [Vertical::class, 'index'])->name('dashboard-analytics');
// Route::get('/layouts/without-menu', [WithoutMenu::class, 'index'])->name('layouts-without-menu');
// Route::get('/layouts/without-navbar', [WithoutNavbar::class, 'index'])->name('layouts-without-navbar');
// Route::get('/layouts/fluid', [Fluid::class, 'index'])->name('layouts-fluid');
// Route::get('/layouts/container', [Container::class, 'index'])->name('layouts-container');
// Route::get('/layouts/blank', [Blank::class, 'index'])->name('layouts-blank');

// // Front Pages
// Route::get('/front-pages/landing', [Landing::class, 'index'])->name('front-pages-landing');
// Route::get('/front-pages/pricing', [Pricing::class, 'index'])->name('front-pages-pricing');
// Route::get('/front-pages/payment', [Payment::class, 'index'])->name('front-pages-payment');
// Route::get('/front-pages/checkout', [Checkout::class, 'index'])->name('front-pages-checkout');
// Route::get('/front-pages/help-center', [HelpCenter::class, 'index'])->name('front-pages-help-center');
// Route::get('/front-pages/help-center-article', [HelpCenterArticle::class, 'index'])->name('front-pages-help-center-article');

// // apps
// Route::get('/app/email', [Email::class, 'index'])->name('app-email');
// Route::get('/app/chat', [Chat::class, 'index'])->name('app-chat');
// Route::get('/app/calendar', [Calendar::class, 'index'])->name('app-calendar');
// Route::get('/app/kanban', [Kanban::class, 'index'])->name('app-kanban');
// Route::get('/app/ecommerce/dashboard', [EcommerceDashboard::class, 'index'])->name('app-ecommerce-dashboard');





// Route::get('/app/ecommerce/product/category', [EcommerceProductCategory::class, 'index'])->name('app-ecommerce-product-category');

// Route::get('/app/ecommerce/order/list', [EcommerceOrderList::class, 'index'])->name('app-ecommerce-order-list');
// Route::get('app/ecommerce/order/details', [EcommerceOrderDetails::class, 'index'])->name('app-ecommerce-order-details');
// Route::get('/app/ecommerce/customer/all', [EcommerceCustomerAll::class, 'index'])->name('app-ecommerce-customer-all');
// Route::get('app/ecommerce/customer/details/overview', [EcommerceCustomerDetailsOverview::class, 'index'])->name('app-ecommerce-customer-details-overview');
// Route::get('app/ecommerce/customer/details/security', [EcommerceCustomerDetailsSecurity::class, 'index'])->name('app-ecommerce-customer-details-security');
// Route::get('app/ecommerce/customer/details/billing', [EcommerceCustomerDetailsBilling::class, 'index'])->name('app-ecommerce-customer-details-billing');
// Route::get('app/ecommerce/customer/details/notifications', [EcommerceCustomerDetailsNotifications::class, 'index'])->name('app-ecommerce-customer-details-notifications');
// Route::get('/app/ecommerce/manage/reviews', [EcommerceManageReviews::class, 'index'])->name('app-ecommerce-manage-reviews');
// Route::get('/app/ecommerce/referrals', [EcommerceReferrals::class, 'index'])->name('app-ecommerce-referrals');
// Route::get('/app/ecommerce/settings/details', [EcommerceSettingsDetails::class, 'index'])->name('app-ecommerce-settings-details');
// Route::get('/app/ecommerce/settings/payments', [EcommerceSettingsPayments::class, 'index'])->name('app-ecommerce-settings-payments');
// Route::get('/app/ecommerce/settings/checkout', [EcommerceSettingsCheckout::class, 'index'])->name('app-ecommerce-settings-checkout');
// Route::get('/app/ecommerce/settings/shipping', [EcommerceSettingsShipping::class, 'index'])->name('app-ecommerce-settings-shipping');
// Route::get('/app/ecommerce/settings/locations', [EcommerceSettingsLocations::class, 'index'])->name('app-ecommerce-settings-locations');
// Route::get('/app/ecommerce/settings/notifications', [EcommerceSettingsNotifications::class, 'index'])->name('app-ecommerce-settings-notifications');
// Route::get('/app/academy/dashboard', [AcademyDashboard::class, 'index'])->name('app-academy-dashboard');
// Route::get('/app/academy/course', [AcademyCourse::class, 'index'])->name('app-academy-course');
// Route::get('/app/academy/course-details', [AcademyCourseDetails::class, 'index'])->name('app-academy-course-details');
// Route::get('/app/logistics/dashboard', [LogisticsDashboard::class, 'index'])->name('app-logistics-dashboard');
// Route::get('/app/logistics/fleet', [LogisticsFleet::class, 'index'])->name('app-logistics-fleet');
// Route::get('/app/invoice/list', [InvoiceList::class, 'index'])->name('app-invoice-list');
// Route::get('/app/invoice/preview', [InvoicePreview::class, 'index'])->name('app-invoice-preview');
// Route::get('/app/invoice/print', [InvoicePrint::class, 'index'])->name('app-invoice-print');
// Route::get('/app/invoice/edit', [InvoiceEdit::class, 'index'])->name('app-invoice-edit');
// Route::get('/app/invoice/add', [InvoiceAdd::class, 'index'])->name('app-invoice-add');
// Route::get('/app/user/list', [UserList::class, 'index'])->name('app-user-list');
// Route::get('/app/user/view/account', [UserViewAccount::class, 'index'])->name('app-user-view-account');
// Route::get('/app/user/view/security', [UserViewSecurity::class, 'index'])->name('app-user-view-security');
// Route::get('/app/user/view/billing', [UserViewBilling::class, 'index'])->name('app-user-view-billing');
// Route::get('/app/user/view/notifications', [UserViewNotifications::class, 'index'])->name('app-user-view-notifications');
// Route::get('/app/user/view/connections', [UserViewConnections::class, 'index'])->name('app-user-view-connections');
// Route::get('/app/access-roles', [AccessRoles::class, 'index'])->name('app-access-roles');
// Route::get('/app/access-permission', [AccessPermission::class, 'index'])->name('app-access-permission');

// // pages
// Route::get('/pages/profile-user', [UserProfile::class, 'index'])->name('pages-profile-user');
// Route::get('/pages/profile-teams', [UserTeams::class, 'index'])->name('pages-profile-teams');
// Route::get('/pages/profile-projects', [UserProjects::class, 'index'])->name('pages-profile-projects');
// Route::get('/pages/profile-connections', [UserConnections::class, 'index'])->name('pages-profile-connections');
// Route::get('/pages/account-settings-account', [AccountSettingsAccount::class, 'index'])->name('pages-account-settings-account');
// Route::get('/pages/account-settings-security', [AccountSettingsSecurity::class, 'index'])->name('pages-account-settings-security');
// Route::get('/pages/account-settings-billing', [AccountSettingsBilling::class, 'index'])->name('pages-account-settings-billing');
// Route::get('/pages/account-settings-notifications', [AccountSettingsNotifications::class, 'index'])->name('pages-account-settings-notifications');
// Route::get('/pages/account-settings-connections', [AccountSettingsConnections::class, 'index'])->name('pages-account-settings-connections');
// Route::get('/pages/faq', [Faq::class, 'index'])->name('pages-faq');
// Route::get('/pages/pricing', [PagesPricing::class, 'index'])->name('pages-pricing');
// Route::get('/pages/misc-error', [MiscError::class, 'index'])->name('pages-misc-error');
// Route::get('/pages/misc-under-maintenance', [MiscUnderMaintenance::class, 'index'])->name('pages-misc-under-maintenance');
// Route::get('/pages/misc-comingsoon', [MiscComingSoon::class, 'index'])->name('pages-misc-comingsoon');
// Route::get('/pages/misc-not-authorized', [MiscNotAuthorized::class, 'index'])->name('pages-misc-not-authorized');

// // authentication
// Route::get('/auth/login-basic', [LoginBasic::class, 'index'])->name('auth-login-basic');
// Route::get('/auth/login-cover', [LoginCover::class, 'index'])->name('auth-login-cover');
// Route::get('/auth/register-basic', [RegisterBasic::class, 'index'])->name('auth-register-basic');
// Route::get('/auth/register-cover', [RegisterCover::class, 'index'])->name('auth-register-cover');
// Route::get('/auth/register-multisteps', [RegisterMultiSteps::class, 'index'])->name('auth-register-multisteps');
// Route::get('/auth/verify-email-basic', [VerifyEmailBasic::class, 'index'])->name('auth-verify-email-basic');
// Route::get('/auth/verify-email-cover', [VerifyEmailCover::class, 'index'])->name('auth-verify-email-cover');
// Route::get('/auth/reset-password-basic', [ResetPasswordBasic::class, 'index'])->name('auth-reset-password-basic');
// Route::get('/auth/reset-password-cover', [ResetPasswordCover::class, 'index'])->name('auth-reset-password-cover');
// Route::get('/auth/forgot-password-basic', [ForgotPasswordBasic::class, 'index'])->name('auth-reset-password-basic');
// Route::get('/auth/forgot-password-cover', [ForgotPasswordCover::class, 'index'])->name('auth-forgot-password-cover');
// Route::get('/auth/two-steps-basic', [TwoStepsBasic::class, 'index'])->name('auth-two-steps-basic');
// Route::get('/auth/two-steps-cover', [TwoStepsCover::class, 'index'])->name('auth-two-steps-cover');

// // wizard example
// Route::get('/wizard/ex-checkout', [WizardCheckout::class, 'index'])->name('wizard-ex-checkout');
// Route::get('/wizard/ex-property-listing', [PropertyListing::class, 'index'])->name('wizard-ex-property-listing');
// Route::get('/wizard/ex-create-deal', [CreateDeal::class, 'index'])->name('wizard-ex-create-deal');

// // modal
// Route::get('/modal-examples', [ModalExample::class, 'index'])->name('modal-examples');

// // cards
// Route::get('/cards/basic', [CardBasic::class, 'index'])->name('cards-basic');
// Route::get('/cards/advance', [CardAdvance::class, 'index'])->name('cards-advance');
// Route::get('/cards/statistics', [CardStatistics::class, 'index'])->name('cards-statistics');
// Route::get('/cards/analytics', [CardAnalytics::class, 'index'])->name('cards-analytics');
// Route::get('/cards/gamifications', [CardGamifications::class, 'index'])->name('cards-gamifications');
// Route::get('/cards/actions', [CardActions::class, 'index'])->name('cards-actions');

// // User Interface
// Route::get('/ui/accordion', [Accordion::class, 'index'])->name('ui-accordion');
// Route::get('/ui/alerts', [Alerts::class, 'index'])->name('ui-alerts');
// Route::get('/ui/badges', [Badges::class, 'index'])->name('ui-badges');
// Route::get('/ui/buttons', [Buttons::class, 'index'])->name('ui-buttons');
// Route::get('/ui/carousel', [Carousel::class, 'index'])->name('ui-carousel');
// Route::get('/ui/collapse', [Collapse::class, 'index'])->name('ui-collapse');
// Route::get('/ui/dropdowns', [Dropdowns::class, 'index'])->name('ui-dropdowns');
// Route::get('/ui/footer', [Footer::class, 'index'])->name('ui-footer');
// Route::get('/ui/list-groups', [ListGroups::class, 'index'])->name('ui-list-groups');
// Route::get('/ui/modals', [Modals::class, 'index'])->name('ui-modals');
// Route::get('/ui/navbar', [Navbar::class, 'index'])->name('ui-navbar');
// Route::get('/ui/offcanvas', [Offcanvas::class, 'index'])->name('ui-offcanvas');
// Route::get('/ui/pagination-breadcrumbs', [PaginationBreadcrumbs::class, 'index'])->name('ui-pagination-breadcrumbs');
// Route::get('/ui/progress', [Progress::class, 'index'])->name('ui-progress');
// Route::get('/ui/spinners', [Spinners::class, 'index'])->name('ui-spinners');
// Route::get('/ui/tabs-pills', [TabsPills::class, 'index'])->name('ui-tabs-pills');
// Route::get('/ui/toasts', [Toasts::class, 'index'])->name('ui-toasts');
// Route::get('/ui/tooltips-popovers', [TooltipsPopovers::class, 'index'])->name('ui-tooltips-popovers');
// Route::get('/ui/typography', [Typography::class, 'index'])->name('ui-typography');

// // extended ui
// Route::get('/extended/ui-avatar', [Avatar::class, 'index'])->name('extended-ui-avatar');
// Route::get('/extended/ui-blockui', [BlockUI::class, 'index'])->name('extended-ui-blockui');
// Route::get('/extended/ui-drag-and-drop', [DragAndDrop::class, 'index'])->name('extended-ui-drag-and-drop');
// Route::get('/extended/ui-media-player', [MediaPlayer::class, 'index'])->name('extended-ui-media-player');
// Route::get('/extended/ui-perfect-scrollbar', [PerfectScrollbar::class, 'index'])->name('extended-ui-perfect-scrollbar');
// Route::get('/extended/ui-star-ratings', [StarRatings::class, 'index'])->name('extended-ui-star-ratings');
// Route::get('/extended/ui-sweetalert2', [SweetAlert::class, 'index'])->name('extended-ui-sweetalert2');
// Route::get('/extended/ui-text-divider', [TextDivider::class, 'index'])->name('extended-ui-text-divider');
// Route::get('/extended/ui-timeline-basic', [TimelineBasic::class, 'index'])->name('extended-ui-timeline-basic');
// Route::get('/extended/ui-timeline-fullscreen', [TimelineFullscreen::class, 'index'])->name('extended-ui-timeline-fullscreen');
// Route::get('/extended/ui-tour', [Tour::class, 'index'])->name('extended-ui-tour');
// Route::get('/extended/ui-treeview', [Treeview::class, 'index'])->name('extended-ui-treeview');
// Route::get('/extended/ui-misc', [Misc::class, 'index'])->name('extended-ui-misc');

// // icons
// Route::get('/icons/tabler', [Tabler::class, 'index'])->name('icons-tabler');
// Route::get('/icons/font-awesome', [FontAwesome::class, 'index'])->name('icons-font-awesome');

// // form elements
// Route::get('/forms/basic-inputs', [BasicInput::class, 'index'])->name('forms-basic-inputs');
// Route::get('/forms/input-groups', [InputGroups::class, 'index'])->name('forms-input-groups');
// Route::get('/forms/custom-options', [CustomOptions::class, 'index'])->name('forms-custom-options');
// Route::get('/forms/editors', [Editors::class, 'index'])->name('forms-editors');
// Route::get('/forms/file-upload', [FileUpload::class, 'index'])->name('forms-file-upload');
// Route::get('/forms/pickers', [Picker::class, 'index'])->name('forms-pickers');
// Route::get('/forms/selects', [Selects::class, 'index'])->name('forms-selects');
// Route::get('/forms/sliders', [Sliders::class, 'index'])->name('forms-sliders');
// Route::get('/forms/switches', [Switches::class, 'index'])->name('forms-switches');
// Route::get('/forms/extras', [Extras::class, 'index'])->name('forms-extras');

// // form layouts
// Route::get('/form/layouts-vertical', [VerticalForm::class, 'index'])->name('form-layouts-vertical');
// Route::get('/form/layouts-horizontal', [HorizontalForm::class, 'index'])->name('form-layouts-horizontal');
// Route::get('/form/layouts-sticky', [StickyActions::class, 'index'])->name('form-layouts-sticky');

// // form wizards
// Route::get('/form/wizard-numbered', [FormWizardNumbered::class, 'index'])->name('form-wizard-numbered');
// Route::get('/form/wizard-icons', [FormWizardIcons::class, 'index'])->name('form-wizard-icons');
// Route::get('/form/validation', [Validation::class, 'index'])->name('form-validation');

// // tables
// Route::get('/tables/basic', [TablesBasic::class, 'index'])->name('tables-basic');
// Route::get('/tables/datatables-basic', [DatatableBasic::class, 'index'])->name('tables-datatables-basic');
// Route::get('/tables/datatables-advanced', [DatatableAdvanced::class, 'index'])->name('tables-datatables-advanced');
// Route::get('/tables/datatables-extensions', [DatatableExtensions::class, 'index'])->name('tables-datatables-extensions');

// // charts
// Route::get('/charts/apex', [ApexCharts::class, 'index'])->name('charts-apex');
// Route::get('/charts/chartjs', [ChartJs::class, 'index'])->name('charts-chartjs');

// // maps
// Route::get('/maps/leaflet', [Leaflet::class, 'index'])->name('maps-leaflet');

// // laravel example
// Route::get('/laravel/user-management', [UserManagement::class, 'UserManagement'])->name('laravel-example-user-management');
// Route::resource('/user-list', UserManagement::class);