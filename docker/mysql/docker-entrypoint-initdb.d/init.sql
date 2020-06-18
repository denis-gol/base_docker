# выполняется после запуска контейнера mysql
# начальный скрипт

CREATE DATABASE IF NOT EXISTS `database_name` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `database_name`.* TO 'default'@'%' ;


FLUSH PRIVILEGES;

USE database_name;
