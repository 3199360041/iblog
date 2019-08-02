<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreatePostTagTable extends Migrator
{
    public function up()
    {
        $table = $this->table('post_tag');
        $table->addColumn('post_id', 'integer')
            ->addColumn('tag_id', 'integer')
            ->save();
    }

    public function down()
    {
        return $this->dropTable('post_tag');
    }
}
