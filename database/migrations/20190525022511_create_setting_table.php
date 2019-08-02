<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateSettingTable extends Migrator
{
    public function up()
    {
        $table = $this->table('setting');
        $table->addColumn('name', 'string', ['limit' => 32])
            ->addColumn('value', 'string', ['limit' => 255])
            ->save();
    }

    public function down()
    {
        $this->dropTable('setting');
    }
}
