## Playbook

Playbook разворачивает на заданных хостах приложения:
- сlickhouse-client
- clickhouse-server
- clickhouse-common
- vector
- nginx
- git
- lighthouse
  
Установка происходит на три виртуальные машины Centos7 в YC с запуском служб этих приложений. 

## Hosts

```inventory/prod.yml``` - Файл для указания виртуальных машин


### Variables
Файлы конфигураций находяться:
```/group_vars/``` в данной директории

В каталоге group_vars задаются необходимые версии дистрибутивов.  

```/group_vars/clickhouse/vars.yml``` -  версия clickhous         
```/group_vars/vector/vars.yml``` -   версия vector 
  
## Start   

Для запуска playbook нужно выполнить команду    
```ansible-playbook -i inventory/prod.yml site.yml```, где ```inventory/prod.yml``` - путь к Inventory файлу, ```site.yml``` - файл playbook.

### Tags

- nginx
- lighthouse
- clickhouse
- vector
