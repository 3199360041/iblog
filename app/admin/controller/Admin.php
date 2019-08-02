<?php


namespace app\admin\controller;

use app\admin\model\Admin as AdminModel;
use think\Request;

/**
 * Class 管理员管理控制器
 * @package app\admin\controller
 */
class Admin extends Base
{
    public function index()
    {
//        $request = Request::instance();
//        $adminModel = new AdminModel();
//
//        $data = $adminModel->all()->paginate(10, false, ['query'=>$request->get()]);
//
//        $this->assign([
//            'admin' => $data,
//            'page'  => $data->render(),
//            'total' => $data->total(),
//        ]);
        return $this->fetch();
    }
}