<?php

namespace app\common\model;

use think\Model;
use app\common\model\Post;

class Comment extends Model
{
    /**
     * @var string tableName
     */
    protected $table = 'comments';

    /**
     * @var string primary key
     */
    //protected $pk = 'id';

    protected $autoWriteTimestamp = true;

    public function post()
    {
        return $this->belongsTo(Post, 'post_id');
    }
}
