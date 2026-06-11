<?php

namespace app\admin\model;

class Menu extends BaseModel
{
    protected $type = [
        'id' => 'integer',
        'parent_id' => 'integer',
        'order' => 'integer',
    ];
}
