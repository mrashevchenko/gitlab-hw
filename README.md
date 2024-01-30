# Домашнее задание к занятию 5 «Тестирование roles» - `Rashevchenko Mikhail`

## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.
2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

## Основная часть

Ваша цель — настроить тестирование ваших ролей. 

Задача — сделать сценарии тестирования для vector. 

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s ubuntu_xenial` (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/ca245e20-df5a-4522-9320-4410094b0947)
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/2e143789-6cd0-4e89-9294-896f67915421)

<details><summary>Код всей команды </summary>

```
root@netology:~/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse# molecule test -s centos_7
Failed to load driver entry point Traceback (most recent call last):
  File "/usr/local/lib/python3.9/dist-packages/molecule/api.py", line 45, in drivers
    pm.load_setuptools_entrypoints("molecule.driver")
  File "/usr/local/lib/python3.9/dist-packages/pluggy/manager.py", line 299, in load_setuptools_entrypoints
    plugin = ep.load()
  File "/usr/lib/python3.9/importlib/metadata.py", line 77, in load
    module = import_module(match.group('module'))
  File "/usr/lib/python3.9/importlib/__init__.py", line 127, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1030, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1007, in _find_and_load
  File "<frozen importlib._bootstrap>", line 986, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 680, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 790, in exec_module
  File "<frozen importlib._bootstrap>", line 228, in _call_with_frames_removed
  File "/usr/local/lib/python3.9/dist-packages/molecule_podman/driver.py", line 31, in <module>
    from molecule.api import Driver, MoleculeRuntimeWarning
ImportError: cannot import name 'MoleculeRuntimeWarning' from 'molecule.api' (/usr/local/lib/python3.9/dist-packages/molecule/api.py)

ERROR    Failed to load driver entry point Traceback (most recent call last):
  File "/usr/local/lib/python3.9/dist-packages/molecule/api.py", line 45, in drivers
    pm.load_setuptools_entrypoints("molecule.driver")
  File "/usr/local/lib/python3.9/dist-packages/pluggy/manager.py", line 299, in load_setuptools_entrypoints
    plugin = ep.load()
  File "/usr/lib/python3.9/importlib/metadata.py", line 77, in load
    module = import_module(match.group('module'))
  File "/usr/lib/python3.9/importlib/__init__.py", line 127, in import_module
    return _bootstrap._gcd_import(name, package, level)
  File "<frozen importlib._bootstrap>", line 1030, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1007, in _find_and_load
  File "<frozen importlib._bootstrap>", line 986, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 680, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 790, in exec_module
  File "<frozen importlib._bootstrap>", line 228, in _call_with_frames_removed
  File "/usr/local/lib/python3.9/dist-packages/molecule_podman/driver.py", line 31, in <module>
    from molecule.api import Driver, MoleculeRuntimeWarning
ImportError: cannot import name 'MoleculeRuntimeWarning' from 'molecule.api' (/usr/local/lib/python3.9/dist-packages/molecule/api.py)

INFO     centos_7 scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Guessed /root/mnt-homeworks as project root directory
INFO     Using /root/.cache/ansible-lint/3462b2/roles/alexeysetevoi.clickhouse symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Added ANSIBLE_ROLES_PATH=~/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles:/root/.cache/ansible-lint/3462b2/roles
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > lint
COMMAND: yamllint .
ansible-lint
flake8

WARNING: PATH altered to include /usr/bin
WARNING  Loading custom .yamllint config file, this extends our internal yamllint config.
an AnsibleCollectionFinder has not been installed in this process
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > syntax

playbook: /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'diff': [], 'dest': '/root/.cache/molecule/clickhouse/centos_7/Dockerfile_centos_7', 'src': '/root/.ansible/tmp/ansible-tmp-1706635119.1286633-21633-247585607419737/source', 'md5sum': 'e90d08cd34f49a5f8a41a07de1348618', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'changed': True, 'uid': 0, 'gid': 0, 'owner': 'root', 'group': 'root', 'mode': '0600', 'state': 'file', 'size': 2199, 'invocation': {'module_args': {'src': '/root/.ansible/tmp/ansible-tmp-1706635119.1286633-21633-247585607419737/source', 'dest': '/root/.cache/molecule/clickhouse/centos_7/Dockerfile_centos_7', 'mode': '0600', 'follow': False, '_original_basename': 'Dockerfile.j2', 'checksum': '4b70768619482424811f2977aa277a5acf2b13a1', 'backup': False, 'force': True, 'unsafe_writes': False, 'content': None, 'validate': None, 'directory_mode': None, 'remote_src': None, 'local_follow': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
ok: [localhost] => (item=molecule_local/centos:7)

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j688594233367.21765', 'results_file': '/root/.ansible_async/j688594233367.21765', 'changed': True, 'item': {'capabilities': ['SYS_ADMIN'], 'command': '/usr/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'wheel', 'container': 'docker'}, 'image': 'centos:7', 'name': 'centos_7', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=7    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos_7]

TASK [Apply Clickhouse Role] ***************************************************

TASK [clickhouse : Include OS Family Specific Variables] ***********************
ok: [centos_7]

TASK [clickhouse : include_tasks] **********************************************
included: /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/tasks/precheck.yml for centos_7

TASK [clickhouse : Requirements check | Checking sse4_2 support] ***************
ok: [centos_7]

TASK [clickhouse : Requirements check | Not supported distribution && release] ***
skipping: [centos_7]

TASK [clickhouse : include_tasks] **********************************************
included: /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/tasks/params.yml for centos_7

TASK [clickhouse : Set clickhouse_service_enable] ******************************
ok: [centos_7]

TASK [clickhouse : Set clickhouse_service_ensure] ******************************
ok: [centos_7]

TASK [clickhouse : include_tasks] **********************************************
included: /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/tasks/install/yum.yml for centos_7

TASK [clickhouse : Install by YUM | Ensure clickhouse repo GPG key imported] ***
fatal: [centos_7]: FAILED! => {"changed": false, "msg": "failed to fetch key at https://repo.clickhouse.tech//CLICKHOUSE-KEY.GPG , error was: HTTP Error 530: "}

PLAY RECAP *********************************************************************
centos_7                   : ok=8    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '-D', '--inventory', '/root/.cache/molecule/clickhouse/centos_7/inventory', '--skip-tags', 'molecule-notest,notest', '/root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/hosts.yml linked to /root/.cache/molecule/clickhouse/centos_7/inventory/hosts
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/group_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/group_vars
INFO     Inventory /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/clickhouse/molecule/centos_7/../resources/inventory/host_vars/ linked to /root/.cache/molecule/clickhouse/centos_7/inventory/host_vars
INFO     Running centos_7 > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=centos_7)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=centos_7)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory

