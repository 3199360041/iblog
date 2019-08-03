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
        $data = AdminModel::paginate(1);

        $this->assign([
            'data' => $data
        ]);

        return $this->fetch();
    }

    public function create()
    {
        $request = Request::instance();
        if($request->isPost()) {
            halt($request->param());
        }else{
            return $this->fetch();
        }
    }

    public function update($id)
    {
        halt($id);
    }

    public function delete()
    {
        $request = Request::instance();

        $id = $request->post('id');

        AdminModel::destroy(['id' => $id]);

        return $this->redirect('admin/admin/index');
    }

}