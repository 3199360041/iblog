<?php

namespace app\admin\controller;

use think\Request;
use app\admin\validate\AdminValidate;
use app\admin\model\Admin;

/**
 * Class 后台登录控制器
 * @package app\admin\controller
 */
class Auth extends Base
{

    //这个很关键，不然登录路由就死循环了
    public function _initialize()
    {

    }

    public function login(Request $request)
    {
        if($request->isPost()) {

            (new AdminValidate())->goCheck();

            $username = $request->post('username');
            $password = md5($request->post('password'));

            $user = Admin::get(function($query) use ($username){
                $query->where('username', '=', $username);
            });

            if(!$user){
                $this->error('该管理员不存在');
                return $this->redirect('admin/auth/login');
            }

//            dd($user, true);
            $this->saveSession($user->id);

            return $this->redirect('/admin/index/index');
        }else{
            return $this->fetch();
        }
    }

    public function logout()
    {
        $this->clearSession();
        return $this->redirect('/admin/auth/login');
    }

}