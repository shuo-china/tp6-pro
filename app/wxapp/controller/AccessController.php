<?php

namespace app\wxapp\controller;

use app\common\Auth;
use app\wxapp\model\User;

class AccessController extends BaseController
{
    protected $middleware = [];

    public function createToken()
    {
        $oauth = \thirdconnect\Oauth::wechat_mini();
        $result = $oauth->getToken();

        $user = User::where('wechat_mini_openid', $result['openid'])->find();

        if (empty($user)) {
            User::create([
                'wechat_mini_openid' => $result['openid'],
                'wechat_unionid' => $result['unionid']
            ]);
            $user = User::where('wechat_mini_openid', $result['openid'])->find();
        }

        if (!$user->status) {
            $this->error(403, '该账号已被禁用', 'NOT_AUTH');
        }

        $accessToken = Auth::setAccessToken($user->id, $user);

        $this->app->event->trigger('UserLoginAfter', $user);

        $this->success(201, $accessToken);
    }

    /**
     * 获取手机号码
     */
    protected function getWechatMiniMobile($code)
    {
        $params = [
            'appid' => config('sys.wechat_mini.appid'),
            'secret' => config('sys.wechat_mini.appsecret'),
            'grant_type' => 'client_credential',
            'force_refresh' => false,
        ];

        $requestTokenUrl = 'https://api.weixin.qq.com/cgi-bin/stable_token';

        $access_token = $this->posturl($requestTokenUrl, $params);

        $access_token = $access_token['access_token'];

        $requestMobile = $this->posturl('https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token=' . $access_token, ['code' => $code]);

        if ($requestMobile['errcode'] != 0) {
            $this->error(401, $requestMobile['errmsg'], 'WECHAT_ERROR');
        }

        return $requestMobile;
    }

    protected function posturl($url, $data)
    {
        $data = json_encode($data);
        $headerArray = array("Content-type:application/json;charset='utf-8'", "Accept:application/json");
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headerArray);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($curl);
        curl_close($curl);
        return json_decode($output, true);
    }
}
