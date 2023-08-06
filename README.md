# Домашнее задание к занятию «Уязвимости и атаки на информационные системы» - `Rashevchenko Mikhail`

### Задание 1

Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя **nmap**.
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw130101.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw1301011.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw13010111.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw130101111.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw1301011111.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw13010111111.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw130101111111.PNG?raw=true)

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

Ответьте на следующие вопросы:

- Какие сетевые службы в ней разрешены:
  ![](https://github.com/mrashevchenko/gitlab-hw/blob/13-01/img/hw130100.PNG?raw=true)
- Какие уязвимости были вами обнаружены:
  - vsftpd 2.3.4 - Backdoor Command Execution - https://www.exploit-db.com/exploits/49757
  - ProFTPd IAC 1.3.x - Remote Command Execution - https://www.exploit-db.com/exploits/15449
  - TelnetD encrypt_keyid - Function Pointer Overwrite https://www.exploit-db.com/exploits/18280 

### Задание 2

Чем отличаются эти режимы сканирования с точки зрения сетевого трафика:
- SYN-сканирование не открывает полного соединения, а отправляет SYN-пакет. Затем от с удаленного хоста отправляется ответ, открыт порт или нет.
- FIN-сканирование определяет открыт порт или нет по другому. Если посылается FIN-пакет на закрытие соединения то закрытый порт, присылает обратно пакет RST. Открытый — не отвечает. 
- Принцип работы Xmas-сканирования: при отправке пакетов устанавливаются FIN, PSH и URG флаги. Если в ответ придет RST пакет, значит порт закрыт
- При UDP-сканировании доступность порта определяется следующим образом: на интересующий порт целевого хоста отправляется пустой заголовок UDP. И если в ответ придет ICMP-ошибка, значит порт закрыт

Как отвечает сервер?
- При UDP сканировании - ICMP пакетыми с кодом ошибок (порт закрыт) или UDP пакетом (порт открыт). Нет ответа - вероятно, порт открыт
- SYN сканирование - TCP [SYN, ACK] (порт открыт) [RST, ACK], [RST] (порт закрыт) пакеты
- FIN сканирование - TCP [RST, ACK] пакеты (порт закрыт)
- Xmas сканирование - TCP [RST, ACK] пакеты (порт закрыт)
   