```
</details>

2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.
3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/0975be38-bc84-4bb2-9784-ba211dc92751)

4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.).
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/cdde1e12-2a34-4807-8452-58fd8978a82e)

5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/3138e928-db3f-4e37-8a4c-f8a6ed78492d)


<details><summary>Код всей команды </summary>

```
root@netology:~/mnt-homeworks/08-ansible-02-playbook/playbook/roles/vector-role# molecule test
WARNING  Driver docker does not provide a schema.
INFO     default scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=aragast)
changed: [localhost] => (item=centos)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=ubuntu)
ok: [localhost] => (item=aragast)
ok: [localhost] => (item=centos)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/vector-role/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'aragast/netology:latest', 'name': 'aragast', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'centos:7', 'name': 'centos', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'aragast/netology:latest', 'name': 'aragast', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'centos:7', 'name': 'centos', 'pre_build_image': True}) 
skipping: [localhost]

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'aragast/netology:latest', 'name': 'aragast', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'centos:7', 'name': 'centos', 'pre_build_image': True}) 
skipping: [localhost]

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'aragast/netology:latest', 'name': 'aragast', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'centos:7', 'name': 'centos', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 2, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/ubuntu:latest) 
skipping: [localhost] => (item=molecule_local/aragast/netology:latest) 
skipping: [localhost] => (item=molecule_local/centos:7) 
skipping: [localhost]

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'aragast/netology:latest', 'name': 'aragast', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'centos:7', 'name': 'centos', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=aragast)
changed: [localhost] => (item=centos)

TASK [Wait for instance(s) creation to complete] *******************************
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j339745106314.2436', 'results_file': '/root/.ansible_async/j339745106314.2436', 'changed': True, 'item': {'image': 'ubuntu:latest', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j469298603639.2462', 'results_file': '/root/.ansible_async/j469298603639.2462', 'changed': True, 'item': {'image': 'aragast/netology:latest', 'name': 'aragast', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j414630541931.2548', 'results_file': '/root/.ansible_async/j414630541931.2548', 'changed': True, 'item': {'image': 'centos:7', 'name': 'centos', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
fatal: [ubuntu]: FAILED! => {"ansible_facts": {}, "changed": false, "failed_modules": {"ansible.legacy.setup": {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python"}, "failed": true, "module_stderr": "/bin/sh: 1: /usr/bin/python: not found\n", "module_stdout": "", "msg": "The module failed to execute correctly, you probably need to set the interpreter.\nSee stdout/stderr for the exact error", "rc": 127}}, "msg": "The following modules failed to execute: ansible.legacy.setup\n"}
ok: [aragast]
ok: [centos]

TASK [Include vector-role] *****************************************************

PLAY RECAP *********************************************************************
aragast                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
centos                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ansible-playbook --inventory /root/.cache/molecule/vector-role/default/inventory --skip-tags molecule-notest,notest /root/mnt-homeworks/08-ansible-02-playbook/playbook/roles/vector-role/molecule/default/converge.yml
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=aragast)
changed: [localhost] => (item=centos)

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=aragast)
changed: [localhost] => (item=centos)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
root@netology:~/mnt-homeworks/08-ansible-02-playbook/playbook/roles/vector-role#
```
</details>

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/2da92817-0568-484c-9659-8b1e09b0ddad)

5. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.   
   
- [TAG]( https://github.com/mrashevchenko/ansible-vector/releases/tag/1.1.0)   
   

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/33d4c3b7-1a96-4dfc-b2e0-943385fd5ec5)

<details><summary>Код всей команды </summary>

```
[root@632d0afebe20 vector-role]# tox
py37-ansible210 create: /opt/vector-role/.tox/py37-ansible210
py37-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.1.2,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.11.17,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.3.2,click==8.1.7,click-help-colors==0.9.4,cookiecutter==2.5.0,cryptography==42.0.2,distro==1.9.0,enrich==1.2.7,idna==3.6,importlib-metadata==6.7.0,Jinja2==3.1.3,jmespath==1.0.1,lxml==5.1.0,markdown-it-py==2.2.0,MarkupSafe==2.1.4,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==23.2,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.2,PyYAML==6.0.1,requests==2.31.0,rich==13.7.0,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='1331137713'
py37-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py37-ansible30 create: /opt/vector-role/.tox/py37-ansible30
py37-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.1.2,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.11.17,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.3.2,click==8.1.7,click-help-colors==0.9.4,cookiecutter==2.5.0,cryptography==42.0.2,distro==1.9.0,enrich==1.2.7,idna==3.6,importlib-metadata==6.7.0,Jinja2==3.1.3,jmespath==1.0.1,lxml==5.1.0,markdown-it-py==2.2.0,MarkupSafe==2.1.4,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==23.2,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.2,PyYAML==6.0.1,requests==2.31.0,rich==13.7.0,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible30 run-test-pre: PYTHONHASHSEED='1331137713'
py37-ansible30 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible30/bin/molecule test -s compatibility --destroy always (exited with code 1)
py39-ansible210 create: /opt/vector-role/.tox/py39-ansible210
py39-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py39-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==4.1.11,ansible-core==2.15.9,attrs==23.2.0,bracex==2.4,cffi==1.16.0,click==8.1.7,click-help-colors==0.9.4,cryptography==42.0.2,distro==1.9.0,enrich==1.2.7,importlib-resources==5.0.7,Jinja2==3.1.3,jmespath==1.0.1,jsonschema==4.21.1,jsonschema-specifications==2023.12.1,lxml==5.1.0,markdown-it-py==3.0.0,MarkupSafe==2.1.4,mdurl==0.1.2,molecule==6.0.3,molecule-podman==2.0.3,packaging==23.2,pluggy==1.4.0,pycparser==2.21,Pygments==2.17.2,PyYAML==6.0.1,referencing==0.33.0,resolvelib==1.0.1,rich==13.7.0,rpds-py==0.17.1,selinux==0.3.0,subprocess-tee==0.4.1,typing_extensions==4.9.0,wcmatch==8.5
py39-ansible210 run-test-pre: PYTHONHASHSEED='1331137713'
py39-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py39-ansible30 create: /opt/vector-role/.tox/py39-ansible30
py39-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
^CERROR: got KeyboardInterrupt signal
__________________________________________________________ summary __________________________________________________________
ERROR:   py37-ansible210: commands failed
ERROR:   py37-ansible30: commands failed
ERROR:   py39-ansible210: commands failed
ERROR:   py39-ansible30: keyboardinterrupt
```
</details>


4. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
5. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
6. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/8ae6d9d7-9902-40ab-b56b-ba2fca6297f1)


<details><summary>Код всей команды </summary>

```
root@netology:~/mnt-homeworks/08-ansible-02-playbook/playbook/roles/vector-role# docker run --privileged=True -v ~/mnt-homeworks/08-ansible-02-playbook/playbook/roles/vector-role:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash
[root@69af85955fba vector-role]# tox
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.1.2,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.5,certifi==2023.11.17,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.3.2,click==8.1.7,click-help-colors==0.9.4,cookiecutter==2.5.0,cryptography==42.0.2,distro==1.9.0,enrich==1.2.7,idna==3.6,importlib-metadata==6.7.0,Jinja2==3.1.3,jmespath==1.0.1,lxml==5.1.0,markdown-it-py==2.2.0,MarkupSafe==2.1.4,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==23.2,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.8.2,python-slugify==8.0.2,PyYAML==6.0.1,requests==2.31.0,rich==13.7.0,selinux==0.2.1,six==1.16.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='3665450275'
py37-ansible210 run-test: commands[0] | pip3.9 install -r requirements.txt
WARNING: test command found but not installed in testenv
  cmd: /usr/local/bin/pip3.9
  env: /opt/vector-role/.tox/py37-ansible210
Maybe you forgot to specify a dependency? See also the allowlist_externals envconfig setting.

DEPRECATION WARNING: this will be an error in tox 4 and above!
Collecting ansible-compat==4.1.2
  Downloading ansible_compat-4.1.2-py3-none-any.whl (21 kB)
Collecting ansible-core==2.15.1
  Downloading ansible_core-2.15.1-py3-none-any.whl (2.2 MB)
     |████████████████████████████████| 2.2 MB 3.7 MB/s 
Collecting ansible-lint==6.17.2
  Downloading ansible_lint-6.17.2-py3-none-any.whl (279 kB)
     |████████████████████████████████| 279 kB 7.6 MB/s 
Collecting arrow==1.2.3
  Downloading arrow-1.2.3-py3-none-any.whl (66 kB)
     |████████████████████████████████| 66 kB 1.3 MB/s 
Collecting attrs==23.1.0
  Downloading attrs-23.1.0-py3-none-any.whl (61 kB)
     |████████████████████████████████| 61 kB 4.0 MB/s 
Collecting binaryornot==0.4.4
  Downloading binaryornot-0.4.4-py2.py3-none-any.whl (9.0 kB)
Collecting black==23.7.0
  Downloading black-23.7.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.7 MB)
     |████████████████████████████████| 1.7 MB 8.3 MB/s 
Collecting bracex==2.3.post1
  Downloading bracex-2.3.post1-py3-none-any.whl (12 kB)
Collecting certifi==2023.5.7
  Downloading certifi-2023.5.7-py3-none-any.whl (156 kB)
     |████████████████████████████████| 156 kB 7.2 MB/s 
Collecting cffi==1.15.1
  Downloading cffi-1.15.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (441 kB)
     |████████████████████████████████| 441 kB 8.9 MB/s 
Collecting chardet==5.1.0
  Downloading chardet-5.1.0-py3-none-any.whl (199 kB)
     |████████████████████████████████| 199 kB 9.4 MB/s 
Collecting charset-normalizer==3.2.0
  Downloading charset_normalizer-3.2.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (202 kB)
     |████████████████████████████████| 202 kB 4.3 MB/s 
Collecting click==8.1.5
  Downloading click-8.1.5-py3-none-any.whl (98 kB)
     |████████████████████████████████| 98 kB 2.7 MB/s 
Collecting click-help-colors==0.9.1
  Downloading click_help_colors-0.9.1-py3-none-any.whl (5.5 kB)
Collecting cookiecutter==2.2.3
  Downloading cookiecutter-2.2.3-py3-none-any.whl (39 kB)
Collecting cryptography==41.0.2
  Downloading cryptography-41.0.2-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.3 MB)
     |████████████████████████████████| 4.3 MB 4.8 MB/s 
