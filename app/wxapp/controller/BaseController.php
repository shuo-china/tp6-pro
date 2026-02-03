<?php

namespace app\wxapp\controller;

use app\wxapp\WxappSend;
use app\common\BaseController as CommonBaseController;

class BaseController extends CommonBaseController
{
    use WxappSend;

    protected $middleware = ['api_auth'];

    protected function initialize()
    {
        parent::initialize();
    }
}