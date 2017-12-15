<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['namespace' => 'Api\V1'], function(){
    Route::post('guest/init', 'GuestController@init');
    Route::get('message/range', 'MessageController@range');
    Route::get('message/history', 'MessageController@history');
    Route::post('message/add', 'MessageController@add');
    Route::post('register', 'Auth\RegisterController@register');
    Route::post('/login',
        ['as'   => 'login',
            'uses' => '\Laravel\Passport\Http\Controllers\AccessTokenController@issueToken',
        ]);
//    Route::middleware('auth:api')->group(function () {
//        Route::resource('comments', 'CommentsController', ['only' => 'destroy']);
//        Route::resource('posts.comments', 'PostCommentsController', ['only' => 'store']);
//        Route::resource('users', 'UsersController', ['only' => 'update']);
//    });
//
//
//
//    Route::resource('posts.comments', 'PostCommentsController', ['only' => 'index']);
//    Route::resource('comments', 'CommentsController', ['only' => ['index', 'show']]);
//    Route::get('users/{user}/comments', 'UsersController@comments');
//
//    Route::resource('posts', 'PostsController', ['only' => ['index', 'show']]);
//    Route::get('users/{user}/posts', 'UsersController@posts')->name('users.posts.index');
//
//    Route::resource('users', 'UsersController', ['only' => ['index', 'show']]);
});