Collecting distro==1.8.0
  Downloading distro-1.8.0-py3-none-any.whl (20 kB)
Collecting docker==6.1.3
  Downloading docker-6.1.3-py3-none-any.whl (148 kB)
     |████████████████████████████████| 148 kB 8.1 MB/s 
Collecting enrich==1.2.7
  Downloading enrich-1.2.7-py3-none-any.whl (8.7 kB)
Collecting filelock==3.12.2
  Downloading filelock-3.12.2-py3-none-any.whl (10 kB)
Collecting idna==3.4
  Downloading idna-3.4-py3-none-any.whl (61 kB)
     |████████████████████████████████| 61 kB 67 kB/s 
Collecting Jinja2==3.1.2
  Downloading Jinja2-3.1.2-py3-none-any.whl (133 kB)
     |████████████████████████████████| 133 kB 15.0 MB/s 
Collecting jsonschema==4.18.3
  Downloading jsonschema-4.18.3-py3-none-any.whl (80 kB)
     |████████████████████████████████| 80 kB 1.8 MB/s 
Collecting jsonschema-specifications==2023.6.1
  Downloading jsonschema_specifications-2023.6.1-py3-none-any.whl (17 kB)
Collecting markdown-it-py==3.0.0
  Downloading markdown_it_py-3.0.0-py3-none-any.whl (87 kB)
     |████████████████████████████████| 87 kB 3.6 MB/s 
Collecting MarkupSafe==2.1.3
  Downloading MarkupSafe-2.1.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Collecting mdurl==0.1.2
  Downloading mdurl-0.1.2-py3-none-any.whl (10.0 kB)
Collecting molecule==5.1.0
  Downloading molecule-5.1.0-py3-none-any.whl (240 kB)
     |████████████████████████████████| 240 kB 5.2 MB/s 
Collecting molecule-plugins==23.4.1
  Downloading molecule_plugins-23.4.1-py3-none-any.whl (67 kB)
     |████████████████████████████████| 67 kB 975 kB/s 
Collecting mypy-extensions==1.0.0
  Downloading mypy_extensions-1.0.0-py3-none-any.whl (4.7 kB)
Collecting packaging==23.1
  Downloading packaging-23.1-py3-none-any.whl (48 kB)
     |████████████████████████████████| 48 kB 2.2 MB/s 
Collecting pathspec==0.11.1
  Downloading pathspec-0.11.1-py3-none-any.whl (29 kB)
Collecting platformdirs==3.9.1
  Downloading platformdirs-3.9.1-py3-none-any.whl (16 kB)
Collecting pluggy==1.2.0
  Downloading pluggy-1.2.0-py3-none-any.whl (17 kB)
Collecting pycparser==2.21
  Downloading pycparser-2.21-py2.py3-none-any.whl (118 kB)
     |████████████████████████████████| 118 kB 9.7 MB/s 
Collecting Pygments==2.15.1
  Downloading Pygments-2.15.1-py3-none-any.whl (1.1 MB)
     |████████████████████████████████| 1.1 MB 2.0 MB/s 
Collecting python-dateutil==2.8.2
  Downloading python_dateutil-2.8.2-py2.py3-none-any.whl (247 kB)
     |████████████████████████████████| 247 kB 5.4 MB/s 
Collecting python-slugify==8.0.1
  Downloading python_slugify-8.0.1-py2.py3-none-any.whl (9.7 kB)
Collecting PyYAML==6.0
  Downloading PyYAML-6.0-cp39-cp39-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_12_x86_64.manylinux2010_x86_64.whl (661 kB)
     |████████████████████████████████| 661 kB 2.8 MB/s 
Collecting referencing==0.29.1
  Downloading referencing-0.29.1-py3-none-any.whl (25 kB)
Collecting requests==2.31.0
  Downloading requests-2.31.0-py3-none-any.whl (62 kB)
     |████████████████████████████████| 62 kB 559 kB/s 
Collecting resolvelib==1.0.1
  Downloading resolvelib-1.0.1-py2.py3-none-any.whl (17 kB)
Collecting rich==13.4.2
  Downloading rich-13.4.2-py3-none-any.whl (239 kB)
     |████████████████████████████████| 239 kB 12.3 MB/s 
Collecting rpds-py==0.8.10
  Downloading rpds_py-0.8.10-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.2 MB)
     |████████████████████████████████| 1.2 MB 6.6 MB/s 
