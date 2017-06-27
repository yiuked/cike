<?php
namespace App\Http\Controllers\Api\V1\Auth;

use App\Model\User;
use App\Model\Sms;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\UsersSms;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;

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

    use RegistersUsers,UsersSms;

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
        $sms =  isset($data['phone']) ? Sms::where('phone', $data['phone'])->orderBy('id', 'desc')->first() : null;
        $code = empty($sms) ? rand(100000,999999):$sms->code;
        return Validator::make($data, [
            'phone' => 'required|phone|size:11|unique:users',
            'password' => 'required|string|min:6',
            'code' => 'required|in:' . $code
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
            'name' => $data['phone'],
            'phone' => $data['phone'],
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
                'username' => $request->input('phone'),
                'password' => $request->input('password'),
                'scope' => '*',
            ],
        ]);
        return json_decode((string) $response->getBody(), true);
    }
}
