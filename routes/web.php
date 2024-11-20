<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MatchController;

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

Route::get('/', [MatchController::class, 'index']);
Route::get('/home', [MatchController::class, 'home'])->name('home');
Route::get('/insight_detail', [MatchController::class, 'insight_detail'])->name('insight_detail');
Route::get('/insight', [MatchController::class, 'insight'])->name('insight');
Route::get('/player', [MatchController::class, 'player'])->name('player');
Route::get('/event', [MatchController::class, 'event'])->name('event');
Route::get('/saweria', [MatchController::class, 'saweria'])->name('saweria');
Route::get('/matchmaking', [MatchController::class, 'matchmaking'])->name('matchmaking');
Route::get('/about', [MatchController::class, 'about'])->name('about');