Collecting ruamel.yaml==0.17.32
  Downloading ruamel.yaml-0.17.32-py3-none-any.whl (112 kB)
     |████████████████████████████████| 112 kB 10.2 MB/s 
Collecting ruamel.yaml.clib==0.2.7
  Downloading ruamel.yaml.clib-0.2.7-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl (519 kB)
     |████████████████████████████████| 519 kB 10.0 MB/s 
Collecting selinux==0.3.0
  Downloading selinux-0.3.0-py2.py3-none-any.whl (4.2 kB)
Collecting six==1.16.0
  Using cached six-1.16.0-py2.py3-none-any.whl (11 kB)
Collecting subprocess-tee==0.4.1
  Downloading subprocess_tee-0.4.1-py3-none-any.whl (5.1 kB)
Collecting text-unidecode==1.3
  Downloading text_unidecode-1.3-py2.py3-none-any.whl (78 kB)
     |████████████████████████████████| 78 kB 3.0 MB/s 
Collecting urllib3==2.0.3
  Downloading urllib3-2.0.3-py3-none-any.whl (123 kB)
     |████████████████████████████████| 123 kB 7.8 MB/s 
Collecting wcmatch==8.4.1
  Downloading wcmatch-8.4.1-py3-none-any.whl (39 kB)
Collecting websocket-client==1.6.1
  Downloading websocket_client-1.6.1-py3-none-any.whl (56 kB)
     |████████████████████████████████| 56 kB 1.3 MB/s 
Collecting yamllint==1.32.0
  Downloading yamllint-1.32.0-py3-none-any.whl (65 kB)
     |████████████████████████████████| 65 kB 712 kB/s 
Collecting typing-extensions>=4.5.0; python_version < "3.10"
  Downloading typing_extensions-4.9.0-py3-none-any.whl (32 kB)
Collecting importlib-resources<5.1,>=5.0; python_version < "3.10"
  Downloading importlib_resources-5.0.7-py3-none-any.whl (24 kB)
Collecting tomli>=1.1.0; python_version < "3.11"
  Downloading tomli-2.0.1-py3-none-any.whl (12 kB)
Installing collected packages: rpds-py, attrs, referencing, jsonschema-specifications, jsonschema, PyYAML, subprocess-tee, pycparser, cffi, cryptography, importlib-resources, resolvelib, MarkupSafe, Jinja2, packaging, ansible-core, typing-extensions, ansible-compat, ruamel.yaml.clib, ruamel.yaml, pathspec, yamllint, mdurl, markdown-it-py, Pygments, rich, urllib3, idna, certifi, charset-normalizer, requests, bracex, wcmatch, filelock, mypy-extensions, platformdirs, tomli, click, black, ansible-lint, six, python-dateutil, arrow, chardet, binaryornot, click-help-colors, text-unidecode, python-slugify, cookiecutter, distro, websocket-client, docker, enrich, pluggy, molecule, molecule-plugins, selinux
Successfully installed Jinja2-3.1.2 MarkupSafe-2.1.3 PyYAML-6.0 Pygments-2.15.1 ansible-compat-4.1.2 ansible-core-2.15.1 ansible-lint-6.17.2 arrow-1.2.3 attrs-23.1.0 binaryornot-0.4.4 black-23.7.0 bracex-2.3.post1 certifi-2023.5.7 cffi-1.15.1 chardet-5.1.0 charset-normalizer-3.2.0 click-8.1.5 click-help-colors-0.9.1 cookiecutter-2.2.3 cryptography-41.0.2 distro-1.8.0 docker-6.1.3 enrich-1.2.7 filelock-3.12.2 idna-3.4 importlib-resources-5.0.7 jsonschema-4.18.3 jsonschema-specifications-2023.6.1 markdown-it-py-3.0.0 mdurl-0.1.2 molecule-5.1.0 molecule-plugins-23.4.1 mypy-extensions-1.0.0 packaging-23.1 pathspec-0.11.1 platformdirs-3.9.1 pluggy-1.2.0 pycparser-2.21 python-dateutil-2.8.2 python-slugify-8.0.1 referencing-0.29.1 requests-2.31.0 resolvelib-1.0.1 rich-13.4.2 rpds-py-0.8.10 ruamel.yaml-0.17.32 ruamel.yaml.clib-0.2.7 selinux-0.3.0 six-1.16.0 subprocess-tee-0.4.1 text-unidecode-1.3 tomli-2.0.1 typing-extensions-4.9.0 urllib3-2.0.3 wcmatch-8.4.1 websocket-client-1.6.1 yamllint-1.32.0
WARNING: You are using pip version 20.2.3; however, version 23.3.2 is available.
You should consider upgrading via the '/usr/local/bin/python3.9 -m pip install --upgrade pip' command.
py37-ansible210 run-test: commands[1] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /root/.ansible/roles/vector.vector symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > lint
INFO     Lint is disabled.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/podman/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [Populate instance config dict] *******************************************
skipping: [localhost]

