# Домашнее задание к занятию 2. «SQL» - `Rashevchenko Mikhail`

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, 
в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose манифест.

<details><summary>Ответ:</summary>

```yaml  
version: '3.5'

services:
  database:
    image: postgres:12
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: test_db
    volumes:
      - ./db-data/:/var/lib/postgresql/data/
      - ./db-backup/:/data/backup/postgres  
```
</details>

## Задача 2

В БД из задачи 1: 
- создайте пользователя test-admin-user и БД test_db
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже)
- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db
- создайте пользователя test-simple-user  
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db

Таблица orders:
- id (serial primary key)
- наименование (string)
- цена (integer)

Таблица clients:
- id (serial primary key)
- фамилия (string)
- страна проживания (string, index)
- заказ (foreign key orders)

Приведите:
- итоговый список БД после выполнения пунктов выше,
- описание таблиц (describe)
- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
- список пользователей с правами над таблицами test_db


<details><summary>Ответ:</summary> 
  
- итоговый список БД после выполнения пунктов выше
  
```bash  
postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
(4 rows)
```
- описание таблиц (describe)
```bash  
test_db=# \d+ orders
                                                   Table "public.orders"
    Column    |  Type   | Collation | Nullable |              Default               | Storage  | Stats target | Description 
--------------+---------+-----------+----------+------------------------------------+----------+--------------+-------------
 id           | integer |           | not null | nextval('orders_id_seq'::regclass) | plain    |              | 
 наименование | text    |           |          |                                    | extended |              | 
 цена         | integer |           |          |                                    | plain    |              | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "clients" CONSTRAINT "clients_заказ_fkey" FOREIGN KEY ("заказ") REFERENCES orders(id)
Access method: heap

test_db=# \d+ clients
                                                      Table "public.clients"
      Column       |  Type   | Collation | Nullable |               Default               | Storage  | Stats target | Description 
-------------------+---------+-----------+----------+-------------------------------------+----------+--------------+-------------
 id                | integer |           | not null | nextval('clients_id_seq'::regclass) | plain    |              | 
 фамилия           | text    |           |          |                                     | extended |              | 
 страна проживания | text    |           |          |                                     | extended |              | 
 заказ             | integer |           |          |                                     | plain    |              | 
Indexes:
    "clients_pkey" PRIMARY KEY, btree (id)
    "clients_страна проживания_idx" btree ("страна проживания")
Foreign-key constraints:
    "clients_заказ_fkey" FOREIGN KEY ("заказ") REFERENCES orders(id)
Access method: heap
```
  
- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
```bash  
SELECT table_name, array_agg(privilege_type), grantee
FROM information_schema.table_privileges
WHERE table_name = 'orders' OR table_name = 'clients'
GROUP BY table_name, grantee ;
```
- список пользователей с правами над таблицами test_db
```bash  
table_name |                         array_agg                         |     grantee      
------------+-----------------------------------------------------------+------------------
 clients    | {INSERT,TRIGGER,REFERENCES,TRUNCATE,DELETE,UPDATE,SELECT} | postgres
 clients    | {INSERT,TRIGGER,REFERENCES,TRUNCATE,DELETE,UPDATE,SELECT} | test-admin-user
 clients    | {DELETE,INSERT,SELECT,UPDATE}                             | test-simple-user
 orders     | {INSERT,TRIGGER,REFERENCES,TRUNCATE,DELETE,UPDATE,SELECT} | postgres
 orders     | {INSERT,TRIGGER,REFERENCES,TRUNCATE,DELETE,UPDATE,SELECT} | test-admin-user
 orders     | {DELETE,SELECT,UPDATE,INSERT}                             | test-simple-user
(6 rows)
```

</details>

## Задача 3

Используя SQL синтаксис - наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|

Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|

Используя SQL синтаксис:
- вычислите количество записей для каждой таблицы 
- приведите в ответе:
    - запросы 
    - результаты их выполнения.

<details><summary>Ответ:</summary> 

```bash  
test_db=# SELECT COUNT(*) FROM orders;
 count
-------
     5
(1 row)

test_db=# SELECT COUNT(*) FROM clients;
 count
-------
     5
(1 row)

```


</details>

## Задача 4

Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.

Используя foreign keys свяжите записи из таблиц, согласно таблице:

|ФИО|Заказ|
|------------|----|
|Иванов Иван Иванович| Книга |
|Петров Петр Петрович| Монитор |
|Иоганн Себастьян Бах| Гитара |

Приведите SQL-запросы для выполнения данных операций.

Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод данного запроса.
 
Подсказка - используйте директиву `UPDATE`.

<details><summary>Ответ:</summary>  
 
