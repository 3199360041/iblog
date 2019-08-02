<?php


namespace app\admin\controller;


class Category extends Base
{
    public function index()
    {
        return $this->fetch();
    }
}