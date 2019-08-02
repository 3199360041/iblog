<?php
// [ 应用入口文件 ]
// 定义ROOT_PATH
define('ROOT_PATH', __DIR__ . '/../');
// 定义应用目录
define('APP_PATH', ROOT_PATH . 'app/');
// 定义配置文件目录
define('CONF_PATH', ROOT_PATH . 'conf/');

//var_dump(ROOT_PATH);
//var_dump(APP_PATH);
//var_dump(CONF_PATH);
//die;

// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
