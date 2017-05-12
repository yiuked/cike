<?php
/**
 * 请在/bootstrap/autoload.php文件中加载此文件，否则引用函数无效
 */

/**
 * 该方法对Laravel原有的url函数进行扩充，只生成后台URL
 * @param $alias
 * @param array $parameters
 * @param null $secure
 * @return \Illuminate\Contracts\Routing\UrlGenerator|string
 */
if (!function_exists('admin_url')) {
    function admin_url($alias, $parameters = [], $secure = null)
    {
        return url(config('custom.system.admin_prefix') . '/' . $alias, $parameters, $secure);
    }
}
