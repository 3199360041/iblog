<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateCommentTable extends Migrator
{
    public function up()
    {
        $table = $this->table('comment');
        $table->addColumn('user_id', 'integer')
            ->addColumn('post_id', 'integer')
            ->addColumn('content', 'string',['limit' => 255])
            ->addColumn('to_user_id', 'integer')
            ->addColumn('create_time', 'timestamp')
            ->addColumn('parent_id', 'integer')
            ->addColumn('status', 'integer', ['default' => -1])
            ->save();
    }

    public function down()
    {
        $this->dropTable('comment');
    }
}
