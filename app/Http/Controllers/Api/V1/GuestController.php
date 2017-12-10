<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Model\Guest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class GuestController extends Controller
{
    public function init($uid)
    {
        $validator = Validator::make(['uid' => $uid], [
            'uid' => 'required|unique:guest_users|min:32|max:128',
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return response()->json(['status' => 'FAIL', 'errorCode' => 100001, 'errorMessage' => $errors->first('uid')]);
        }
        if ($guest = Guest::generate($uid)) {
            return response()->json(['status' => 'SUCCESS', 'guest_id' => $guest->id]);
        }
        return response()->json(['status' => 'FAIL', 'errorCode' => 100005, 'errorMessage' => "unknown error!"]);
    }
}
