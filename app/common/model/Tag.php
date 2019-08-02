<?php

namespace app\common\model;

use think\Model;
use app\common\model\Post;

class Tag extends Model
{

    protected $table = 'tags';

    public function posts()
    {
        return $this->belongsToMany(Post, 'posts_tags', 'tag_id');
    }

}
