<?php
namespace app\admin\controller;

use think\facade\Config;
use app\admin\model\ConfigGroup;
use app\admin\model\ConfigItem;

class ConfigGroupController extends BaseController
{
    protected $middleware = [
        'api_auth' => [
            'except' => ['init']
        ]
    ];

    public function init()
    {
        $data = Config::get('sys');
        $this->success(200, $data);
    }

    /**
     * 获取配置项
     */
    public function options()
    {
        $list = ConfigGroup::column('name as label,id as value');
        $this->success(200, $list);
    }

    public function list()
    {
        $list = ConfigGroup::select();
        $this->success(200, $list);
    }

    public function pagination()
    {
        $list = ConfigGroup::paginate();
        $this->success(200, $list);
    }

    public function detail()
    {
        $id = $this->request->param('id');
        $info = ConfigGroup::find($id);
        $this->success(200, $info);
    }

    public function create()
    {
        $post = $this->request->post();
        $this->validate($post, 'ConfigGroup');
        ConfigGroup::create($post);
        cache('sys_config', null);
        $this->success(201);
    }

    public function update()
    {
        $post = $this->request->post();
        $this->validate($post, 'ConfigGroup');
        ConfigGroup::update($post);
        cache('sys_config', null);
        $this->success(201);
    }

    public function delete()
    {
        $id = $this->request->param('id');
        $configGroup = ConfigGroup::find($id);
        ConfigItem::where('group_id', $id)->delete();
        $configGroup->delete();
        cache('sys_config', null);
        $this->success(204);
    }
}