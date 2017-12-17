<?php

namespace App\Http\Controllers\Api\V1;

use App\Model\Guest;
use App\Model\Message;
use App\Model\MessageAttachment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    public function range()
    {
        $message = Message::with('attachments')->find(15);

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
        $paginates = Message::with('attachments')->where('id', '>', 0)->paginate();
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
        $unique_id = md5($request->input('uid') . date('Ymdhis'));

        $count = Message::where('unique_id', $unique_id)->count();
        if ($count > 0) {
            return response()->json(['status' => 'FAIL', 'errorCode' => 100003, 'errorMessage' => 'Union id is exists!']);
        }
        $guest = Guest::where('uid', $request->input('uid'))->first();
        if ($guest) {
            $uploadedFiles = $request->allFiles();
            $hasUploaded = [];
            foreach ($uploadedFiles['file'] as $uploadedFile) {
                $extension = $uploadedFile->getClientOriginalExtension();
                if (!in_array($extension, config('message.attachment.extension'))) {
                    continue;
                }
                $mimeType = $uploadedFile->getMimeType();
                if (!in_array($mimeType, config('message.attachment.mimetype'))) {
                    continue;
                }
                $path = $uploadedFile->store('message');
                if (!empty($path)) {
                    $hasUploaded[] = [
                        'mimeType' => $mimeType,
                        'path' => $path
                    ];
                }
            }
            $message = new Message();
            $message->message = $request->input('message');
            $message->unique_id = $unique_id;
            $message->guest_id = $guest->id;
            $message->has_active = 0;
            if ($message->save()) {
                if (count($hasUploaded) > 0) {
                    foreach ($hasUploaded as $upload) {
                        $attachment = new MessageAttachment();
                        $attachment->message_id = $message->id;
                        $attachment->path = $upload['path'];
                        $attachment->mime_type = $upload['mimeType'];
                        $attachment->save();
                    }
                }
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
