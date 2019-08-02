<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateAdminTable extends Migrator
{
    public function up()
    {
        $table = $this->table('admin');
        $table->addColumn('username', 'string', ['limit' => 50, 'default' => ''])
            ->addColumn('password', 'char', ['limit' => 32, 'default' => ''])
            ->addColumn('last_login_ip', 'varchar', ['limit' => 30])
            ->save();
    }

    public function down()
    {
        return $this->dropTable('admin');
    }
}
