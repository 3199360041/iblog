<?php


namespace app\admin\controller;

/**
 * Class 管理员管理控制器
 * @package app\admin\controller
 */
class Admin extends Base
{
    public function index()
    {
        return $this->fetch();
    }
}