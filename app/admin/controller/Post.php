<?php

namespace app\admin\controller;

/**
 * Class 文章管理控制器
 * @package app\admin\controller
 */
class Post extends Base
{
    public function index($id = 0)
    {
        if(0 != $id){
            $this->assign('id', $id);
        }
        
        return $this->fetch();
    }
}