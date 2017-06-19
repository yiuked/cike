<?php

namespace App\Http\Controllers\Traits;

use App\Model\Sms;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

trait UsersSms
{
    /**
     * 发送验证码
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function registerCode(Request $request)
    {
        $validate = $this->validatorPhone($request->all());
        if ($validate->fails()) {
            return response()->json(['status' => 'FAIL', 'errorCode' => 100001, 'errorMessage' => $validate->getMessageBag()->first()]);
        }

        if ($this->checkFrequentlyByEloquent($request->input('phone'))) {
            return response()->json(['status' => 'FAIL', 'errorCode' => 100001, 'errorMessage' => '验证码发送过于频繁!']);
        }


        $code = rand(1000,9999);
        $result = app('sms')->sendTemplateSMS($request->input('phone'), [$code], app('config')->get('sms.tpl.register'));

        if ($result->statusCode == '0') {
            $sms = new Sms();
            $sms->type = 'register';
            $sms->code = $code;
            $sms->phone = $request->input('phone');
            $sms->contents = "尊敬的用户：您在置上金融网站上的验证码是:" . $sms->code . "，请及时输入，工作人员不会向您索取，请勿泄露。";
            $sms->save();

            return response()->json(['status' => 'SUCCESS']);
        }
        return response()->json(['status' => 'FAIL', 'errorCode' => 100001, 'errorMessage' => '验证码发送过于频繁!']);
    }


    /**
     * 验证手机号码是否合法
     * @param array $data
     * @return mixed
     */
    protected function validatorPhone(array $data)
    {
        $messages = [
            'phone.required' => 'The :attribute field is required.',
            'phone.phone' => 'The :attribute field is required.',
            'phone.size' => 'The :attribute field is required.',
        ];
        return Validator::make($data, [
            'phone' => 'required|phone|size:11',
        ], $messages);
    }

    /**
     * 检测验证码是否过于发送频率
     * @return bool
     */
    protected function checkFrequentlyBySession()
    {
        $timestamp = (int)session()->get('late_send_register_code_timestamp');

        if ($timestamp <= 0) {
            session()->put('late_send_register_code_timestamp', time());
            return false;
        }

        if (time() - $timestamp > app('config')->get('sms.code_resend_time')) {
            return false;
        }
        return true;
    }

    protected function checkFrequentlyByEloquent($phone) {
        $sms = Sms::where('phone', $phone)->orderBy('id', 'desc')->first();
        if (empty($sms)) {
            return false;
        }
        if (time() - $sms->created_at->timestamp > app('config')->get('sms.code_resend_time')) {
            return false;
        }
        return true;
    }
}
