# Домашнее задание к занятию 1 «Введение в Ansible» - `Rashevchenko Mikhail`

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/02534ba9-d8ee-463e-a993-fc47ae0b1b65)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/b840a9ea-a43b-4133-952b-21d8f1eb9019)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/10fe9cec-f0da-443a-8aef-98b93e228f89)

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/9e636b39-0252-4ef8-a805-02fa3ba08271)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/a7901f51-58ba-40cc-b01e-ad1b6082a389)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/83aa7d08-d97c-4255-984a-0369e73dc87f)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/12ba6410-ae2e-4850-95c5-d4b2150db8ad)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/bfe53b94-002e-4b98-91b5-2c2f1de43cc9)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/a741ebf3-83b5-4cc1-927e-42b6fd25fa14)

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.
