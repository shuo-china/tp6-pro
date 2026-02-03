<?php

namespace app\admin\validate;

use think\Validate;

class DictItem extends Validate
{
    protected $rule = [
        'name' => 'require',
        'value' => 'require|unique:dict_item',
    ];

    protected $message = [
        'name.require' => '字典项名称不能为空',
        'value.require' => '字典项值不能为空',
        'value.unique' => '字典项值重复',
    ];
}
