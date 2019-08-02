<?php

use think\Route;

$naio = null;

Route::get('/', function() use ($naio) {
    echo phpinfo();
});

Route::group('admin', function(){
    //后台首页
    Route::get('/', 'admin/index/index');
    Route::get('/index', 'admin/index/index');
    Route::get('/index/index', 'admin/index/index');

    //后台登录和退出
    Route::rule('/auth/login', 'admin/auth/login', 'GET|POST');
    Route::get('/auth/logout', 'admin/auth/logout');

    //后台系统设置
    Route::get('/admin', 'admin/admin/index');//管理员列表
    Route::get('/admin/index', 'admin/admin/index');
    Route::get('/role', 'admin/role/index');//角色管理
    Route::get('/role/index', 'admin/role/index');
    Route::get('/access', 'admin/access/index');//权限管理
    Route::get('/access/index', 'admin/access/index');
    Route::get('/log', 'admin/log/index');//后台日志管理
    Route::get('/log/index', 'admin/log/index');
    Route::get('/menu', 'admin/menu/index');//后台菜单管理
    Route::get('/menu/index', 'admin/menu/index');

    //后台文章管理
    Route::get('/post', 'admin/post/index');
    Route::get('/post/index', 'admin/post/index');
    Route::get('/post/[:id]', 'admin/post/index', [], ['id' => '\d+']);
    Route::get('/category/index', 'admin/category/index');

    //后台评论管理
    Route::get('/comment', 'admin/comment/index');
    Route::get('/comment/index', 'admin/comment/index');

    //后台用户管理
    Route::get('/user', 'admin/user/index');
    Route::get('/user/index', 'admin/user/index');

});

