# Домашнее задание к занятию `«Введение в Terraform»` - `Rashevchenko Mikhail`

### Чек-лист готовности к домашнему заданию

1. Скачайте и установите **Terraform** версии =1.5.Х (версия 1.6 может вызывать проблемы с Яндекс провайдером) . Приложите скриншот вывода команды ```terraform --version```.

 <details><summary>Ответ:</summary>

![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/01c97949-2ea0-4887-a5f9-e353d7001b17)      

</details>

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте. 

<details><summary>Ответ:</summary>
    
```bash
root@netology:/opt/terraform/hw# git clone https://github.com/netology-code/ter-homeworks.git
Cloning into 'ter-homeworks'...
remote: Enumerating objects: 945, done.
remote: Counting objects: 100% (219/219), done.
remote: Compressing objects: 100% (63/63), done.
remote: Total 945 (delta 186), reused 161 (delta 156), pack-reused 726
Receiving objects: 100% (945/945), 209.65 KiB | 1.69 MiB/s, done.
Resolving deltas: 100% (502/502), done.
root@netology:/opt/terraform/hw# cd ter-homeworks/
01/   02/   03/   04/   05/   06/   .git/ 
root@netology:/opt/terraform/hw# cd ter-homeworks/01/src/
root@netology:/opt/terraform/hw/ter-homeworks/01/src# terraform apply
╷
│ Error: Inconsistent dependency lock file
│ 
│ The following dependency selections recorded in the lock file are inconsistent with the current configuration:
│   - provider registry.terraform.io/hashicorp/random: required by this configuration but no version is selected
│   - provider registry.terraform.io/kreuzwerker/docker: required by this configuration but no version is selected
│ 
│ To make the initial dependency selections that will initialize the dependency lock file, run:
│   terraform init
╵
root@netology:/opt/terraform/hw/ter-homeworks/01/src# ^C
root@netology:/opt/terraform/hw/ter-homeworks/01/src# terraform apply
╷
│ Error: Inconsistent dependency lock file
│ 
│ The following dependency selections recorded in the lock file are inconsistent with the current configuration:
│   - provider registry.terraform.io/hashicorp/random: required by this configuration but no version is selected
│   - provider registry.terraform.io/kreuzwerker/docker: required by this configuration but no version is selected
│ 
│ To make the initial dependency selections that will initialize the dependency lock file, run:
│   terraform init
╵
root@netology:/opt/terraform/hw/ter-homeworks/01/src# terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/random...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
╷
│ Error: Invalid provider registry host
│ 
│ The host "registry.terraform.io" given in provider source address "registry.terraform.io/hashicorp/random" does not offer a
│ Terraform provider registry.
╵

╷
│ Error: Invalid provider registry host
│ 
│ The host "registry.terraform.io" given in provider source address "registry.terraform.io/kreuzwerker/docker" does not offer
│ a Terraform provider registry.
╵

root@netology:/opt/terraform/hw/ter-homeworks/01/src# nano ~/.terraformrc
root@netology:/opt/terraform/hw/ter-homeworks/01/src# ll
total 20
drwxr-xr-x 2 root root 4096 Nov 11 22:54 .
drwxr-xr-x 3 root root 4096 Nov 11 22:54 ..
-rw-r--r-- 1 root root  155 Nov 11 22:54 .gitignore
-rw-r--r-- 1 root root  756 Nov 11 22:54 main.tf
-rw-r--r-- 1 root root  206 Nov 11 22:54 .terraformrc
root@netology:/opt/terraform/hw/ter-homeworks/01/src# terraform init

Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 3.0.1"...
- Finding latest version of hashicorp/random...
- Installing kreuzwerker/docker v3.0.2...
- Installed kreuzwerker/docker v3.0.2 (unauthenticated)
- Installing hashicorp/random v3.5.1...
- Installed hashicorp/random v3.5.1 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to calculate lock file checksums locally for the
│ following providers:
│   - hashicorp/random
│   - kreuzwerker/docker
│ 
│ The current .terraform.lock.hcl file only includes checksums for linux_amd64, so Terraform running on another platform will
│ fail to install these providers.
│ 
│ To calculate additional checksums for another platform, run:
│   terraform providers lock -platform=linux_amd64
│ (where linux_amd64 is the platform to generate)
╵

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
root@netology:/opt/terraform/hw/ter-homeworks/01/src# terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # random_password.random_string will be created
  + resource "random_password" "random_string" {
      + bcrypt_hash = (sensitive value)
      + id          = (known after apply)
      + length      = 16
      + lower       = true
      + min_lower   = 1
      + min_numeric = 1
      + min_special = 0
      + min_upper   = 1
      + number      = true
      + numeric     = true
      + result      = (sensitive value)
      + special     = false
      + upper       = true
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_password.random_string: Creating...
random_password.random_string: Creation complete after 0s [id=none]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
  
```
</details>

2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?
<details><summary>Ответ:</summary>
    
```bash
# own secret vars store.
personal.auto.tfvars - позволяет именовать файлы с переменными (в том числе секретными)
```
</details>

3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

<details><summary>Ответ:</summary>
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/e2097daf-8027-4be0-a3a4-a02c1dd697e1)
</details>

4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

<details><summary>Ответ:</summary>
    
* Не указано имя ресурса docker_image - добавил nginx    
* Имя контейнера Docker было указано не врено - 1nginx - исправил на "nginx"
* В строке name = "example_${random_password.random_string_FAKE.resulT}" убрал _FAKE( из-за него создавался ресурс resource "random_password" "random_string") и исправил ключ result. 
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/ebd3f827-6aeb-47ba-bf97-be6c3f3d5e53)
</details>

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.

