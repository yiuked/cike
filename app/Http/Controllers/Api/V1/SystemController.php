<?php
namespace App\Http\Controllers\Api\V1;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/6/19
 * Time: 18:20
 */
use App\Http\Controllers\Controller;
use Laravel\Passport\ClientRepository;

class SystemController extends Controller {

    public function init() {
        $repository = new ClientRepository();
        $client = $repository->findActive(app('config')->get('auth.client.client_id'));
        if (empty($client)) {
            return response()->json(['status' => 'FAIL', 'errorCode' => 100001, 'errorMessage' => '找不到有效的客户端!']);
        }
        return response()->json(['status' => 'SUCCESS', 'client_id' => $client->id, 'client_secret' => $client->secret]);
    }
}