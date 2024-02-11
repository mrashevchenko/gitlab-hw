# Домашнее задание к занятию "``" 
# Домашнее задание к занятию 7 «Жизненный цикл ПО» - `Rashevchenko Mikhail`

## Подготовка к выполнению

1. Получить бесплатную версию Jira - https://www.atlassian.com/ru/software/jira/work-management/free (скопируйте ссылку в адресную строку). Вы можете воспользоваться любым(в том числе бесплатным vpn сервисом) если сайт у вас недоступен. Кроме того вы можете скачать [docker образ](https://hub.docker.com/r/atlassian/jira-software/#) и запустить на своем хосте self-managed версию jira.
2. Настроить её для своей команды разработки.
3. Создать доски Kanban и Scrum.
4. [Дополнительные инструкции от разработчика Jira](https://support.atlassian.com/jira-cloud-administration/docs/import-and-export-issue-workflows/).

## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done. 
1. Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done. 
1. При проведении обеих задач по статусам используйте kanban. 
1. Верните задачи в статус Open.
1. Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.
2. Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/a6ecd754-5b97-46b3-9f6e-0f3cf765eaa9)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/006a9515-ebe6-4c60-b579-255e4d397770)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/7412c1b2-4266-48da-a36b-bb0d3a6b0e78)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/1c2ad589-5154-491b-9fce-4aeabce88df1)

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/da09d017-14f6-4df0-918a-0585db221545)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/a8a9740f-1d64-4b27-b5e6-b0cfaac8a149)

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/9083f432-2942-46e8-943a-d0274ec23887)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/f0a1efb3-a450-4434-a539-468b6466d506)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.
