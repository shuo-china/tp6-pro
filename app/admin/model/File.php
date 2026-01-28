<?php

namespace app\admin\model;

use app\system\model\AnnexThumbModel;

class File extends BaseModel
{
    public function getSizeAttr($value)
    {
        return file_size_format($value);
    }

    /**
     * 根据附件ID获取路径
     * @param int $id 附件ID
     * @param int $type 类型：1-补全域名，0-直接返回数据库记录的地址
     */
    public function getFilePath($ids = 0, $type = 0)
    {

        if (is_array($ids)) {
            $list = $this->where('id', 'in', $ids)->select()->toArray();

            $paths = [];
            foreach ($list as $v) {
                if ($type == 0) {
                    $paths[$v['id']] = $v['path'];
                } else {
                    $paths[$v['id']] = get_full_path($v['path']);
                }
            }

            return $paths;
        } else {
            $data = $this->where('id', $ids)->find();

            if ($data) {
                if ($type == 0) {
                    return $data['path'];
                } else {
                    return get_full_path($data['path']);
                }
            } else {
                return null;
            }
        }
    }

    /**
     * 根据附件ID获取名称
     * @param int $id 附件ID
     * @return string 名称
     */
    public function getFileName($id = 0)
    {
        return $this->where('id', $id)->value('name');
    }

    /**
     * 根据id删除附件
     * @param string|array $ids 附件id
     */
    public function deleteFile($ids = '')
    {
        $result = self::destroy($ids);
        if ($result) {
            return true;
        } else {
            return false;
        }
    }
}