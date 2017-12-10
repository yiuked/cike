<?php

namespace App\Http\Controllers\Api\V1;

use App\Model\Message;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MessageController extends Controller
{
    public function range() {
        $message = Message::find(1);
        if (empty($message)) {
            return response()->json(['status' => 'FAIL', 'code' => 100001, 'msg' => '找不到相关的记录']);
        }
        return response()->json([
            'status' => 'SUCCESS',
            'code'   => 0,
            'object' => $message
        ]);
    }

    public function history() {
        $paginates = Message::where('id', '>', 0)->paginate();
        if (empty($paginates)) {
            return response()->json(['status' => 'FAIL', 'code' => 100001, 'msg' => '找不到相关的记录']);
        }
        return response()->json([
            'status' => 'SUCCESS',
            'code'   => 0,
            'object' => $paginates
        ]);
    }

    public function add() {
        return response()->json([
            'status' => 'SUCCESS',
            'code'   => 0,
        ]);
    }
}
