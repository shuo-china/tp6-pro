<?php

namespace app\admin\validate;

use think\Validate;

class DictType extends Validate
{
    protected $rule = [
        'name' => 'require',
        'key' => 'require|unique:dict_type',
    ];

    protected $message = [
        'name.require' => '字典类型名称不能为空',
        'key.require' => '字典类型键不能为空',
        'key.unique' => '字典类型键重复',
    ];
}
