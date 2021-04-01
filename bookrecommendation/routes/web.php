<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dashboard;
use App\Http\Controllers\UsersClient;
use App\Http\Controllers\UserDataRecommendation;
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

Route::middleware(['auth:sanctum', 'verified'])->get('/', [UsersClient::class, 'home'])->name('principal');


Route::middleware(['auth:sanctum', 'verified'])->get('/home', [UsersClient::class, 'home'])->name('home');

Route::middleware(['auth:sanctum', 'verified'])->get('/profile/{id}',[Dashboard::class, 'profileBook'])->name('book_profile');

Route::middleware(['auth:sanctum', 'verified'])->get('/test',[UsersClient::class,'connectApi']);

Route::middleware(['auth:sanctum', 'verified'])->post('/new_book', [Dashboard::class, 'createNewBookProfile'])->name('newBook');

Route::middleware(['auth:sanctum', 'verified'])->post('/edit_book/{id}',[Dashboard::class,'editBookProfile'])->name('editBook');

Route::middleware(['auth:sanctum', 'verified'])->get('/search/',[UsersClient::class,'search'])->name('search');

Route::middleware(['auth:sanctum', 'verified'])->post('/delete/',[Dashboard::class,'delete'])->name('delete');
Route::middleware(['auth:sanctum', 'verified'])->get('/library',[UserDataRecommendation::class,'library'])->name('library');

Route::middleware(['auth:sanctum', 'verified'])->post('/save_book/{id}',[UserDataRecommendation::class,'saveBook'])->name('save_book');
Route::middleware(['auth:sanctum', 'verified'])->post('/remove_book/{id}',[UserDataRecommendation::class,'removeBook'])->name('remove_book');

Route::middleware(['auth:sanctum', 'verified'])->get('/genres/{id}',[UsersClient::class,'genreSearch']);

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', [Dashboard::class, 'dashboard'])->name('dashboard')->middleware('admin');;
