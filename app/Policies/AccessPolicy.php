<?php

namespace App\Policies;

use App\Http\Requests\Request;
use App\Model\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AccessPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * ����ͨ���˷�����ָ�����û��Լ�·�ɽ�����Ȩ,���ؽ��Ϊ�����ʾȨ��ͨ��������ͨ��.
     * �ڿ������е���:Gate::denies('checkRouter', self::$router)
     *
     * @param User $user
     * @param Request $request
     * @return bool
     */
    public function checkRouter(User $user, Request $request)
    {
        return true;
    }
}
