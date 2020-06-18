<?php

use Phinx\Migration\AbstractMigration;

class InitSchemaMigration extends AbstractMigration
{
    public function up()
    {
        $sql = file_get_contents('database/init.sql', true);
        $this->query($sql);
    }

    public function down()
    {
        $sql = '
            SET foreign_key_checks = 0;
            DROP TABLE
                `customers`,
                `films`,
                `prices`,
                `rooms`,
                `seats`,
                `sessions`,
                `tickets`;
            SET foreign_key_checks = 1;
        ';
        $this->execute($sql);
    }
}
