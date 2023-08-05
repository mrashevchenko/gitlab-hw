# Домашнее задание к занятию «Индексы» - `Rashevchenko Mikhail`

### Задание 1
Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.
```
select sum(tt.data_length) as data, sum(tt.index_length) as 'index', concat( round ((sum(tt.index_length) / sum(tt.data_length)) *100), ' %') as ratio from information_schema.tables tt where tt.table_schema = 'sakila';
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-05/img/hw120501.PNG?raw=true)

### Задание 2

Выполните explain analyze следующего запроса:
```sql
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title) from payment p, rental r, customer c, inventory i, film f where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id;
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-05/img/hw120502.PNG?raw=true)

- перечислите узкие места  
- оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы

Нужно убрать из запроса операторы distinct,over f.title, а так же film t - так запрос будет обратываться быстрее, так как они были "узкими горлышками".

```
select concat(c.last_name, ' ', c.first_name) as name, sum(p.amount) as summ from payment p, rental r, customer c, inventory i where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id group by name;
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-05/img/hw120503.PNG?raw=true)  
