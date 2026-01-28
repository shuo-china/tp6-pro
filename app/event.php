<?php
// 事件定义文件
return [
    'bind' => [
    ],

    'listen' => [
        'AppInit' => [
            \app\listener\InitConfig::class,
            \app\listener\InitDict::class
        ],
        'HttpRun' => [],
        'HttpEnd' => [],
        'LogLevel' => [],
        'LogWrite' => [],
    ],

    'subscribe' => [
    ],
];
