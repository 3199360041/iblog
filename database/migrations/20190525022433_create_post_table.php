<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreatePostTable extends Migrator
{
    public function up()
    {
        $table = $this->table('post');
        $table->addColumn('title', 'string')
            ->addColumn('content', 'text')
            ->addTimestamps()
            ->save();
    }

    public function down()
    {
        $this->dropTable("post");
    }
}
