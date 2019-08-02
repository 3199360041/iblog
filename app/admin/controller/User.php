<?php


namespace app\admin\controller;

/**
 * Class 用户管理控制器
 * @package app\admin\controller
 */
class User extends Base
{
    public function index()
    {
        return $this->fetch();
    }
}