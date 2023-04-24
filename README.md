# Домашнее задание к занятию 10.1 «Keepalived/vrrp» - `Rashevchenko Mikhail`
**
---

### Задание 1

Разверните топологию из лекции и выполните установку и настройку сервиса Keepalived. 

```
vrrp_instance test {

state MASTER

interface enp0s3

virtual_router_id 10

priority 110

advert_int 4

authentication {

auth_type AH

auth_pass 1111

}

unicast_peer {

10.81.1.111

}

virtual_ipaddress {

10.81.1.250 dev enp0s3 label enp0s8:vip

}

}


```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw1011.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw10113.PNG?raw=true)
```
vrrp_instance test {

state BACKUP

interface enp0s3

virtual_router_id 10

priority 110

advert_int 4

authentication {

auth_type AH

auth_pass 1111

}

unicast_peer {

10.81.1.112

}

virtual_ipaddress {

10.81.1.250 dev enp0s3 label enp0s8:vip

}

}
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw10112.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw10114.PNG?raw=true)
