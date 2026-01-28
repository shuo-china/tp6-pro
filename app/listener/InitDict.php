<?php
declare(strict_types=1);

namespace app\listener;

use think\Exception;
use think\facade\Config;

class InitDict
{
    /**
     * 按照分组读取系统配置
     * @return array
     */
    protected function getDictsByGroup()
    {
        $result = [];

        $dbDicts = \think\facade\Db::name('dict')->select()->toArray();

        foreach ($dbDicts as $v) {
            $dictValues = [];

            $list = \think\facade\Db::name('dict_value')->where('dict_id', $v['id'])->where('status', 1)->select()->toArray();
            foreach ($list as $item) {
                $dictValues[$item['dict_value']] = $item['dict_key'];
            }

            $result[$v['dict_type']] = $dictValues;
        }

        return $result;
    }

    /**
     * 事件监听处理
     */
    public function handle()
    {
        $dicts = cache('sys_dict');

        if (!$dicts) {
            $dicts = $this->getDictsByGroup();
            cache('sys_dict', $dicts);
        }

        Config::set($dicts, 'dict');
    }
}
