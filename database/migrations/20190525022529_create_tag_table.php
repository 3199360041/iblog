<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateTagTable extends Migrator
{
    public function up()
    {
        $table = $this->table('tag');
        $table->addColumn('name', 'string', ['limit' => 16])
            ->save();
    }

    public function down()
    {
        $this->dropTable('tag');
    }
}
