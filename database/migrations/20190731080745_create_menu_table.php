<?php

use think\migration\Migrator;
use think\migration\db\Column;

class CreateMenuTable extends Migrator
{

    public function up()
    {
        $table = $this->table("menu");
        $table->addColumn('name', 'string', ['limit' => 128, 'null' => false, 'comment' => '菜单名字'])
            ->addColumn('parent', 'integer', ['limit' => 11, 'default' => 'null', 'comment' => '父级'])
            ->addColumn('route', 'string', ['limit' => 255, 'default' => 'null', 'comment' => '路由'])
            ->addColumn('order', 'integer', ['limit' => 11, 'default' => 'null', 'comment' => '排序'])
            ->addColumn('data', 'blob')
            ->setIndexes(['parent' => 'parent'])
            ->save();
    }

    public function down()
    {
        $this->dropTable('menu');
    }
}
