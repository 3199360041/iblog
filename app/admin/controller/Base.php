<?php

namespace app\admin\controller;

use app\admin\service\AuthService;
use think\Controller;
use think\Request;

/**
 * Class 后台基控制器
 * @package app\admin\controller
 */
class Base extends Controller
{

    const SESSION_KEY_NAME = 'admin_id';

    /**
     * @var string
     * 当前url
     */
    protected $url;

    /**
     * @var int
     * 当前管理员id
     */
    protected $admin_id = 0;

    /**
     * @var
     * 后台模板变量var
     */
    protected $var;

    /**
     * @var array
     * url白名单
     */
    protected $whiteList = [
        '/admin/auth/login',
        '/admin/auth/logout',
    ];

    /**
     * 控制器初始化操作
     */
    public function _initialize()
    {
        $request = Request::instance();
        $this->url = parse_name($request->module()) . '/' .
            parse_name($request->controller()) . '/' .
            parse_name($request->action());

        $auth = new AuthService($request);

        if(!in_array($this->url, $this->whiteList))
        {
            if(!($this->isLogin())) {
                $this->redirect('/admin/auth/login');
            }else{
//                dd($this->url, true);
                $this->admin_id = session(self::SESSION_KEY_NAME);
                $auth = new AuthService($this->admin_id);
                if(!$this->authCheck($auth)) {
                    return $this->error('没有权限');
                }
            }
        }

        return true;
    }

    protected function fetch($template = '', $vars = [], $replace = [], $config = [])
    {

        $this->var['key'] = 'name';

        return parent::fetch($template, $vars, $replace, $config);

    }

    public function isLogin()
    {
        $admin = session(self::SESSION_KEY_NAME);
        if($admin){
            return true;
        }
        return false;
    }

    public function clearSession()
    {
        session(self::SESSION_KEY_NAME, null);
    }

    public function saveSession($admin_id)
    {
        session(self::SESSION_KEY_NAME, $admin_id);
    }

    private function authCheck($admin)
    {
        return true;
    }

    //空方法
    public function _empty()
    {
        $this->var['title'] = '404';
        return $this->fetch('template/404');
    }
}