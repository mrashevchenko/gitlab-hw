# Домашнее задание к занятию «Базы данных» - `Rashevchenko Mikhail`

### Задание 1

```
CREATE TABLE personal(

  personal_id primary_key,

  last_name_name VARCHAR(50),

  first_name VARCHAR(50),

  patronymic_name VARCHAR(50),

  salary NUMERIC,

  post_id NUMERIC,

  spod_id NUMERIC,

  date_of_hiring DATE,

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
CREATE TABLE division (

  division_id primary_key

  division_name varchar(50)

)
```

```
CREATE TABLE date_of_hiring (

  date_of_hiring primary_key,

  date DATE

)
```

```
CREATE TABLE addres (

  addres_id primary_key,

  addres varchar(100),

  city_id integer,
  
  region_id integer,
  
)
```

```
CREATE TABLE region (

  region_id primary_key,

  region_nam VARCHAR(50)

)
```

)
```
CREATE TABLE city (

  city_id primary_key

  city_name varchar(50)

)
```

```
CREATE TABLE project (

  project_id primary_key,

  project_name VARCHAR(50)

)
```



