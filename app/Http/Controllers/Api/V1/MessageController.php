<?php

namespace App\Http\Controllers\Api\V1;

use App\Model\Guest;
use App\Model\Message;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    public function range()
    {
        $message = Message::find(1);
        if (empty($message)) {
            return response()->json(['status' => 'FAIL', 'code' => 100001, 'msg' => '找不到相关的记录']);
        }
        return response()->json([
            'status' => 'SUCCESS',
            'code' => 0,
            'object' => $message
        ]);
    }

    public function history()
    {
        $paginates = Message::where('id', '>', 0)->paginate();
        if (empty($paginates)) {
            return response()->json(['status' => 'FAIL', 'code' => 100001, 'msg' => '找不到相关的记录']);
        }
        return response()->json([
            'status' => 'SUCCESS',
            'code' => 0,
            'object' => $paginates
        ]);
    }

    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'uid' => 'required|min:12|max:128',
            'message' => 'required|min:10|max:128'
        ]);
        if ($validator->fails()) {
            $errors = $validator->errors();
            return response()->json(['status' => 'FAIL', 'errorCode' => 100001, 'errorMessage' => $errors->first()]);
        }
        $unique_id = md5($request->input('uid') . strtotime('YmdHi'));

        $count = Message::where('unique_id', $unique_id)->count();
        if ($count > 0) {
            return response()->json(['status' => 'FAIL', 'errorCode' => 100003, 'errorMessage' => 'Union id is exists!']);
        }
        $guest = Guest::where('uid', $request->input('uid'))->first();
        if ($guest) {
            $message = new Message();
            $message->message = $request->input('message');
            $message->unique_id = $unique_id;
            $message->guest_id = $guest->id;
            $message->images = 1;
            $message->has_active = 0;
            if ($message->save()) {
                return response()->json([
                    'status' => 'SUCCESS',
                    'code' => 0,
                ]);
            }
        }
        return response()->json([
            'status' => 'FAIL',
            'code' => 100002,
            'msg' => '该UID善未完成初始化'
        ]);
    }
}
