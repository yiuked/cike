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


if (!function_exists('ip_addr')) {
    /**
     * 获取客户端IP地址
     * @return mixed|string
     */
    function ip_addr()
    {
        if (!empty($_SERVER["HTTP_CLIENT_IP"])) {
            $ip_address = $_SERVER["HTTP_CLIENT_IP"];
        } else if (!empty($_SERVER["HTTP_X_FORWARDED_FOR"])) {
            $ip_address = array_pop(explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']));
        } else if (!empty($_SERVER["REMOTE_ADDR"])) {
            $ip_address = $_SERVER["REMOTE_ADDR"];
        } else {
            $ip_address = '';
        }
        return $ip_address;
    }
}