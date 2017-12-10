<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Guest extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'guest_users';

    public static function uidIsExists($uid) {
        $users = DB::table('guest_users')
               ->where('uid', $uid)
               ->count();
        return $users;
    }

    /**
     * 生成通过uid生成用户
     * @param $uid
     * @return Guest|bool
     */
    public static function generate($uid) {
        $guest = new Guest();
        $guest->uid = $uid;
        $guest->nickname = self::generateNickName();
        if ($guest->save()) {
            return $guest;
        }
        return false;
    }

    public static function generateNickName() {
        $firstnames = config('nickname.name.first');
        $lastnames = config('nickname.name.last');
        $firstname = $firstnames[array_rand($firstnames)];
        $lastname = $lastnames[array_rand($lastnames)];
        return $firstname . $lastname;
    }


}
