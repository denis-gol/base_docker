### базовый проект для быстрого развертывания приложения


#### main title
description1

Цель: 
description2



#### Критерии оценки: 
1. 
2. 
3. 



---
РЕШЕНИЕ:

---
ЗАПУСК:
- в папке /docker запустить контейнеры:
    > docker-compose up -d
- войти в контейнер php:
    > docker-compose exec php bash
- подтянуть зависимости:
    > composer update  
        or
    > composer install  
- накатить миграции:
    > php vendor/bin/phinx migrate
    > php vendor/bin/phinx seed:run


---
СТРУКТУРА ПАПОК:
- docker (контейнеры: php, nginx, mysql. и все для их запуска)
- mysql (файлы БД. Эта папка появится после запуска контейнеров)
- site.local (сам проект)
    - app/ (приложение, классы)
    - database/ (для robmorgan/phinx. тут находятся миграции, сиды, data - папка для отдельных запросов mysql)
    - public/ (здесь находится index.php)
    - vendor/ (появится после подтягивания зависимостей)
    - phinx.yml (конфиг для phinx)

---
ПРОЧЕЕ ДОКУ:

Phinx
https://sergeivl.ru/phinx-migration.html (простой старт)
https://github.com/cakephp/phinx (доку от разрабов)

Faker
https://github.com/fzaninotto/Faker
