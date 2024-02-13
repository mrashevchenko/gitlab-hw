# Домашнее задание к занятию 10 «Jenkins» - `Rashevchenko Mikhail`

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
2. Установить Jenkins при помощи playbook.
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/562c494c-42b4-4c90-9d2e-82c2e38c989b)

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/2f958fe0-93ce-4dbb-b2f9-5ad331016e78)
   
2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/4e709725-c595-4625-8311-91aa38f08b5f)

**Pipeline script**
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/94cf6901-9693-4291-95e4-b59014e0893d)


```
pipeline {
    agent {
        label 'ansible'
    }
    stages {
        stage('Get role') {
            steps {
                dir('vector-role') {
                    git branch: 'main', credentialsId: 'git', url: 'https://github.com/mrashevchenko/ansible-vector'
                }
            }
        }
        stage('Install molecule') {
            steps {
                sh 'pip3 install molecule==3.4.0 molecule-docker'
                sh 'pip3 install --upgrade requests==2.26.0'
            }
        }
        stage('Test role') {
            steps {
                dir('vector-role') {
                    sh 'molecule test'
                }
            }
        }
    }
}

```

3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.
- [Jenkinsfile](Jenkinsfile)

4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/69b38ed0-8529-40f1-b855-ce87b8c75049)


5. Создать Scripted Pipeline, наполнить его скриптом из pipeline.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/b140b6f8-8eb8-4f1f-9b7f-3bed7b5bd1a4)


6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/8d17e324-29a6-4fea-9de3-43eeca9c7cfa)

```
node("linux"){
    stage("Git checkout my") {
        git branch: 'master', credentialsId: '8707a55d-eb8a-485a-9cd4-47a0038ef384', url: 'git@github.com:aragastmatb/example-playbook.git'
    }
    stage("Sample define secret_check"){
        secret_check=true
    }
    stage("Defind prod_run"){
        prod_run = true
    }
    stage("Run playbook"){
        if (prod_run){
            sh 'ansible-playbook site.yml -i inventory/prod.yml'
        }
        else{ 
            sh 'ansible-playbook site.yml -i inventory/prod.yml --check --diff'
        }
        
    }
}


```

7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/0e32958c-4241-48cb-a6e3-4510f6c66023)


8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.
- [ScriptedJenkinsfile](ScriptedJenkinsfile)
- [DeclarativeJenkinsfile](DeclarativeJenkinsfile)



## Необязательная часть

1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.
2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
