<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\Model\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
    }

    /**
     * 用户注册成功后，会调用些函数，在此函数内返回信息，若此函数返回false则页面会进行跳转.
     *
     * @param Request $request
     * @param $user
     * @return mixed
     */
    protected function registered(Request $request, $user)
    {
        // 注册成功返回token
        $client = (new ClientRepository())->createPasswordGrantClient($user->id, $user->name, 'http://localhost');
        $http = new Client();
        $response = $http->post('http://cike.app/oauth/token', [
            'form_params' => [
                'grant_type' => 'password',
                'client_id' => $client->id,
                'client_secret' => $client->secret,
                'username' => $request->input('email'),
                'password' => $request->input('password'),
                'scope' => '*',
            ],
        ]);
        return json_decode((string) $response->getBody(), true);
    }
}
