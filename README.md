# Домашнее задание к занятию «Работа с данными (DDL/DML)» - `Rashevchenko Mikhail`

### Задание 1
1.1. 
```sh
sudo apt update
sudo apt install gnupg
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb
sudo apt install -y mysql-server
sudo systemctl status mysql.service
```
1.2. 
```sql
create user 'sys_temp'@'%' identified by '123456789';
```
1.3. 
https://github.com/mrashevchenko/gitlab-hw/blob/hw12-02/img/hw120201.PNG?raw=true
```sql
select User,Host from mysql.user;
```
1.4. 
```sql
grant ALL PRIVILEGES on *.* to 'sys_temp'@'%' with GRANT option;
flush privileges;
```
1.5.
https://github.com/mrashevchenko/gitlab-hw/blob/hw12-02/img/hw1202011.PNG?raw=true
```sql
show grants for 'sys_temp'@'%';
```
1.6. 
```sql
alter user 'sys_temp'@'%' IDENTIFIED with mysql_native_password by '123456789';
```
1.6.
```sh
exit
wget -c https://downloads.mysql.com/docs/sakila-db.zip
unzip sakila-db.zip
cd sakila-db
```
1.7. 
```
sql
mysql -u sys_temp -p
show databases;
create database SakilaDB;
show databases;
use SakilaDB;
show tables;
source sakila-schema.sql;
source sakila-data.sql;
show tables;
```
1.8. 
https://github.com/mrashevchenko/gitlab-hw/blob/hw12-02/img/hw12020111.PNG?raw=true
```sql
show tables;
```

### Задание 2
https://github.com/mrashevchenko/gitlab-hw/blob/hw12-02/img/hw120202.PNG?raw=true