<details><summary>Ответ:</summary>

```bash
docker_image.nginx: Creating...
docker_image.nginx: Still creating... [10s elapsed]
docker_image.nginx: Creation complete after 19s [id=sha256:c20060033e06f882b0fbe2db7d974d72e0887a3be5e554efdb0dcf8d53512647nginx:latest]
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 2s [id=109e68af0ead275f81f0c170a6e03da9873459a07073c367f6b78b26dca33f04]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
root@netology:/opt/terraform/hw/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                                  NAMES
109e68af0ead   c20060033e06   "/docker-entrypoint.…"   36 seconds ago   Up 33 seconds   0.0.0.0:8000->80/tcp                                   example_c9dhMcgZCTZMSFUH
```
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/ebd3f827-6aeb-47ba-bf97-be6c3f3d5e53)

</details>

6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. В качестве ответа дополнительно приложите вывод команды ```docker ps```.

<details><summary>Ответ:</summary>

```bash
Plan: 1 to add, 0 to change, 1 to destroy.
docker_container.nginx: Destroying... [id=109e68af0ead275f81f0c170a6e03da9873459a07073c367f6b78b26dca33f04]
docker_container.nginx: Destruction complete after 0s
docker_container.nginx: Creating...
docker_container.nginx: Creation complete after 1s [id=79c7191368046d42cd9ad3db0d3403a283a1f2c5420f18656ed4c272ffc55323]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
root@netology:/opt/terraform/hw/ter-homeworks/01/src# docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                                  NAMES
79c719136804   c20060033e06   "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds   0.0.0.0:8000->80/tcp                                   hello_world
```
Применения ключа  ```-auto-approve``` дает пропустить интерактивное утверждение плана перед применением, значит ресурс который мы создали ранее будет удален без вопроса и создан новый
</details>

7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.

<details><summary>Ответ:</summary>

```bash
root@netology:/opt/terraform/hw/ter-homeworks/01/src# terraform destroy
random_password.random_string: Refreshing state... [id=none]
docker_image.nginx: Refreshing state... [id=sha256:c20060033e06f882b0fbe2db7d974d72e0887a3be5e554efdb0dcf8d53512647nginx:latest]
docker_container.nginx: Refreshing state... [id=79c7191368046d42cd9ad3db0d3403a283a1f2c5420f18656ed4c272ffc55323]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.nginx will be destroyed
  - resource "docker_container" "nginx" {
      - attach                                      = false -> null
      - command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> null
      - env                                         = [] -> null
      - group_add                                   = [] -> null
      - hostname                                    = "79c719136804" -> null
      - id                                          = "79c7191368046d42cd9ad3db0d3403a283a1f2c5420f18656ed4c272ffc55323" -> null
      - image                                       = "sha256:c20060033e06f882b0fbe2db7d974d72e0887a3be5e554efdb0dcf8d53512647" -> null
      - init                                        = false -> null
      - ipc_mode                                    = "private" -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "hello_world" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - mac_address               = "02:42:ac:11:00:02"
              - network_name              = "bridge"
            },
        ] -> null
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_signal                                 = "SIGQUIT" -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null

      - ports {
          - external = 8000 -> null
          - internal = 80 -> null
          - ip       = "0.0.0.0" -> null
          - protocol = "tcp" -> null
        }
    }

  # docker_image.nginx will be destroyed
  - resource "docker_image" "nginx" {
      - id           = "sha256:c20060033e06f882b0fbe2db7d974d72e0887a3be5e554efdb0dcf8d53512647nginx:latest" -> null
      - image_id     = "sha256:c20060033e06f882b0fbe2db7d974d72e0887a3be5e554efdb0dcf8d53512647" -> null
      - keep_locally = true -> null
      - name         = "nginx:latest" -> null
      - repo_digest  = "nginx@sha256:86e53c4c16a6a276b204b0fd3a8143d86547c967dc8258b3d47c3a21bb68d3c6" -> null
    }

  # random_password.random_string will be destroyed
  - resource "random_password" "random_string" {
      - bcrypt_hash = (sensitive value) -> null
      - id          = "none" -> null
      - length      = 16 -> null
      - lower       = true -> null
      - min_lower   = 1 -> null
      - min_numeric = 1 -> null
      - min_special = 0 -> null
      - min_upper   = 1 -> null
      - number      = true -> null
      - numeric     = true -> null
      - result      = (sensitive value) -> null
      - special     = false -> null
      - upper       = true -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

docker_container.nginx: Destroying... [id=79c7191368046d42cd9ad3db0d3403a283a1f2c5420f18656ed4c272ffc55323]
random_password.random_string: Destroying... [id=none]
random_password.random_string: Destruction complete after 0s
docker_container.nginx: Destruction complete after 1s
docker_image.nginx: Destroying... [id=sha256:c20060033e06f882b0fbe2db7d974d72e0887a3be5e554efdb0dcf8d53512647nginx:latest]
docker_image.nginx: Destruction complete after 0s

Destroy complete! Resources: 3 destroyed.
```
![](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/da5fb9f5-6fb7-444c-9176-0b713185c0ea)

</details>
   
8. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **обязательно** подкрепите строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image )

<details><summary>Ответ:</summary>
   
```
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
```   
Образ nginx:latest не был удален потому, что в описании ресурса образа есть настройка удержания образа keep_locally = true.

</details>

