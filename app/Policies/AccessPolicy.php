<?php

namespace App\Policies;

use App\Http\Requests\Request;
use App\User;
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
     * 可以通过此方法对指定的用户以及路由进行授权,返回结果为真则表示权限通过，否则不通过.
     * 在控制器中调用:Gate::denies('checkRouter', self::$router)
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
