# Домашнее задание к занятию «SQL. Часть 2» - `Rashevchenko Mikhail`

---
### Задание 1
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию: 
- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.
  
```
SELECT concat(s.first_name, ' ', s.last_name) as manager_name, c.city, count(c2.customer_id) as count FROM staff s JOIN address a ON s.address_id = a.address_id JOIN city c ON a.city_id = c.city_id JOIN store s2 ON s2.store_id = s.store_id JOIN customer c2 ON s2.store_id = c2.store_id GROUP BY s.first_name, s.last_name , c.city HAVING count > 300;
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-04/img/hw120401.PNG?raw=true)

### Задание 2
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

```
SELECT COUNT(*) films FROM film WHERE length > (SELECT avg(length)FROM film);
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-04/img/hw120402.PNG?raw=true)

### Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.
```
SELECT MONTH(p.payment_date) AS month, (SUM(p.amount )) AS summ, COUNT((p.rental_id )) AS leases FROM payment p GROUP BY month ORDER BY summ DESC LIMIT 1;
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-04/img/hw120403.PNG?raw=true)

