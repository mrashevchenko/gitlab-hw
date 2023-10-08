# Домашнее задание к занятию 1. «Типы и структура СУБД - `Rashevchenko Mikhail`

## Задача 1

Архитектор ПО решил проконсультироваться у вас, какой тип БД лучше выбрать для хранения определённых данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

- электронные чеки в json-виде,
- склады и автомобильные дороги для логистической компании,
- генеалогические деревья,
- кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации,
- отношения клиент-покупка для интернет-магазина.
Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.

<details><summary>Ответ:</summary>  

![](https://github.com/mrashevchenko/gitlab-hw/blob/hw05-virt-04/img/hw050402.PNG)  
</details>

## Задача 2

Вы создали распределённое высоконагруженное приложение и хотите классифицировать его согласно CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если (каждый пункт — это отдельная реализация вашей системы и для каждого пункта нужно привести классификацию):

- данные записываются на все узлы с задержкой до часа (асинхронная запись);
- при сетевых сбоях система может разделиться на 2 раздельных кластера;
- система может не прислать корректный ответ или сбросить соединение.
Согласно PACELC-теореме как бы вы классифицировали эти реализации?  

<details><summary>Ответ:</summary>   

![](https://github.com/mrashevchenko/gitlab-hw/blob/hw05-virt-04/img/hw050401.PNG)  
</details>

## Задача 3

Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?

<details><summary>Ответ:</summary> 

```bash
╰─➤ ssh centos@51.250.16.13
[centos@hw01 ~]$ sudo -i
[root@hw01 ~]# docker ps
CONTAINER ID   IMAGE                                       COMMAND                  CREATED         STATUS                   PORTS                                                                              NAMES
9e2e61570bae   prom/prometheus:v2.17.1                     "/bin/prometheus --c…"   2 minutes ago   Up 2 minutes             9090/tcp                                                                           prometheus
65258868ef0b   stefanprodan/caddy                          "/sbin/tini -- caddy…"   2 minutes ago   Up 2 minutes             0.0.0.0:3000->3000/tcp, 0.0.0.0:9090-9091->9090-9091/tcp, 0.0.0.0:9093->9093/tcp   caddy
56202a408eca   prom/alertmanager:v0.20.0                   "/bin/alertmanager -…"   2 minutes ago   Up 2 minutes             9093/tcp                                                                           alertmanager
7c39b1d4ca77   prom/pushgateway:v1.2.0                     "/bin/pushgateway"       2 minutes ago   Up 2 minutes             9091/tcp                                                                           pushgateway
51f7ea9d7c2c   grafana/grafana:7.4.2                       "/run.sh"                2 minutes ago   Up 2 minutes             3000/tcp                                                                           grafana
e5b8556be293   gcr.io/google-containers/cadvisor:v0.34.0   "/usr/bin/cadvisor -…"   2 minutes ago   Up 2 minutes (healthy)   8080/tcp                                                                           cadvisor
0b8650c62985   prom/node-exporter:v0.18.1                  "/bin/node_exporter …"   2 minutes ago   Up 2 minutes             9100/tcp                                                                           nodeexporter
```
</details>

## Задача 4

Вам дали задачу написать системное решение, основой которого бы послужили:

- фиксация некоторых значений с временем жизни,
- реакция на истечение таймаута.
Вы слышали о key-value-хранилище, которое имеет механизм Pub/Sub. Что это за система? Какие минусы выбора этой системы?

<details><summary>Ответ:</summary>  

![](https://github.com/mrashevchenko/gitlab-hw/blob/hw05-virt-04/img/hw050403.PNG) 
</details>
