<?php


namespace app\admin\controller;

/**
 * Class 评论管理控制器
 * @package app\admin\controller
 */
class Comment extends Base
{
    public function index()
    {
        return $this->fetch();
    }
}