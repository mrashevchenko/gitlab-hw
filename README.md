# Домашнее задание к занятию 2. «Применение принципов IaaC в работе с виртуальными машинами» - `Rashevchenko Mikhail`

## Задача 1

- Опишите основные преимущества применения на практике IaaC-паттернов.
- Какой из принципов IaaC является основополагающим?

Непрерывная интеграция (CI) - сокращение стоимости исправления дефекта за счет его раннего выявления. Непрерывная доставка (CD) - изменения выпускаются небольшими партиями, их можно быстро изменить или устранить. Непрерывное развёртывание (CDP) - упраздняет ручные действия, не требуя непосредственного утверждения со стороны ответственного лица. Но непрерывное развёртывание на пром системах может быть рискованным из за возможных ошибок в коде. Непрерывное развертывание лучше использовать на тестовой полигоне, а в пром идти уже после pull request.
Автоматизация инфраструктуры позволяет эффективнее использовать существующие ресурсы. Также автоматизация позволяет минимизировать риск возникновения ошибок руками. Основополагающим принципом IaaC является идемпотентность.


## Задача 2

- Чем Ansible выгодно отличается от других систем управление конфигурациями?
- Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull?

Ansible работает по SSH, на распространенном языке Python. Он без агентный что является его главным отличием.   
Метод push, что не требует установки ни демонов, ни агентов, а в случае с pull методом такие агенты нужны, что потенциально может быть еще одной точкой сбоя.


## Задача 3

Установите на личный компьютер:

- [VirtualBox](https://www.virtualbox.org/),
- [Vagrant](https://github.com/netology-code/devops-materials),
- [Terraform](https://github.com/netology-code/devops-materials/blob/master/README.md),
- Ansible.

*Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown.*

```
root@1netology:/home/mrashe/Downloads# terraform -version
Terraform v1.5.5
on linux_386
```
```
root@1netology:/home/mrashe/Downloads# vagrant -v
Vagrant 2.2.14
```
```
root@1netology:/home/mrashe/Downloads# vboxmanage --version
6.1.46r158378
```
```
root@1netology:/home/mrashe/Downloads# ansible --version
ansible 2.10.8
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110]
```
 ![](https://github.com/mrashevchenko/gitlab-hw/blob/hw05-virt-02/img/hw050201.PNG?raw=true)  
## Задача 4 

Воспроизведите практическую часть лекции самостоятельно.

- Создайте виртуальную машину.
- Зайдите внутрь ВМ, убедитесь, что Docker установлен с помощью команды
```
docker ps,
```
Vagrantfile из лекции и код ansible находятся в [папке](https://github.com/netology-code/virt-homeworks/tree/virt-11/05-virt-02-iaac/src).

Примечание. Если Vagrant выдаёт ошибку:
```
URL: ["https://vagrantcloud.com/bento/ubuntu-20.04"]     
Error: The requested URL returned error: 404:
```

выполните следующие действия:

1. Скачайте с [сайта](https://app.vagrantup.com/bento/boxes/ubuntu-20.04) файл-образ "bento/ubuntu-20.04".
2. Добавьте его в список образов Vagrant: "vagrant box add bento/ubuntu-20.04 <путь к файлу>".

```
mrashe@DESKTOP-H623A53://home/mrashe/local-k8s vagrant ssh
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-80-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon Sep  11 02:07:24 2023 AM UTC

  System load:  0.0               Users logged in:          0
  Usage of /:   3.2% of 61.31GB   IPv4 address for docker0: 172.17.0.1
  Memory usage: 20%               IPv4 address for eth0:    10.0.2.15
  Swap usage:   0%                IPv4 address for eth1:    192.168.192.11
  Processes:    103


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Mon Sep  11 02:06:56 2023 from 10.0.2.2
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

