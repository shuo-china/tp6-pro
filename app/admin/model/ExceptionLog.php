<?php

namespace app\admin\model;

use think\model\concern\SoftDelete;

class ExceptionLog extends BaseModel
{
    use SoftDelete;

    protected $name = 'exception';

    protected $type = [
        'id' => 'integer',
        'request_time' => 'timestamp',
        'create_time' => 'timestamp',
        'update_time' => 'timestamp',
    ];
}
