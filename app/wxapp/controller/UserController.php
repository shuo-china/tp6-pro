<?php

namespace app\wxapp\controller;

use app\wxapp\model\User;

class UserController extends BaseController
{
    public function currentUser()
    {
        $user = User::where('id', $this->request->clientId)->find();

        $this->success(200, $user);
    }

    public function bindMobile()
    {
        $code = $this->request->param('code');

        $mobileInfo = $this->getWechatMiniMobile($code);

        User::where('id', $this->request->clientId)->update([
            'mobile' => $mobileInfo['phone_info']['purePhoneNumber']
        ]);

        $this->success(201);
    }

    public function isMobileBound()
    {
        $user = User::where('id', $this->request->clientId)->find();

        $result = [
            'is_mobile_bound' => $user->mobile ? true : false,
        ];

        $this->success(200, $result);
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