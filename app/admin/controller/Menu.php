<?php


namespace app\admin\controller;

/**
 * Class 菜单管理控制器
 * @package app\admin\controller
 */
class Menu extends Base
{
    public function index()
    {
        return $this->fetch();
    }
}