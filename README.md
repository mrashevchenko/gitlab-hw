# Домашнее задание к занятию `«Продвинутые методы работы с Terraform»` - `Rashevchenko Mikhail`

------

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.


<details><summary>Ответ:</summary>
	
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/eac0e9a9-5677-4bd1-8876-2f8c13f87816)

* Скачал готовый код
* Файл  ```cloud-init.yml ```
```bash
#cloud-config
users:
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ${ssh_public_key}
package_update: true
package_upgrade: false
packages:
  - vim
  - nginx
runcmd:
- ufw allow 22
- echo "y" | ufw enable
```

*Передал ssh-ключ в файле ```main.tf```

```bash
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = file("~/.ssh/id_ed25519.pub")
  }
}

```
</details>

------

### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.
6. Сгенерируйте документацию к модулю с помощью terraform-docs.    
 
Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```

<details><summary>Ответ:</summary>

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/322cd532-957c-4789-a8ea-9cb3873e753b)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/b029123e-a3e5-479b-997d-8adfeb25dc3f)


Сгенерированная документация:
* https://github.com/mrashevchenko/gitlab-hw/blob/hw07-04/src/vpc/README.md
* https://github.com/mrashevchenko/gitlab-hw/blob/hw07-04/src/README.md  

</details>

------

### Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.
<details><summary>Ответ:</summary>
	

```bash

```

</details>
