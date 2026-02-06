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
                'wechat_unionid' => isset($result['unionid']) ? $result['unionid'] : '',
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
}
