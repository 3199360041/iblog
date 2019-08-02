<?php


namespace app\common\exception;


use Exception;
use think\exception\Handle;

class ExceptionHandler extends Handle
{
    public function render(Exception $e)
    {
        return parent::render($e);
    }
}