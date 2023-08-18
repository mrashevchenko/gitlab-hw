# Домашнее задание к занятию "`Системы контроля версий`" - `Rashevchenko Mikhail`

Задание 1.
Создать и настроить репозиторий для дальнейшей работы на курсе
* Репозиторий ранее был создан и в нем ведутся задания, каждое задание находиться в своей ветке.

Создание файлов .gitignore и второго коммита
* Благодаря файлу .gitignore для Terraform при использовании команды commit , будут игнорироваться файлы и директории перечисленные в .gitignore.  

Файлы и директории которые будут игнорироваться согласно настройкам */Terraform/.gitignore:  
* поддиректории .terraform и все вложенные в нее директории, файлы   
`**/.terraform/*`  
* файлы в корне и поддиректориях с расширением
`*.tfstate, *.tfstate.*`  `*.tfvars` `.terraformrc` `terraform.rc`
* файлы с именем crash.log  
`crash.log`  
* файлы вида override.tf, override.tf.json, *_override.tf, *_override.tf.json  
`override.tf, override.tf.json, *_override.tf, *_override.tf.json`  
 
