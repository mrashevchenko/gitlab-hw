# Домашнее задание к занятию 10.1 «Keepalived/vrrp» - `Rashevchenko Mikhail`
**
---

### Задание 1

Разверните топологию из лекции и выполните установку и настройку сервиса Keepalived. 

```
vrrp_instance test {

state "name_mode"

interface "name_interface"

virtual_router_id "number id"

priority "number priority"

advert_int "number advert"

authentication {

auth_type "auth type"

auth_pass "password"

}

unicast_peer {

"ip address host"

}

virtual_ipaddress {

"ip address host" dev "interface" label "interface":vip

}

}

```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw1011.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw10113.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw10112.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw10-01/img/hw10114.PNG?raw=true)
