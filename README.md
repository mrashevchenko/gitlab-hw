# Домашнее задание к занятию `«Основы Terraform. Yandex Cloud»` - `Rashevchenko Mikhail`

### Цели задания

1. Создать свои ресурсы в облаке Yandex Cloud с помощью Terraform.
2. Освоить работу с переменными Terraform.


### Чек-лист готовности к домашнему заданию

1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
2. Установлен инструмент Yandex CLI.
3. Исходный код для выполнения задания расположен в директории [**02/src**](https://github.com/netology-code/ter-homeworks/tree/main/02/src).


### Задание 0

1. Ознакомьтесь с [документацией к security-groups в Yandex Cloud](https://cloud.yandex.ru/docs/vpc/concepts/security-groups?from=int-console-help-center-or-nav).
2. Запросите preview-доступ к этому функционалу в личном кабинете Yandex Cloud. Обычно его выдают в течение 24-х часов.
https://console.cloud.yandex.ru/folders/<ваш cloud_id>/vpc/security-groups.   
Этот функционал понадобится к следующей лекции. 

------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.  Убедитесь что ваша версия **Terraform** =1.5.Х (версия 1.6.Х может вызывать проблемы с Яндекс провайдером) 

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные: идентификаторы облака, токен доступа. Благодаря .gitignore этот файл не попадёт в публичный репозиторий. **Вы можете выбрать иной способ безопасно передать секретные данные в terraform.**
3. Сгенерируйте или используйте свой текущий ssh-ключ. Запишите его открытую часть в переменную **vms_ssh_root_key**.
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
5. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ. Ответ в документации Yandex Cloud.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ;
- скриншот успешного подключения к консоли ВМ через ssh. К OS ubuntu необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address";
- ответы на вопросы.

<details><summary>Ответ:</summary>
     
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/0b899631-fa0a-4f6d-b77f-26b2ff812fb1)   
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/9ca991c3-98f1-412a-8402-b0bb872ac48c)   

* Файл variables.tf нужен для того, чтобы определить типы переменных и при необходимости, установить их значения по умолчанию.
* Переименовал файл personal.auto.tfvars_example в personal.auto.tfvars, заполнил переменные. Файл personal.auto.tfvars находится в .gitignore, данные не попадут в сеть.
* Создал ssh-ключ и записал pub часть в переменную vms_ssh_root_key.
* Исправил ошибки:
- В строке platform_id = "standart-v4" должно быть слово standard
- Исправил v4 на v1 - v4 неправильная. Согласно документации может использоватся v1, v2 и v3.
- В строке cores = 1 указано неправильное количество ядер процессора. Согласно документации может использоватся минимальное количество из 2 виртуальных ядер процессора для всех платформ.
* Параметр preemptible = true применяется в том случае, если нужно сделать виртуальную машину прерываемой, то есть возможность остановки ВМ в любой момент. 
* Параметр core_fraction=5 указывает базовую производительность ядра в процентах. Указывается для экономии ресурсов.  

</details>

### Задание 2

1. Изучите файлы проекта.
2. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan. Изменений быть не должно. 

<details><summary>Ответ:</summary>
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/925dadf2-e77e-4160-b041-0c61354466fd)

```bash
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
}

```
     
```bash
##Zadanie 2

variable "vm_web_family" {
  type	      = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}
	
variable "vm_web_name" {
  type	      = string
  default     = "netology-develop-platform-web"
  description = "instance name"
}

variable "vm_web_platform_id" {
  type	      = string
  default     = "standard-v1"
  description = "platform ID"
}

variable "vm_web_cores" {
  type        = string
  default     = "2"
  description = "vCPU numbers"
}

variable "vm_web_memory" {
  type        = string
  default     = "1"
  description = "VM memory, GB"
}
	
variable "vm_web_core_fraction" {
  type        = string
  default     = "5"
  description = "core fraction"
}

```   

</details>

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').
3. Примените изменения.

<details><summary>Ответ:</summary>
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/790fc4cc-e34a-4e4c-8962-c3570bff0e0c)
     
  
```bash

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform1" {
  name = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
}
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}
data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platform2" {
  name = var.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
}
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

```

 
```bash
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform1" {
  name = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
}
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}
data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platform2" {
  name = var.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
}
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }



  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
root@netology:/opt/terraform/ter-homeworks/02/src# cat vms_platform.tf 
variable "vm_web_family" {
  type	      = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}
	
variable "vm_web_name" {
  type	      = string
  default     = "netology-develop-platform-web"
  description = "instance name"
}

variable "vm_web_platform_id" {
  type	      = string
  default     = "standard-v1"
  description = "platform ID"
}

variable "vm_web_cores" {
  type        = string
  default     = "2"
  description = "vCPU numbers"
}

variable "vm_web_memory" {
  type        = string
  default     = "1"
  description = "VM memory, GB"
}
	
variable "vm_web_core_fraction" {
  type        = string
  default     = "5"
  description = "core fraction"
}

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "instance name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform ID"
}

variable "vm_db_cores" {
  type        = string
  default     = "2"
  description = "vCPU numbers"
}

variable "vm_db_memory" {
  type        = string
  default     = "2"
  description = "VM memory, GB"
}

variable "vm_db_core_fraction" {
  type        = string
  default     = "20"
  description = "core fraction"
}

```
</details>

