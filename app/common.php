<?php
if (!function_exists('parse_attr')) {
    /**
     * 解析配置
     * @param string $value 配置值
     * @return array|string
     */
    function parse_attr($value = '')
    {
        $array = preg_split('/[,;\r\n]+/', trim($value, ",;\r\n"));
        if (strpos($value, ':')) {
            $value = array();
            foreach ($array as $val) {
                list($k, $v) = explode(':', $val);
                $value[$k] = $v;
            }
        } else {
            $value = $array;
        }
        return $value;
    }
}

if (!function_exists('get_full_path')) {
    /**
     * 格式化为全地址路径
     * @param string $path 图片路径
     */
    function get_full_path($path)
    {
        if (!preg_match('/^http[s]{0,1}:\/\//', $path)) {
            $domain = request()->domain();
            return strpos($path, '/') === 0 ?
                $domain . $path :
                $domain . '/' . $path;
        }
        return $path;
    }
}

// 应用公共文件
if (!function_exists('file_size_format')) {
    /**
     * 文件大小格式化
     * @param $bytes 文件大小（字节 Byte)
     * @return string
     */
    function file_size_format($bytes)
    {
        $type = ['B', 'KB', 'MB', 'GB', 'TB'];
        for ($i = 0; $bytes >= 1024; $i++) {
            if ($i === 4)
                break;
            $bytes /= 1024;
        }
        return (floor($bytes * 100) / 100) . $type[$i];
    }
}

if (!function_exists('get_client_ip')) {
    /**
     * 获取客户端IP地址
     * @return string
     */
    function get_client_ip()
    {
        return request()->ip();
    }
}

if (!function_exists('thinkphp_version')) {
    /**
     * 获取ThinkPHP版本
     * @return string
     */
    function thinkphp_version()
    {
        return \think\facade\App::version();
    }
}