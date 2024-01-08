<?php

use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [ProductController::class, 'create'])->name('product.create');
Route::get('attribute-value', [ProductController::class, 'attributeValue'])->name('product.attribute.value');
Route::get('attribute-value-form', [ProductController::class, 'attributeValueForm'])->name('product.attribute.value.form');
Route::post('store-product', [ProductController::class, 'store'])->name('product.store');
Route::get('generate-barcode', [ProductController::class, 'generateBarcode'])->name('generate-barcode');
