# Домашнее задание к занятию «Базы данных» - `Rashevchenko Mikhail`

### Задание 1

```
CREATE TABLE (

  personal_id primary_key,

  last_name_name varchar(50),

  first_name varchar(50),

  patronymic_name varchar(50),

  salary NUMERIC,

  post_id NUMERIC,

  spod_id NUMERIC,

  date_of_hiring date,

  office_id VARCHAR(50),

  project_id NUMERIC
)
```

```
  CREATE TABLE salary (

  salary_id primary_key

  salary_name varchar(50)

)
```

```
CREATE TABLE post (

  post_id primary_key

  position_name varchar(50)

)
```

```
CREATE TABLE spod (

  spod_id primary_key

  spod_name varchar(50)

)
```

```
CREATE TABLE date_of_hiring (

  date_of_hiring primary_key,

  date DATE

)
```

```
CREATE TABLE office (

  office_id primary_key,

  country VARCHAR(50),
  
  city VARCHAR(50),
  
  street VARCHAR(50),
  
  building NUMERIC

)
```

```
CREATE TABLE project (

  project_id primary_key,

  project_name VARCHAR(50)

)
```
