# Домашнее задание к занятию `«Управляющие конструкции в коде Terraform»` - `Rashevchenko Mikhail`

### Задание 1

1. Изучите проект.
2. Заполните файл personal.auto.tfvars.
3. Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.

Примечание. Если у вас не активирован preview-доступ к функционалу «Группы безопасности» в Yandex Cloud, запросите доступ у поддержки облачного провайдера. Обычно его выдают в течение 24-х часов.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.

<details><summary>Ответ:</summary>
	
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/8a23e7f1-1399-491d-8cf5-1b9c89abf2d9)
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/5e80a8a6-16f0-4b94-95e3-ff033e8c9b11)

</details>

------

### Задание 2

1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ с именами "main" и "replica" **разных** по cpu/ram/disk , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа list(object({ vm_name=string, cpu=number, ram=number, disk=number  })). При желании внесите в переменную все возможные параметры.
3. ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1.
4. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
5. Инициализируйте проект, выполните код.

<details><summary>Ответ:</summary>

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/0823f9b5-dbee-4e69-a311-7910c4a06b92)

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/4f18029a-f4b7-47a9-824a-1067971d0756)


* Создал две ВМ с помощью мета-аргумент ```count loop``` через файл count-vm.tf
```bash
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "count" {
  count = 2
  name = "web-${count.index + 1}"

  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
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
    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = join(":", ["ubuntu", file("~/.ssh/id_ed25519.pub")])
  }
}
```
* Создал 2 разных по cpu/ram/disk ВМ используя мета-аргумент for_each loop и используя переменную типа ```list(object({ vm_name=string, cpu=number, ram=number, disk=number }))``` через файл for_each-vm.tf

```bash
resource "yandex_compute_instance" "for-each" {
  depends_on = [yandex_compute_instance.count]

  for_each = { main = {cpu=2, ram=1, fraction=20}, replica = {cpu=4, ram=2, fraction=5} }

  name = "${each.key}"

  platform_id = "standard-v1"
  resources {
    cores         = "${each.value.cpu}"
    memory        = "${each.value.ram}"
    core_fraction = "${each.value.fraction}"
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
    ssh-keys           = join(":", ["ubuntu", file("~/.ssh/id_ed25519.pub")])
  }

}
```

</details>

------

### Задание 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

<details><summary>Ответ:</summary>
	
* Создал файл disk_vm.tf	
	
```bash
variable "storage_secondary_disk" {
  type = list(object({
    for_storage = object({
      type       = string
      size       = number
      count      = number
      block_size = number
      name = string
    })
  }))

  default = [
    {
      for_storage = {
        type       = "network-hdd"
        size       = 1
        count      = 3
        block_size = 4096
        name = "disk"
      }
    }
  ]
}

resource "yandex_compute_disk" "disks" {
  name  = "${var.storage_secondary_disk[0].for_storage.name}-${count.index+1}"
  type  = var.storage_secondary_disk[0].for_storage.type
  size  = var.storage_secondary_disk[0].for_storage.size
  count = var.storage_secondary_disk[0].for_storage.count
  block_size  = var.storage_secondary_disk[0].for_storage.block_size
}
variable "yandex_compute_instance_storage" {
  type = object({
    storage_resources = object({
      cores        = number
      memory       = number
      core_fraction = number
      name         = string
      zone         = string
    })
  })

  default = {
    storage_resources = {
      cores        = 2
      memory       = 2
      core_fraction = 5
      name         = "storage"
      zone         = "ru-central1-a"
    }
  }
}

variable "boot_disk_storage" {
  type = object({
    size = number
    type = string
  })
  default = {
    size = 5
    type = "network-hdd"
  }
}


resource "yandex_compute_instance" "storage" {
  name = var.yandex_compute_instance_storage.storage_resources.name
  zone = var.yandex_compute_instance_storage.storage_resources.zone

  resources {
    cores  = var.yandex_compute_instance_storage.storage_resources.cores
    memory = var.yandex_compute_instance_storage.storage_resources.memory
    core_fraction = var.yandex_compute_instance_storage.storage_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.boot_disk_storage.type
      size     = var.boot_disk_storage.size
    }
  }
      metadata = {
      ssh-keys           = "ubuntu:${local.ssh-keys}"
      serial-port-enable = "1"
    }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disks.*.id
    content {
      disk_id = secondary_disk.value
  }
  }
}
resource "null_resource" "web_hosts_provision" {
  #Ждем создания инстанса
  depends_on = [yandex_compute_instance.storage]

provisioner "local-exec" {
    command = "eval `ssh-agent -s`"
}
provisioner "local-exec" {
    command = "ssh-add - | cat ~/.ssh/id_ed25519"
  }

  #Костыль!!! Даем ВМ 60 сек на первый запуск. Лучше выполнить это через wait_for port 22 на стороне ansible
# В случае использования cloud-init может потребоваться еще больше времени
 provisioner "local-exec" {
    command = "sleep 120"
  }

#Запуск ansible-playbook
  provisioner "local-exec" {
    command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.cfg ${abspath(path.module)}/test.yml"
    on_failure = continue #Продолжить выполнение terraform pipeline в случае ошибок
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
    #срабатывание триггера при изменении переменных
  }
    triggers = {
      always_run         = "${timestamp()}" #всегда т.к. дата и время постоянно изменяются
      playbook_src_hash  = file("${abspath(path.module)}/test.yml") # при изменении содержимого playbook файла
      ssh_public_key     = local.ssh-keys # при изменении переменной
    }
  }

```
</details>

------

### Задание 4

1. В файле ansible.tf создайте inventory-файл для ansible.
Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demonstration2).
Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.
2. Инвентарь должен содержать 3 группы [webservers], [databases], [storage] и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
3. Выполните код. Приложите скриншот получившегося файла. 

Для общего зачёта создайте в вашем GitHub-репозитории новую ветку terraform-03. Закоммитьте в эту ветку свой финальный код проекта, пришлите ссылку на коммит.   
**Удалите все созданные ресурсы**.

<details><summary>Ответ:</summary>

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/2e11863d-6005-4b10-bebe-b0acfcf727c5)

 
```bash
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
   {webservers =  yandex_compute_instance.web
    databases = yandex_compute_instance.for_each
    storage = [yandex_compute_instance.storage]}
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}

```
```bash
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
   {webservers =  yandex_compute_instance.web
    databases = yandex_compute_instance.for_each
    storage = [yandex_compute_instance.storage]}
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}

```
</details>
