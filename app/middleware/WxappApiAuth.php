<?php

declare(strict_types=1);

namespace app\middleware;

use app\common\Send;
use app\common\Auth;

class WxappApiAuth extends ApiAuth
{
    protected $levels = [
        'guest' => 1,
        'bound' => 2,
    ];

    /**
     * 处理请求
     * @param \think\Request $request
     * @param \Closure $next
     */
    public function handle($request, \Closure $next, $level = 'guest')
    {
        $this->authenticateRequest($request);

        if ($this->levels[$level] > $this->levels[$request->clientInfo['level']]) {
            $this->error(403, '没有权限', 'NO_AUTH');
        }

        return $next($request);
    }
}