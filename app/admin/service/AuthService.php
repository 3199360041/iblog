<?php


namespace app\admin\service;

use app\admin\model\Admin;

class AuthService
{
    protected $admin;

    protected $req;

    const SESSION_KEY_NAME = 'admin_id';

    public function __construct($req)
    {
        $this->req = $req;
        //$this->admin = Admin::get($this->req->post('admin_id'));
    }

    public function login()
    {
        $this->req;
        if(!session(self::SESSION_KEY_NAME)){
            $this->user;
        }
        return true;
    }

    public static function logout()
    {
        session(self::SESSION_KEY_NAME, null);
    }

    public function isLogin()
    {
        return $this->login();
    }
}