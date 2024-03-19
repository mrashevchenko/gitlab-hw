# Домашнее задание к занятию 14 «Средство визуализации Grafana» - `Rashevchenko Mikhail`

## Обязательные задания

### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
1. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
1. Подключите поднятый вами prometheus, как источник данных.
1. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

<details><summary>Ответ:</summary>  

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/c9582202-5bb6-42ab-917d-a09fb75985f6)


</details>

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
1. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
1. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

<details><summary>Ответ:</summary>  

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/4b1a9cfe-b8c7-4897-ae6a-7e4e58909c4c)

+ утилизация CPU для nodeexporter (в процентах, 100-idle);
```
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle", instance=~"nodeexporter:9100"}[1m])) * 100)
```

+ CPULA 1/5/15;
  
++ A  
```
(avg by(instance) (node_load1{instance=~"nodeexporter:9100"}) * 100) / count by(instance) (count by(cpu, instance) (node_cpu_seconds_total{instance=~"nodeexporter:9100"}))
```

++ B:  
```
(avg by(instance) (node_load5{instance=~"nodeexporter:9100"}) * 100) / count by(instance) (count by(cpu, instance) (node_cpu_seconds_total{instance=~"nodeexporter:9100"}))
```

++ C:  
```
(avg by(instance) (node_load15{instance=~"nodeexporter:9100"}) * 100) / count by(instance) (count by(cpu, instance) (node_cpu_seconds_total{instance=~"nodeexporter:9100"}))
```

+ количество свободной оперативной памяти;
```
avg by (instance) (100 * ((avg_over_time(node_memory_MemFree_bytes{instance=~"nodeexporter:9100"}[5m]) + avg_over_time(node_memory_Cached_bytes{instance=~"nodeexporter:9100"}[5m]) + avg_over_time(node_memory_Buffers_bytes{instance=~"nodeexporter:9100"}[5m])) / avg_over_time(node_memory_MemTotal_bytes{instance=~"nodeexporter:9100"}[5m])))
```

+ количество места на файловой системе.
```
100 - (node_filesystem_avail_bytes{instance=~"nodeexporter:9100",mountpoint="/"} * 100 / node_filesystem_size_bytes{instance=~"nodeexporter:9100",mountpoint="/"})
```

</details>

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

<details><summary>Ответ:</summary>  

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/3d3e0e4b-5229-498f-b289-535f2a35994e)

</details>

## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.

<details><summary>Ответ:</summary>  

https://github.com/mrashevchenko/gitlab-hw/blob/hw13-03/Dashboard.json

</details>
---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---

<details><summary>Ответ:</summary>  

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/7d04cdfb-07c2-4aad-b55d-f5893b44f7f0)

</details>

