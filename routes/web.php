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
//Route::post('sms', ['as' => 'sms', 'uses' => 'Auth\RegisterController@registerCode']);
//Auth::routes();

//Route::group(['prefix' => config('custom.system.admin_prefix'), 'middleware' => ['web', 'auth']], function () {
//    Route::get('/', 'Admin\DashboardController@index');
//
//    // 用户管理
//    Route::get('users', 'Admin\UsersController@index');                    # 用户列表
//    Route::get('users/profile/{id}', 'Admin\UsersController@profile');     # 用户详情
//    Route::get('users/update/{id}', 'Admin\UsersController@update');     # 用户详情
//    Route::post('users/update/{id}', 'Admin\UsersController@update');     # 用户详情
//    //Route::get('user/profile', 'UserController@showProfile')
//    //Route::controller('credit', 'Admin\CreditController');
//});


//Route::get('/home', 'HomeController@index')->name('home');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
