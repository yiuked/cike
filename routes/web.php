<?php

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();
Route::group(['prefix' => 'user', 'middleware' => ['web', 'auth']], function () {
    Route::get('/', 'Admin\DashboardController@index');
    //Route::get('user/profile', 'UserController@showProfile')
    //Route::controller('users', 'Admin\UsersController');
    //Route::controller('credit', 'Admin\CreditController');
});


Route::get('/home', 'HomeController@index')->name('home');
