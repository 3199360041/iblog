<?php

namespace app\admin\controller;

/**
 * Class 后台首页控制器
 * @package app\admin\controller
 */
class Index extends Base
{
    public function index()
    {
        $this->assign('data', []);
        return $this->fetch();
    }
}