TASK [Convert instance config dict to a list] **********************************
skipping: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=0    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running podman > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running podman > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > idempotence

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running podman > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running podman > verify
INFO     Running Ansible Verifier
WARNING  Skipping, verify playbook not configured.
INFO     Verifier completed successfully.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
py37-ansible30 create: /opt/vector-role/.tox/py37-ansible30
py37-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
ERROR: invocation failed (exit code 1), logfile: /opt/vector-role/.tox/py37-ansible30/log/py37-ansible30-1.log
========================================================= log start =========================================================
Collecting ansible<3.1
  Downloading ansible-3.0.0.tar.gz (30.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 30.8/30.8 MB 6.9 MB/s eta 0:00:00
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Collecting selinux
  Using cached selinux-0.2.1-py2.py3-none-any.whl (4.3 kB)
ERROR: Could not find a version that satisfies the requirement ansible-lint==6.17.2 (from versions: 1.0.0, 1.0.1, 1.0.2, 1.0.3, 1.0.4, 2.0.1, 2.0.3, 2.1.0, 2.1.3, 2.2.0, 2.3.0, 2.3.1, 2.3.2, 2.3.3, 2.3.5, 2.3.6, 2.3.8, 2.3.9, 2.4.0, 2.4.1, 2.4.2, 2.5.0, 2.6.1, 2.6.2, 2.7.0rc1, 2.7.0, 2.7.1, 3.0.0rc1, 3.0.0rc2, 3.0.0rc3, 3.0.0rc4, 3.0.0rc5, 3.0.0rc6, 3.0.0rc7, 3.0.0rc8, 3.0.0rc9, 3.0.0rc10, 3.0.0rc11, 3.0.0rc12, 3.0.0, 3.0.1, 3.0.2rc1, 3.1.0rc1, 3.1.0, 3.1.1, 3.1.2, 3.1.3, 3.2.0, 3.2.1rc1, 3.2.1rc2, 3.2.1, 3.2.2rc1, 3.2.2, 3.2.3, 3.2.4, 3.2.5, 3.3.0rc1, 3.3.0rc2, 3.3.0rc3, 3.3.0rc4, 3.3.0, 3.3.2, 3.3.3, 3.4.0rc1, 3.4.0rc2, 3.4.0, 3.4.1, 3.4.3, 3.4.4, 3.4.5, 3.4.6, 3.4.7, 3.4.8, 3.4.9, 3.4.10, 3.4.11, 3.4.12, 3.4.13, 3.4.15, 3.4.16, 3.4.17, 3.4.18, 3.4.19, 3.4.20, 3.4.21, 3.4.22, 3.4.23, 3.5.0rc1, 3.5.0, 3.5.1, 4.0.0a1, 4.0.0a2, 4.0.0, 4.0.1, 4.1.0a0, 4.1.0, 4.1.1a0, 4.1.1a1, 4.1.1a2, 4.1.1a3, 4.1.1a4, 4.1.1a5, 4.1.1a6, 4.2.0a1, 4.2.0rc1, 4.2.0rc2, 4.2.0, 4.3.0a0, 4.3.0a1, 4.3.0a2, 4.3.0a3, 4.3.0a4, 4.3.0a5, 4.3.0a6, 4.3.0, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.3.5, 4.3.6, 4.3.7, 5.0.0a0, 5.0.0a1, 5.0.0a2.dev12, 5.0.0a3.dev23, 5.0.0a3.dev27, 5.0.0a3, 5.0.0, 5.0.1, 5.0.2, 5.0.3a0, 5.0.3a1, 5.0.3rc1, 5.0.3, 5.0.4, 5.0.5a0, 5.0.5a1, 5.0.5, 5.0.6, 5.0.7, 5.0.8, 5.0.9, 5.0.10, 5.0.11, 5.0.12, 5.1.0a0, 5.1.0a1, 5.1.1, 5.1.2, 5.1.3, 5.2.0, 5.2.1, 5.3.0, 5.3.1, 5.3.2, 5.4.0)
ERROR: No matching distribution found for ansible-lint==6.17.2
WARNING: You are using pip version 22.0.4; however, version 23.3.2 is available.
You should consider upgrading via the '/opt/vector-role/.tox/py37-ansible30/bin/python -m pip install --upgrade pip' command.

========================================================== log end ==========================================================
ERROR: could not install deps [-rtox-requirements.txt, ansible<3.1]; v = InvocationError("/opt/vector-role/.tox/py37-ansible30/bin/python -m pip install -rtox-requirements.txt 'ansible<3.1'", 1)
py39-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==4.1.2,ansible-core==2.15.1,ansible-lint==6.17.2,arrow==1.2.3,attrs==23.1.0,binaryornot==0.4.4,black==23.7.0,bracex==2.3.post1,certifi==2023.5.7,cffi==1.15.1,chardet==5.1.0,charset-normalizer==3.2.0,click==8.1.5,click-help-colors==0.9.1,cookiecutter==2.2.3,cryptography==41.0.2,distro==1.8.0,docker==6.1.3,enrich==1.2.7,filelock==3.12.2,idna==3.4,importlib-resources==5.0.7,Jinja2==3.1.2,jmespath==1.0.1,jsonschema==4.18.3,jsonschema-specifications==2023.6.1,lxml==5.1.0,markdown-it-py==3.0.0,MarkupSafe==2.1.3,mdurl==0.1.2,molecule==5.1.0,molecule-plugins==23.4.1,molecule-podman==2.0.3,mypy-extensions==1.0.0,packaging==23.1,pathspec==0.11.1,platformdirs==3.9.1,pluggy==1.2.0,pycparser==2.21,Pygments==2.15.1,python-dateutil==2.8.2,python-slugify==8.0.1,PyYAML==6.0,referencing==0.29.1,requests==2.31.0,resolvelib==1.0.1,rich==13.4.2,rpds-py==0.8.10,ruamel.yaml==0.17.32,ruamel.yaml.clib==0.2.7,selinux==0.3.0,six==1.16.0,subprocess-tee==0.4.1,text-unidecode==1.3,tomli==2.0.1,typing_extensions==4.9.0,urllib3==2.0.3,wcmatch==8.4.1,websocket-client==1.6.1,yamllint==1.32.0
py39-ansible210 run-test-pre: PYTHONHASHSEED='3665450275'
py39-ansible210 run-test: commands[0] | pip3.9 install -r requirements.txt
Requirement already satisfied: ansible-compat==4.1.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 1)) (4.1.2)
Requirement already satisfied: ansible-core==2.15.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 2)) (2.15.1)
Requirement already satisfied: ansible-lint==6.17.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 3)) (6.17.2)
Requirement already satisfied: arrow==1.2.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 4)) (1.2.3)
Requirement already satisfied: attrs==23.1.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 5)) (23.1.0)
Requirement already satisfied: binaryornot==0.4.4 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 6)) (0.4.4)
Requirement already satisfied: black==23.7.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 7)) (23.7.0)
Requirement already satisfied: bracex==2.3.post1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 8)) (2.3.post1)
Requirement already satisfied: certifi==2023.5.7 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 9)) (2023.5.7)
Requirement already satisfied: cffi==1.15.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 10)) (1.15.1)
Requirement already satisfied: chardet==5.1.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 11)) (5.1.0)
Requirement already satisfied: charset-normalizer==3.2.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 12)) (3.2.0)
Requirement already satisfied: click==8.1.5 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 13)) (8.1.5)
Requirement already satisfied: click-help-colors==0.9.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 14)) (0.9.1)
Requirement already satisfied: cookiecutter==2.2.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 15)) (2.2.3)
Requirement already satisfied: cryptography==41.0.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 16)) (41.0.2)
Requirement already satisfied: distro==1.8.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 17)) (1.8.0)
Requirement already satisfied: docker==6.1.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 18)) (6.1.3)
Requirement already satisfied: enrich==1.2.7 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 19)) (1.2.7)
Requirement already satisfied: filelock==3.12.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 20)) (3.12.2)
Requirement already satisfied: idna==3.4 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 21)) (3.4)
Requirement already satisfied: Jinja2==3.1.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 22)) (3.1.2)
Requirement already satisfied: jsonschema==4.18.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 23)) (4.18.3)
Requirement already satisfied: jsonschema-specifications==2023.6.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 24)) (2023.6.1)
Requirement already satisfied: markdown-it-py==3.0.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 25)) (3.0.0)
Requirement already satisfied: MarkupSafe==2.1.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 26)) (2.1.3)
Requirement already satisfied: mdurl==0.1.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 27)) (0.1.2)
Requirement already satisfied: molecule==5.1.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 28)) (5.1.0)
Requirement already satisfied: molecule-plugins==23.4.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 29)) (23.4.1)
Requirement already satisfied: mypy-extensions==1.0.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 30)) (1.0.0)
Requirement already satisfied: packaging==23.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 31)) (23.1)
Requirement already satisfied: pathspec==0.11.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 32)) (0.11.1)
Requirement already satisfied: platformdirs==3.9.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 33)) (3.9.1)
Requirement already satisfied: pluggy==1.2.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 34)) (1.2.0)
Requirement already satisfied: pycparser==2.21 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 35)) (2.21)
Requirement already satisfied: Pygments==2.15.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 36)) (2.15.1)
Requirement already satisfied: python-dateutil==2.8.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 37)) (2.8.2)
Requirement already satisfied: python-slugify==8.0.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 38)) (8.0.1)
Requirement already satisfied: PyYAML==6.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 39)) (6.0)
Requirement already satisfied: referencing==0.29.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 40)) (0.29.1)
Requirement already satisfied: requests==2.31.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 41)) (2.31.0)
Requirement already satisfied: resolvelib==1.0.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 42)) (1.0.1)
Requirement already satisfied: rich==13.4.2 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 43)) (13.4.2)
Requirement already satisfied: rpds-py==0.8.10 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 44)) (0.8.10)
Requirement already satisfied: ruamel.yaml==0.17.32 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 45)) (0.17.32)
Requirement already satisfied: ruamel.yaml.clib==0.2.7 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 46)) (0.2.7)
Requirement already satisfied: selinux==0.3.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 47)) (0.3.0)
Requirement already satisfied: six==1.16.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 48)) (1.16.0)
Requirement already satisfied: subprocess-tee==0.4.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 49)) (0.4.1)
Requirement already satisfied: text-unidecode==1.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 50)) (1.3)
Requirement already satisfied: urllib3==2.0.3 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 51)) (2.0.3)
Requirement already satisfied: wcmatch==8.4.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 52)) (8.4.1)
Requirement already satisfied: websocket-client==1.6.1 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 53)) (1.6.1)
Requirement already satisfied: yamllint==1.32.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from -r requirements.txt (line 54)) (1.32.0)
Requirement already satisfied: typing-extensions>=4.5.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from ansible-compat==4.1.2->-r requirements.txt (line 1)) (4.9.0)
Requirement already satisfied: importlib-resources<5.1,>=5.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from ansible-core==2.15.1->-r requirements.txt (line 2)) (5.0.7)
Requirement already satisfied: tomli>=1.1.0 in ./.tox/py39-ansible210/lib/python3.9/site-packages (from black==23.7.0->-r requirements.txt (line 7)) (2.0.1)
WARNING: You are using pip version 22.0.4; however, version 23.3.2 is available.
You should consider upgrading via the '/opt/vector-role/.tox/py39-ansible210/bin/python -m pip install --upgrade pip' command.
py39-ansible210 run-test: commands[1] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/f5bcd7/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/f5bcd7/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/f5bcd7/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /root/.cache/ansible-compat/f5bcd7/roles/vector.vector symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/podman/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [Populate instance config dict] *******************************************
skipping: [localhost]

