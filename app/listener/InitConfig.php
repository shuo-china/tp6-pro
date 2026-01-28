<?php
declare(strict_types=1);

namespace app\listener;

use think\facade\Config;

class InitConfig
{
    /**
     * 按照分组读取系统配置
     * @return array
     */
    protected function getConfigsByGroup()
    {
        $dbConfigs = \think\facade\Db::name('config')->field('group,name,value,type')->select()->toArray();
        $result = [];
        foreach ($dbConfigs as $v) {
            switch ($v['type']) {
                case 'array':
                    $result[$v['name']] = parse_attr($v['value']);
                    break;
                default:
                    $result[$v['name']] = $v['value'];
                    break;
            }
        }

        return $result;
    }

    /**
     * 事件监听处理
     */
    public function handle()
    {
        $configs = cache('sys_config');

        if (!$configs) {
            $configs = $this->getConfigsByGroup();
            cache('sys_config', $configs);
        }

        Config::set($configs, 'sys');
    }
}
