<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard;
use App\Http\Controllers\UsersClient;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [UsersClient::class, 'home']);


Route::get('/home', [UsersClient::class, 'home']);

Route::get('/profile/{id}',[Dashboard::class, 'editBook'])->name('book_profile');

Route::get('/test',[UsersClient::class,'connectApi']);

Route::post('/new_book', [Dashboard::class, 'createNewBookProfile'])->name('newBook');

Route::post('/edit_book/{id}',[Dashboard::class,'editBookProfile'])->name('editBook');

Route::get('/search/',[UsersClient::class,'search'])->name('search');

Route::post('/delete/',[Dashboard::class,'delete'])->name('delete');

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', [Dashboard::class, 'dashboard'])->name('dashboard');