TASK [Convert instance config dict to a list] **********************************
skipping: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=0    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running podman > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running podman > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > idempotence

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running podman > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running podman > verify
INFO     Running Ansible Verifier
WARNING  Skipping, verify action has no playbook.
INFO     Verifier completed successfully.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
py39-ansible30 create: /opt/vector-role/.tox/py39-ansible30
py39-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
py39-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==4.1.11,ansible-core==2.15.9,ansible-lint==6.17.2,arrow==1.3.0,attrs==23.2.0,binaryornot==0.4.4,black==24.1.1,bracex==2.4,certifi==2023.11.17,cffi==1.16.0,chardet==5.2.0,charset-normalizer==3.3.2,click==8.1.7,click-help-colors==0.9.4,cookiecutter==2.5.0,cryptography==42.0.2,distro==1.9.0,enrich==1.2.7,filelock==3.13.1,idna==3.6,importlib-resources==5.0.7,Jinja2==3.1.3,jmespath==1.0.1,jsonschema==4.21.1,jsonschema-specifications==2023.12.1,lxml==5.1.0,markdown-it-py==3.0.0,MarkupSafe==2.1.4,mdurl==0.1.2,molecule==5.1.0,molecule-podman==2.0.3,mypy-extensions==1.0.0,packaging==23.2,pathspec==0.12.1,platformdirs==4.1.0,pluggy==1.4.0,pycparser==2.21,Pygments==2.17.2,python-dateutil==2.8.2,python-slugify==8.0.2,PyYAML==6.0.1,referencing==0.33.0,requests==2.31.0,resolvelib==1.0.1,rich==13.7.0,rpds-py==0.17.1,ruamel.yaml==0.17.40,ruamel.yaml.clib==0.2.8,selinux==0.3.0,six==1.16.0,subprocess-tee==0.4.1,text-unidecode==1.3,tomli==2.0.1,types-python-dateutil==2.8.19.20240106,typing_extensions==4.9.0,urllib3==2.2.0,wcmatch==8.5,yamllint==1.32.0
py39-ansible30 run-test-pre: PYTHONHASHSEED='3665450275'
py39-ansible30 run-test: commands[0] | pip3.9 install -r requirements.txt
Collecting ansible-compat==4.1.2
  Using cached ansible_compat-4.1.2-py3-none-any.whl (21 kB)
Collecting ansible-core==2.15.1
  Using cached ansible_core-2.15.1-py3-none-any.whl (2.2 MB)
Requirement already satisfied: ansible-lint==6.17.2 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 3)) (6.17.2)
Collecting arrow==1.2.3
  Using cached arrow-1.2.3-py3-none-any.whl (66 kB)
Collecting attrs==23.1.0
  Using cached attrs-23.1.0-py3-none-any.whl (61 kB)
Requirement already satisfied: binaryornot==0.4.4 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 6)) (0.4.4)
Collecting black==23.7.0
  Using cached black-23.7.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.7 MB)
Collecting bracex==2.3.post1
  Using cached bracex-2.3.post1-py3-none-any.whl (12 kB)
Collecting certifi==2023.5.7
  Using cached certifi-2023.5.7-py3-none-any.whl (156 kB)
Collecting cffi==1.15.1
  Using cached cffi-1.15.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (441 kB)
Collecting chardet==5.1.0
  Using cached chardet-5.1.0-py3-none-any.whl (199 kB)
Collecting charset-normalizer==3.2.0
  Using cached charset_normalizer-3.2.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (202 kB)
Collecting click==8.1.5
  Using cached click-8.1.5-py3-none-any.whl (98 kB)
Collecting click-help-colors==0.9.1
  Using cached click_help_colors-0.9.1-py3-none-any.whl (5.5 kB)
Collecting cookiecutter==2.2.3
  Using cached cookiecutter-2.2.3-py3-none-any.whl (39 kB)
Collecting cryptography==41.0.2
  Downloading cryptography-41.0.2-cp37-abi3-manylinux_2_28_x86_64.whl (4.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.3/4.3 MB 7.6 MB/s eta 0:00:00
Collecting distro==1.8.0
  Using cached distro-1.8.0-py3-none-any.whl (20 kB)
Collecting docker==6.1.3
  Using cached docker-6.1.3-py3-none-any.whl (148 kB)
Requirement already satisfied: enrich==1.2.7 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 19)) (1.2.7)
Collecting filelock==3.12.2
  Using cached filelock-3.12.2-py3-none-any.whl (10 kB)
Collecting idna==3.4
  Using cached idna-3.4-py3-none-any.whl (61 kB)
Collecting Jinja2==3.1.2
  Using cached Jinja2-3.1.2-py3-none-any.whl (133 kB)
Collecting jsonschema==4.18.3
  Using cached jsonschema-4.18.3-py3-none-any.whl (80 kB)
Collecting jsonschema-specifications==2023.6.1
  Using cached jsonschema_specifications-2023.6.1-py3-none-any.whl (17 kB)
