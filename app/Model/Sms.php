<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;

class Sms extends Model{
    public function AddSms($data = array())
    {
        global $mysql;
        //手机号码不能为空
        if (!IsExiest($data['phone'])) return "approve_sms_phone_empty";
        //判断用户名是否存在
        if (IsExiest($data['username']) != false) {
            $sql = "select user_id from `{users}` where username='{$data['username']}'";
            $result = $mysql->db_fetch_array($sql);
            if ($result == false) return "approve_sms_username_not_exiest";
            $data['user_id'] = $result['user_id'];
        }
        //判断用户id是否存在
        if (!IsExiest($data['user_id'])) {
            return "approve_sms_userid_not_exiest";
        }

        //判断手机号码是否存在,状态0表示申请中，1表示通过，2表示审核不通过，3表示过期
        $sql = "select 1 from `{approve_sms}` where `phone`='{$data['phone']}' and status=1";
        $result = $mysql->db_fetch_array($sql);
        if ($result != false) return "approve_sms_phone_exiest";
        $status = isset($data['status']) ? $data['status'] : 0;
        $sql = "insert into `{approve_sms}` set `addtime` = '" . time() . "',`addip` = '" . ip_address() . "',user_id='{$data['user_id']}',status={$status},`phone`='{$data['phone']}'";
        $mysql->db_query($sql);
        $id = $mysql->db_insert_id();
        return $id;
    }
}