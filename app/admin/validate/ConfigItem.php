<?php
namespace app\admin\validate;

use think\Validate;

class ConfigItem extends Validate
{
    protected $rule = [
        'group_id|配置分组' => 'require',
        'type|配置类型' => 'require',
        'name|配置名称' => 'require',
        'key|配置键' => 'require|regex:^[a-zA-Z]\w{0,39}$|unique:config_item',
    ];

    protected $message = [
        'key.regex' => '配置键由字母和下划线组成',
    ];
}
