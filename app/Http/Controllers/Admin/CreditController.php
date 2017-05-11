<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Http\Requests;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use App\Library\AliCredit\ZmopClient;
use App\Library\AliCredit\Request\CreditScoreGetRequest;
use App\Library\AliCredit\Request\AuthInfoAuthorizeRequest;
use App\Library\AliCredit\Request\CreditWatchlistiiGetRequest;

class CreditController extends Controller
{
    public static $_client = null;
    public function __construct()
    {
        if (self::$_client == null) {
            self::$_client = new ZmopClient(config('credit.gateway_url'), config('credit.app_id'), config('credit.charset'), config('credit.private_key_file'), config('credit.public_key_file'));
        }
    }

    public function getIndex()
    {
        $user = Auth::user();
        $request = new CreditScoreGetRequest();
        $request->setPlatform(config('credit.platform'));
        $request->setTransactionId(date('YmdHis'));// 必要参数
        $request->setProductCode(config('credit.product_code'));// 必要参数
        $request->setOpenId($user->zmxy_uid);// 必要参数
        $response = self::$_client->execute($request);
        echo json_encode($response);
        //return view('admin.home');
    }

    public function getWatchlist() {
        $user = Auth::user();
        $request = new CreditWatchlistiiGetRequest();
        $request->setPlatform(config('credit.platform'));
        $request->setTransactionId(date('YmdHis'));// 必要参数
        $request->setProductCode(config('credit.product_code'));// 必要参数
        $request->setOpenId($user->zmxy_uid);// 必要参数
        $response = self::$_client->execute($request);
        echo json_encode($response);
    }

    public function postAuth(Request $req) {
        $request = new AuthInfoAuthorizeRequest();
        $request->setChannel("apppc");
        $request->setPlatform(config('credit.platform'));
        $request->setIdentityType("2");// 必要参数
        $request->setIdentityParam("{\"name\":\"" .$req->input("realname"). "\",\"certType\":\"IDENTITY_CARD\",\"certNo\":\"" .$req->input("card_id"). "\"}");// 必要参数
        $request->setBizParams("{\"auth_code\":\"M_APPPC_CERT\",\"channelType\":\"apppc\"}");//
        $url = self::$_client->generatePageRedirectInvokeUrl($request);
        return redirect($url);
    }
}