```bash  
test_db=# UPDATE clients SET заказ=3 WHERE id=1;
UPDATE 1
test_db=# UPDATE clients SET заказ=4 WHERE id=2;
UPDATE 1
test_db=#
test_db=# UPDATE clients SET заказ=5 WHERE id=3;
UPDATE 1
```  
```bash  
test_db=# SELECT * FROM clients WHERE заказ IS NOT NULL;
 id |       фамилия        | страна_проживания | заказ
----+----------------------+-------------------+-------
  1 | Иванов Иван Иванович | USA               |     3
  2 | Петров Петр Петрович | Canada            |     4
  3 | Иоганн Себастьян Бах | Japan             |     5
(3 rows)
``` 

</details>

## Задача 5

Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 
(используя директиву EXPLAIN).

Приведите получившийся результат и объясните что значат полученные значения.

<details><summary>Ответ:</summary>  

```bash  
test_db=# EXPLAIN SELECT * FROM clients
WHERE "заказ" IS NOT null;
                        QUERY PLAN
-----------------------------------------------------------
 Seq Scan on clients  (cost=0.00..18.10 rows=806 width=72)
   Filter: ("заказ" IS NOT NULL)
```
- значение 0.00 это затраты на получение первой строки
- 18.10 это затраты на получение всех строк
- rows это число строк, которое должено вывестесь
- количество строк 806
- width это средний размер строк в байтах
- используется фильтр "заказ" IS NOT NULL
</details>

## Задача 6

Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. Задачу 1).

Остановите контейнер с PostgreSQL (но не удаляйте volumes).

Поднимите новый пустой контейнер с PostgreSQL.

Восстановите БД test_db в новом контейнере.

Приведите список операций, который вы применяли для бэкапа данных и восстановления. 

<details><summary>Ответ:</summary>
  
```bash  
pg_dump -U postgres -F t test_db > /data/backup/postgres/test_db.tar
```
  
```bash  
root@1netology:~$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED       STATUS             PORTS                                        NAMES
fdb314cb73c1   dpage/pgadmin4   "/entrypoint.sh"         8 hours ago   Up About an hour   0.0.0.0:80->80/tcp, :::80->80/tcp, 443/tcp   postgresql-pgadmin-1
f1257673aab7   postgres:12      "docker-entrypoint.s…"   8 hours ago   Up About an hour   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp    postgresql-postgres-1
```
```bash 
root@1netology:~$ docker stop postgresql-postgres-1
postgresql-postgres-1
```

```bash 
version: '3.5'
services:
  db:
    image: postgres:12-alpine
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
    ports:
      - '5432:5432'
    volumes:
      - ./db-backup/:/data/backup/postgres
volumes:
  backup:
```
  
```bash  
root@1netology:~/docker/delete$ docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED          STATUS          PORTS                                        NAMES
4476595b0f8d   postgres:12      "docker-entrypoint.s…"   17 seconds ago   Up 14 seconds   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp    delete-postgres-1
fdb314cb73c1   dpage/pgadmin4   "/entrypoint.sh"         9 hours ago      Up 2 hours      0.0.0.0:80->80/tcp, :::80->80/tcp, 443/tcp   postgresql-pgadmin-1
```
  
```bash  
postgres=# CREATE USER "test-admin-user" WITH LOGIN;
CREATE ROLE
postgres=# CREATE USER "test-simple-user" WITH LOGIN;
CREATE ROLE

root@4476595b0f8d:/# pg_restore --create --file=/var/tmp/pg_restore.script /var/tmp/test_db.backup
pg_restore: connecting to database for restore
pg_restore: creating DATABASE "test_db"
pg_restore: connecting to new database "test_db"
pg_restore: creating TABLE "public.clients"
pg_restore: creating SEQUENCE "public.clients_id_seq"
pg_restore: creating SEQUENCE OWNED BY "public.clients_id_seq"
pg_restore: creating TABLE "public.orders"
pg_restore: creating SEQUENCE "public.orders_id_seq"
pg_restore: creating SEQUENCE OWNED BY "public.orders_id_seq"
pg_restore: creating DEFAULT "public.clients id"
pg_restore: creating DEFAULT "public.orders id"
pg_restore: processing data for table "public.clients"
pg_restore: processing data for table "public.orders"
pg_restore: executing SEQUENCE SET clients_id_seq
pg_restore: executing SEQUENCE SET orders_id_seq
pg_restore: creating CONSTRAINT "public.clients clients_pkey"
pg_restore: creating CONSTRAINT "public.orders orders_pkey"
pg_restore: creating INDEX "public.clients_страна проживания_idx"
pg_restore: creating FK CONSTRAINT "public.clients clients_заказ_fkey"
pg_restore: creating ACL "public.TABLE clients"
pg_restore: creating ACL "public.TABLE orders"
```
```bash 
postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 ```

</details>
