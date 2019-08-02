<?php

use think\migration\Seeder;

class AdministratorSeeder extends Seeder
{
    /**
     * Run Method.
     *
     * Write your database seeder using this method.
     *
     * More information on writing seeders is available here:
     * http://docs.phinx.org/en/latest/seeding.html
     */
    public function run()
    {
        $admin = [
          'username' => 'admin',
          'password' => md5('admin')
        ];
        $table = $this->table('admin');
        $table->insert($admin)->save();
    }
}