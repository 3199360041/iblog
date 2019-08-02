<?php


namespace app\common\validate;

use think\Request;
use think\Validate;
use think\Exception;

class BaseValidate extends Validate
{
    public function goCheck()
    {
        $request = Request::instance();
        $params = $request->param();

        $result = $this->batch()->check($params);
        if (!$result)
        {
            throw new Exception('参数错误');
        }
        else
        {
            return true;
        }
    }

    protected function isNotEmpty($value, $rule = '', $data = '', $field = '')
    {
        if(empty($value))
        {
            return false;
        }
        else
        {
            return true;
        }
    }
}