### Задание 4

1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

<details><summary>Ответ:</summary>
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/e444ad97-f95a-4e56-9eac-5cbf1af04143)
     
```bash
output "VMs" {
  value = {
    instance_name1 = yandex_compute_instance.platform1.name
    external_ip1 = yandex_compute_instance.platform1.network_interface.0.nat_ip_address
    instance_name2 = yandex_compute_instance.platform2.name
    external_ip2 = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
  }
}
```   

</details>

### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
2. Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.
3. Примените изменения.

<details><summary>Ответ:</summary>
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/84d22362-790f-4fc4-8d8b-4d13bd1f642d)
     
```bash
output "VMs" {
  value = {
    instance_name1 = yandex_compute_instance.platform1.name
    external_ip1 = yandex_compute_instance.platform1.network_interface.0.nat_ip_address
    instance_name2 = yandex_compute_instance.platform2.name
    external_ip2 = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
  }
}
```   
```bash
resource "yandex_compute_instance" "platform1" {
  name = local.vm_web_instance_name

resource "yandex_compute_instance" "platform2" {
  name = local.vm_db_instance_name

```

</details>

### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в переменные типа **map** с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробуйте создать одну map-переменную **vms_resources** и уже внутри неё конфиги обеих ВМ — вложенный map.
2. Также поступите с блоком **metadata {serial-port-enable, ssh-keys}**, эта переменная должна быть общая для всех ваших ВМ.
3. Найдите и удалите все более не используемые переменные проекта.
4. Проверьте terraform plan. Изменений быть не должно.

<details><summary>Ответ:</summary>
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/d91d7751-4eb8-44af-ac08-7123ecca8fd1)
     
* Закоментировал все не используемые переменные проекта   
```bash
variable "vm_web_family" {
  type	      = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}
	
#variable "vm_web_name" {
#  type	      = string
#  default     = "netology-develop-platform-web"
#  description = "instance name"
#}

variable "vm_web_platform_id" {
  type	      = string
  default     = "standard-v1"
  description = "platform ID"
}

#variable "vm_web_cores" {
#  type        = string
#  default     = "2"
#  description = "vCPU numbers"
#}

#variable "vm_web_memory" {
#  type        = string
#  default     = "1"
#  description = "VM memory, GB"
#}
	
#variable "vm_web_core_fraction" {
#  type        = string
#  default     = "5"
#  description = "core fraction"
#}

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu version"
}

#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "instance name"
#}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform ID"
}

#variable "vm_db_cores" {
#  type        = string
#  default     = "2"
#  description = "vCPU numbers"
#}

#variable "vm_db_memory" {
#  type        = string
#  default     = "2"
#  description = "VM memory, GB"
#}

#variable "vm_db_core_fraction" {
#  type        = string
#  default     = "20"
#  description = "core fraction"
#}


variable "vms_resources" {
  description = "Resources for all vms"
  type        = map(map(number))
  default     = {
    vm_web_resources = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    vm_db_resources = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "common_metadata" {
  description = "metadata for all vms"
  type        = map(string)
  default     = {
    serial-port-enable = "1"
    ssh-keys          = "ubuntu:ssh-ed25519 AAA111111111sssssssssOZMkc+lbzYCXNhOzqXldzlXYu2A14MQKMq/ root@netology"
  }
}
```
```bash
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform1" {
  name =  local.vm_web_instance_name
  platform_id = var.vm_web_platform_id
  metadata = var.common_metadata
  resources {
    cores         = var.vms_resources.vm_web_resources.cores
    memory        = var.vms_resources.vm_web_resources.memory
    core_fraction = var.vms_resources.vm_web_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
}
data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platform2" {
  name        = local.vm_db_instance_name
  platform_id = var.vm_db_platform_id
  metadata    = var.common_metadata
  resources {
    cores         = var.vms_resources.vm_db_resources.cores
    memory        = var.vms_resources.vm_db_resources.memory
    core_fraction = var.vms_resources.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }



#  metadata = {
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }

}

```
</details>
