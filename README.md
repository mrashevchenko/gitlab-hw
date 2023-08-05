# Домашнее задание к занятию «SQL. Часть 1» - `Rashevchenko Mikhail`

---

### Задание 1
```
SELECT *
    -> FROM payment
    -> WHERE payment_date BETWEEN  CAST('2005-06-15' AS DATE) AND CAST('2005-06-19' AS DATE)
    -> AND amount > 10;
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-03/img/hw120301.PNG?raw=true)

### Задание 2
```
SELECT payment_id, amount, CAST(payment_date AS DATE) FROM payment WHERE amount > 10.00 AND payment_date BETWEEN '2005-06-15' AND '2005-06-19';
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-03/img/hw120302.PNG?raw=true)

### Задание 3
```
SELECT * FROM rental ORDER by rental_date DESC LIMIT 5;
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-03/img/hw120303.PNG?raw=true)

### Задание 4
```
SELECT LOWER(REPLACE(first_name, 'L', 'p')), LOWER(last_name) FROM customer WHERE first_name LIKE 'Willie' OR first_name  LIKE 'Kelly';
```
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw12-03/img/hw120304.PNG?raw=true)