Requirement already satisfied: markdown-it-py==3.0.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 25)) (3.0.0)
Collecting MarkupSafe==2.1.3
  Using cached MarkupSafe-2.1.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Requirement already satisfied: mdurl==0.1.2 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 27)) (0.1.2)
Requirement already satisfied: molecule==5.1.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 28)) (5.1.0)
Collecting molecule-plugins==23.4.1
  Using cached molecule_plugins-23.4.1-py3-none-any.whl (67 kB)
Requirement already satisfied: mypy-extensions==1.0.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 30)) (1.0.0)
Collecting packaging==23.1
  Using cached packaging-23.1-py3-none-any.whl (48 kB)
Collecting pathspec==0.11.1
  Using cached pathspec-0.11.1-py3-none-any.whl (29 kB)
Collecting platformdirs==3.9.1
  Using cached platformdirs-3.9.1-py3-none-any.whl (16 kB)
Collecting pluggy==1.2.0
  Using cached pluggy-1.2.0-py3-none-any.whl (17 kB)
Requirement already satisfied: pycparser==2.21 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 35)) (2.21)
Collecting Pygments==2.15.1
  Using cached Pygments-2.15.1-py3-none-any.whl (1.1 MB)
Requirement already satisfied: python-dateutil==2.8.2 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 37)) (2.8.2)
Collecting python-slugify==8.0.1
  Using cached python_slugify-8.0.1-py2.py3-none-any.whl (9.7 kB)
Collecting PyYAML==6.0
  Using cached PyYAML-6.0-cp39-cp39-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_12_x86_64.manylinux2010_x86_64.whl (661 kB)
Collecting referencing==0.29.1
  Using cached referencing-0.29.1-py3-none-any.whl (25 kB)
Requirement already satisfied: requests==2.31.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 41)) (2.31.0)
Requirement already satisfied: resolvelib==1.0.1 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 42)) (1.0.1)
Collecting rich==13.4.2
  Using cached rich-13.4.2-py3-none-any.whl (239 kB)
Collecting rpds-py==0.8.10
  Using cached rpds_py-0.8.10-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.2 MB)
Collecting ruamel.yaml==0.17.32
  Using cached ruamel.yaml-0.17.32-py3-none-any.whl (112 kB)
Collecting ruamel.yaml.clib==0.2.7
  Using cached ruamel.yaml.clib-0.2.7-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux_2_24_x86_64.whl (519 kB)
Requirement already satisfied: selinux==0.3.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 47)) (0.3.0)
Requirement already satisfied: six==1.16.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 48)) (1.16.0)
Requirement already satisfied: subprocess-tee==0.4.1 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 49)) (0.4.1)
Requirement already satisfied: text-unidecode==1.3 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 50)) (1.3)
Collecting urllib3==2.0.3
  Using cached urllib3-2.0.3-py3-none-any.whl (123 kB)
Collecting wcmatch==8.4.1
  Using cached wcmatch-8.4.1-py3-none-any.whl (39 kB)
Collecting websocket-client==1.6.1
  Using cached websocket_client-1.6.1-py3-none-any.whl (56 kB)
Requirement already satisfied: yamllint==1.32.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from -r requirements.txt (line 54)) (1.32.0)
Requirement already satisfied: typing-extensions>=4.5.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from ansible-compat==4.1.2->-r requirements.txt (line 1)) (4.9.0)
Requirement already satisfied: importlib-resources<5.1,>=5.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from ansible-core==2.15.1->-r requirements.txt (line 2)) (5.0.7)
Requirement already satisfied: tomli>=1.1.0 in ./.tox/py39-ansible30/lib/python3.9/site-packages (from black==23.7.0->-r requirements.txt (line 7)) (2.0.1)
Installing collected packages: websocket-client, urllib3, ruamel.yaml.clib, rpds-py, PyYAML, python-slugify, Pygments, pluggy, platformdirs, pathspec, packaging, MarkupSafe, idna, filelock, distro, click, charset-normalizer, chardet, cffi, certifi, bracex, attrs, wcmatch, ruamel.yaml, rich, referencing, Jinja2, cryptography, click-help-colors, black, arrow, jsonschema-specifications, docker, cookiecutter, ansible-core, jsonschema, ansible-compat, molecule-plugins
  Attempting uninstall: urllib3
    Found existing installation: urllib3 2.2.0
    Uninstalling urllib3-2.2.0:
      Successfully uninstalled urllib3-2.2.0
  Attempting uninstall: ruamel.yaml.clib
    Found existing installation: ruamel.yaml.clib 0.2.8
    Uninstalling ruamel.yaml.clib-0.2.8:
      Successfully uninstalled ruamel.yaml.clib-0.2.8
  Attempting uninstall: rpds-py
    Found existing installation: rpds-py 0.17.1
    Uninstalling rpds-py-0.17.1:
      Successfully uninstalled rpds-py-0.17.1
  Attempting uninstall: PyYAML
    Found existing installation: PyYAML 6.0.1
    Uninstalling PyYAML-6.0.1:
      Successfully uninstalled PyYAML-6.0.1
  Attempting uninstall: python-slugify
    Found existing installation: python-slugify 8.0.2
    Uninstalling python-slugify-8.0.2:
      Successfully uninstalled python-slugify-8.0.2
  Attempting uninstall: Pygments
    Found existing installation: Pygments 2.17.2
    Uninstalling Pygments-2.17.2:
      Successfully uninstalled Pygments-2.17.2
  Attempting uninstall: pluggy
    Found existing installation: pluggy 1.4.0
    Uninstalling pluggy-1.4.0:
      Successfully uninstalled pluggy-1.4.0
  Attempting uninstall: platformdirs
    Found existing installation: platformdirs 4.1.0
    Uninstalling platformdirs-4.1.0:
      Successfully uninstalled platformdirs-4.1.0
  Attempting uninstall: pathspec
    Found existing installation: pathspec 0.12.1
    Uninstalling pathspec-0.12.1:
      Successfully uninstalled pathspec-0.12.1
  Attempting uninstall: packaging
    Found existing installation: packaging 23.2
    Uninstalling packaging-23.2:
      Successfully uninstalled packaging-23.2
  Attempting uninstall: MarkupSafe
    Found existing installation: MarkupSafe 2.1.4
    Uninstalling MarkupSafe-2.1.4:
      Successfully uninstalled MarkupSafe-2.1.4
  Attempting uninstall: idna
    Found existing installation: idna 3.6
    Uninstalling idna-3.6:
      Successfully uninstalled idna-3.6
  Attempting uninstall: filelock
    Found existing installation: filelock 3.13.1
    Uninstalling filelock-3.13.1:
      Successfully uninstalled filelock-3.13.1
  Attempting uninstall: distro
    Found existing installation: distro 1.9.0
    Uninstalling distro-1.9.0:
      Successfully uninstalled distro-1.9.0
  Attempting uninstall: click
    Found existing installation: click 8.1.7
    Uninstalling click-8.1.7:
      Successfully uninstalled click-8.1.7
  Attempting uninstall: charset-normalizer
    Found existing installation: charset-normalizer 3.3.2
    Uninstalling charset-normalizer-3.3.2:
      Successfully uninstalled charset-normalizer-3.3.2
  Attempting uninstall: chardet
    Found existing installation: chardet 5.2.0
    Uninstalling chardet-5.2.0:
      Successfully uninstalled chardet-5.2.0
  Attempting uninstall: cffi
    Found existing installation: cffi 1.16.0
    Uninstalling cffi-1.16.0:
      Successfully uninstalled cffi-1.16.0
  Attempting uninstall: certifi
    Found existing installation: certifi 2023.11.17
    Uninstalling certifi-2023.11.17:
      Successfully uninstalled certifi-2023.11.17
  Attempting uninstall: bracex
    Found existing installation: bracex 2.4
    Uninstalling bracex-2.4:
      Successfully uninstalled bracex-2.4
  Attempting uninstall: attrs
    Found existing installation: attrs 23.2.0
    Uninstalling attrs-23.2.0:
      Successfully uninstalled attrs-23.2.0
  Attempting uninstall: wcmatch
    Found existing installation: wcmatch 8.5
    Uninstalling wcmatch-8.5:
      Successfully uninstalled wcmatch-8.5
  Attempting uninstall: ruamel.yaml
    Found existing installation: ruamel.yaml 0.17.40
    Uninstalling ruamel.yaml-0.17.40:
      Successfully uninstalled ruamel.yaml-0.17.40
  Attempting uninstall: rich
    Found existing installation: rich 13.7.0
    Uninstalling rich-13.7.0:
      Successfully uninstalled rich-13.7.0
  Attempting uninstall: referencing
    Found existing installation: referencing 0.33.0
    Uninstalling referencing-0.33.0:
      Successfully uninstalled referencing-0.33.0
  Attempting uninstall: Jinja2
    Found existing installation: Jinja2 3.1.3
    Uninstalling Jinja2-3.1.3:
      Successfully uninstalled Jinja2-3.1.3
  Attempting uninstall: cryptography
    Found existing installation: cryptography 42.0.2
    Uninstalling cryptography-42.0.2:
      Successfully uninstalled cryptography-42.0.2
  Attempting uninstall: click-help-colors
    Found existing installation: click-help-colors 0.9.4
    Uninstalling click-help-colors-0.9.4:
      Successfully uninstalled click-help-colors-0.9.4
  Attempting uninstall: black
    Found existing installation: black 24.1.1
    Uninstalling black-24.1.1:
      Successfully uninstalled black-24.1.1
  Attempting uninstall: arrow
    Found existing installation: arrow 1.3.0
    Uninstalling arrow-1.3.0:
      Successfully uninstalled arrow-1.3.0
  Attempting uninstall: jsonschema-specifications
    Found existing installation: jsonschema-specifications 2023.12.1
    Uninstalling jsonschema-specifications-2023.12.1:
      Successfully uninstalled jsonschema-specifications-2023.12.1
  Attempting uninstall: cookiecutter
    Found existing installation: cookiecutter 2.5.0
    Uninstalling cookiecutter-2.5.0:
      Successfully uninstalled cookiecutter-2.5.0
  Attempting uninstall: ansible-core
    Found existing installation: ansible-core 2.15.9
    Uninstalling ansible-core-2.15.9:
      Successfully uninstalled ansible-core-2.15.9
  Attempting uninstall: jsonschema
    Found existing installation: jsonschema 4.21.1
    Uninstalling jsonschema-4.21.1:
      Successfully uninstalled jsonschema-4.21.1
  Attempting uninstall: ansible-compat
    Found existing installation: ansible-compat 4.1.11
    Uninstalling ansible-compat-4.1.11:
      Successfully uninstalled ansible-compat-4.1.11
