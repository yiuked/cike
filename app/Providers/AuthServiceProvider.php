<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Request;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * 如果你需要对某个资源或者模式进行授权控制，可以使用策略类进行配置.
     *
     * @var array
     */
//    protected $policies = [
//        'App\Model' => 'App\Policies\ModelPolicy',
//    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // API认证路由
        Passport::routes();

        // Gate验证，事先声明好某种规则，然后通过输入不同的参数得出最终结果.
        Gate::define('isHaveAccess', function ($user, Request $request) {
            return true;
        });
    }
}
