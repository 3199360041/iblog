<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateAccessTable extends Migrator
{
    public function up()
    {
        $table = $this->table('access');
        $table->addColumn('title', 'string', ['limit' => 50])
            ->save();
    }

    public function change()
    {
        $this->dropTable('access');
    }
}
