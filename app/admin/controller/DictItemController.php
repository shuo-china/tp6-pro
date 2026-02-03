<?php
namespace app\admin\controller;

use app\admin\model\DictItem;

class DictItemController extends BaseController
{
    public function options()
    {
        $dictTypeId = $this->request->param('type_id');
        $list = DictItem::where('type_id', $dictTypeId)->column('name as label,value');
        $this->success(200, $list);
    }

    public function list()
    {
        $dictTypeId = $this->request->param('type_id');
        $list = DictItem::where('type_id', $dictTypeId)->select();
        $this->success(200, $list);
    }

    public function detail()
    {
        $id = $this->request->param('id');
        $info = DictItem::where('id', $id)->find();
        $this->success(200, $info);
    }

    public function create()
    {
        $post = $this->request->post();
        $this->validate($post, 'DictItem');

        DictItem::create($post);
        cache('sys_dict', null);
        $this->success(201);
    }

    public function update()
    {
        $post = $this->request->post();
        $this->validate($post, 'DictType');

        DictItem::update($post);
        cache('sys_dict', null);
        $this->success(201);
    }

    public function delete()
    {
        $id = $this->request->param('id');
        DictItem::where('id', $id)->delete();
        cache('sys_dict', null);
        $this->success(204);
    }
}