Successfully installed Jinja2-3.1.2 MarkupSafe-2.1.3 PyYAML-6.0 Pygments-2.15.1 ansible-compat-4.1.2 ansible-core-2.15.1 arrow-1.2.3 attrs-23.1.0 black-23.7.0 bracex-2.3.post1 certifi-2023.5.7 cffi-1.15.1 chardet-5.1.0 charset-normalizer-3.2.0 click-8.1.5 click-help-colors-0.9.1 cookiecutter-2.2.3 cryptography-41.0.2 distro-1.8.0 docker-6.1.3 filelock-3.12.2 idna-3.4 jsonschema-4.18.3 jsonschema-specifications-2023.6.1 molecule-plugins-23.4.1 packaging-23.1 pathspec-0.11.1 platformdirs-3.9.1 pluggy-1.2.0 python-slugify-8.0.1 referencing-0.29.1 rich-13.4.2 rpds-py-0.8.10 ruamel.yaml-0.17.32 ruamel.yaml.clib-0.2.7 urllib3-2.0.3 wcmatch-8.4.1 websocket-client-1.6.1
WARNING: You are using pip version 22.0.4; however, version 23.3.2 is available.
You should consider upgrading via the '/opt/vector-role/.tox/py39-ansible30/bin/python -m pip install --upgrade pip' command.
py39-ansible30 run-test: commands[1] | molecule test -s podman --destroy always
INFO     podman scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/f5bcd7/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/f5bcd7/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/f5bcd7/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /root/.cache/ansible-compat/f5bcd7/roles/vector.vector symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running podman > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running podman > syntax

playbook: /opt/vector-role/molecule/podman/converge.yml
INFO     Running podman > create

PLAY [Create] ******************************************************************

TASK [Populate instance config dict] *******************************************
skipping: [localhost]

TASK [Convert instance config dict to a list] **********************************
skipping: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=0    changed=0    unreachable=0    failed=0    skipped=3    rescued=0    ignored=0

INFO     Running podman > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running podman > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running podman > idempotence

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
ok: [instance] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
instance                   : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running podman > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running podman > verify
INFO     Running Ansible Verifier
WARNING  Skipping, verify action has no playbook.
INFO     Verifier completed successfully.
INFO     Running podman > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running podman > destroy

PLAY [Destroy] *****************************************************************

TASK [Populate instance config] ************************************************
ok: [localhost]

TASK [Dump instance config] ****************************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
__________________________________________________________ summary __________________________________________________________
  py37-ansible210: commands succeeded
ERROR:   py37-ansible30: could not install deps [-rtox-requirements.txt, ansible<3.1]; v = InvocationError("/opt/vector-role/.tox/py37-ansible30/bin/python -m pip install -rtox-requirements.txt 'ansible<3.1'", 1)
  py39-ansible210: commands succeeded
  py39-ansible30: commands succeeded
```
</details>

![image](https://github.com/mrashevchenko/gitlab-hw/assets/100411467/fd679c29-ebb5-4385-810d-b574dce0bf07)


7. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

- [TAG](https://github.com/mrashevchenko/ansible-vector/releases/tag/1.2.0)   

- [REPO](https://github.com/mrashevchenko/ansible-vector)   


После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания. 

## Необязательная часть

1. Проделайте схожие манипуляции для создания роли LightHouse.
2. Создайте сценарий внутри любой из своих ролей, который умеет поднимать весь стек при помощи всех ролей.
3. Убедитесь в работоспособности своего стека. Создайте отдельный verify.yml, который будет проверять работоспособность интеграции всех инструментов между ними.
4. Выложите свои roles в репозитории.

В качестве решения пришлите ссылки и скриншоты этапов выполнения задания.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.
