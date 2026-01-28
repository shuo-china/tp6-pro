<?php

namespace app\admin\model;

class Role extends BaseModel
{
    public function deleteRole()
    {
        $this->delete();

        ManagerRole::destroy(function ($query) {
            $query->where('role_id', $this->getData('id'));
        });

    }
}