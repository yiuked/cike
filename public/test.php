<?php
/**
 * 2017/5/16 Yiuked
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade to newer
 * versions in the future.
 *
 * @author    Yiuked SA <yiuked@vip.qq.com>
 * @copyright 2010-2015 Yiuked
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */
require __DIR__.'/../vendor/autoload.php';
$http = new GuzzleHttp\Client;

$response = $http->post('http://cike.app:8000/oauth/token', [
    'form_params' => [
        'grant_type' => 'password',
        'client_id' => '2',
        'client_secret' => 'CsAxHj14gnzifjBmKS1Y1R6N7SynJkCkDkOtEGJD',
        'username' => 'yiuked@vip.qq.com',
        'password' => 'as616766',
        'scope' => '*',
    ],
]);

return json_decode((string) $response->getBody(), true);