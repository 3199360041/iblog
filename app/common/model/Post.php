<?php

namespace app\common\model;

use think\Model;
use app\common\model\Comment;
use app\common\model\Tag;

class Post extends Model
{

    protected $table = 'posts';

    protected $autoWriteTimestamp = true;

    public function comments()
    {
        return $this->hasMany(Comment, 'post_id');
    }

    public function tags()
    {
        return $this->belongsToMany(Tag, 'posts_tags', 'post_id');
    }

}
