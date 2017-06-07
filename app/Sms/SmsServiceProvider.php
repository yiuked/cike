<?php

namespace App\Sms;

use Illuminate\Support\ServiceProvider;

class SmsServiceProvider extends ServiceProvider
{
    /**
     * 延迟加载
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('sms', function () {
            return $this->createLogger();
        });
    }

    /**
     * Create the logger.
     *
     * @return \Illuminate\Log\Writer
     */
    public function createLogger()
    {
        $config = $this->app->make('config')->get('sms');
        $sms = new Smser($config['server_ip'], $config['server_port'], $config['soft_version']);
        $sms->setAccount($config['account_sid'], $config['account_token']);
        $sms->setAppId($config['app_id']);
        return $sms;
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return ['sms'];
    }
}
