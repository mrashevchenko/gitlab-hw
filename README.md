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
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/dba1613a-194a-4da6-ad59-f8bcb979de1e)



Сгенерированная документация:
* https://github.com/mrashevchenko/gitlab-hw/blob/hw07-04/src/vpc/README.md

</details>

------

### Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.
<details><summary>Ответ:</summary>

 ![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/b6a3eea3-cc67-44db-9f4b-085934a828ff)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/2de0639a-9f0b-431f-8a85-8e54f4bd4a13)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/06e286bc-2fff-44ed-b405-a99f0b4a4840)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/704138f2-206d-4a03-8f48-cd42897e5db9)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/3caad9be-9053-46df-967f-f9316ffbdd05)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/b1ecf140-8741-47ae-9fc1-774d6c371150)

```bash
root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform state list 
data.template_file.cloudinit
module.test-vm.data.yandex_compute_image.my_image
module.test-vm.yandex_compute_instance.vm[0]
module.vpc_dev.yandex_vpc_network.vpc
module.vpc_dev.yandex_vpc_subnet.subnet
root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform state rm module.vpc_dev
Removed module.vpc_dev.yandex_vpc_network.vpc
Removed module.vpc_dev.yandex_vpc_subnet.subnet
Successfully removed 2 resource instance(s).
root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform state rm module.test-vm
Removed module.test-vm.data.yandex_compute_image.my_image
Removed module.test-vm.yandex_compute_instance.vm[0]
Successfully removed 2 resource instance(s).
root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform state list
data.template_file.cloudinit
root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform import module.vpc_dev.yandex_vpc_subnet.subnet e9b0hhf6nm59hs81cc7i
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on .terraform/modules/test-vm/providers.tf line 2, in provider "template":
│    2:   version = "2.2.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now
│ deprecated and will be removed in a future version of Terraform. To silence this warning, move the provider version
│ constraint into the required_providers block.
╵

data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=364b1e22e82af0eec2e853b1e8ce83e223b5a4f288e9badfad34c0b3105f49e8]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_subnet.subnet: Importing from ID "e9b0hhf6nm59hs81cc7i"...
module.vpc_dev.yandex_vpc_subnet.subnet: Import prepared!
  Prepared yandex_vpc_subnet for import
module.vpc_dev.yandex_vpc_subnet.subnet: Refreshing state... [id=e9b0hhf6nm59hs81cc7i]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 1s [id=fd853sqaosrb2anl1uve]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on .terraform/modules/test-vm/providers.tf line 2, in provider "template":
│    2:   version = "2.2.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now
│ deprecated and will be removed in a future version of Terraform. To silence this warning, move the provider version
│ constraint into the required_providers block.
│ 
│ (and one more similar warning elsewhere)
╵

root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform import module.vpc_dev.yandex_vpc_network.vpc enpie7iumfj9nui1am1l
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on .terraform/modules/test-vm/providers.tf line 2, in provider "template":
│    2:   version = "2.2.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now
│ deprecated and will be removed in a future version of Terraform. To silence this warning, move the provider version
│ constraint into the required_providers block.
╵

data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=364b1e22e82af0eec2e853b1e8ce83e223b5a4f288e9badfad34c0b3105f49e8]
module.vpc_dev.yandex_vpc_network.vpc: Importing from ID "enpie7iumfj9nui1am1l"...
module.vpc_dev.yandex_vpc_network.vpc: Import prepared!
  Prepared yandex_vpc_network for import
module.vpc_dev.yandex_vpc_network.vpc: Refreshing state... [id=enpie7iumfj9nui1am1l]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.test-vm.data.yandex_compute_image.my_image: Read complete after 0s [id=fd853sqaosrb2anl1uve]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on .terraform/modules/test-vm/providers.tf line 2, in provider "template":
│    2:   version = "2.2.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now
│ deprecated and will be removed in a future version of Terraform. To silence this warning, move the provider version
│ constraint into the required_providers block.
│ 
│ (and one more similar warning elsewhere)
╵

root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform import module.test-vm.yandex_compute_instance.vm[0] fhmcj1jrm4o8c23vn5em
╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on .terraform/modules/test-vm/providers.tf line 2, in provider "template":
│    2:   version = "2.2.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now
│ deprecated and will be removed in a future version of Terraform. To silence this warning, move the provider version
│ constraint into the required_providers block.
╵

data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=364b1e22e82af0eec2e853b1e8ce83e223b5a4f288e9badfad34c0b3105f49e8]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.test-vm.data.yandex_compute_image.my_image: Read complete after 0s [id=fd853sqaosrb2anl1uve]
module.test-vm.yandex_compute_instance.vm[0]: Importing from ID "fhmcj1jrm4o8c23vn5em"...
module.test-vm.yandex_compute_instance.vm[0]: Import prepared!
  Prepared yandex_compute_instance for import
module.test-vm.yandex_compute_instance.vm[0]: Refreshing state... [id=fhmcj1jrm4o8c23vn5em]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.

╷
│ Warning: Version constraints inside provider configuration blocks are deprecated
│ 
│   on .terraform/modules/test-vm/providers.tf line 2, in provider "template":
│    2:   version = "2.2.0"
│ 
│ Terraform 0.13 and earlier allowed provider version constraints inside the provider configuration block, but that is now
│ deprecated and will be removed in a future version of Terraform. To silence this warning, move the provider version
│ constraint into the required_providers block.
│ 
│ (and one more similar warning elsewhere)
╵

root@netology:/opt/terraform/ter-homeworks/04/demo1# terraform state list 
data.template_file.cloudinit
module.test-vm.data.yandex_compute_image.my_image
module.test-vm.yandex_compute_instance.vm[0]
module.vpc_dev.yandex_vpc_network.vpc
module.vpc_dev.yandex_vpc_subnet.subnet

```

</details>
