# Домашнее задание к занятию «Система мониторинга Zabbix» - `Rashevchenko Mikhail`

### Задание 1

![](https://github.com/mrashevchenko/gitlab-hw/blob/hw92/img/hw92logsrv.PNG?raw=true)
 
sudo apt install postgresql  
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb  
dpkg -i zabbix-release_6.0-4+debian11_all.deb  
sudo apt update  
sudo apt install zabbix-agent  
sudo apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts nano -y #zabbix-agent  
sudo systemctl restart zabbix-agent  
sudo systemctl enable zabbix-agent  
sudo -u postgres createuser --pwprompt zabbix  
sudo -u postgres createdb -O zabbix zabbix  
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix  
sudo nano /etc/zabbix/zabbix_server.conf #пароль  
sudo systemctl restart zabbix-server apache2 # zabbix-agent  
sudo systemctl enable zabbix-server apache2 # zabbix-agent  

### Задание 2
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw92/img/hw9221PNG.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw92/img/hw9222PNG.PNG?raw=true)
![](https://github.com/mrashevchenko/gitlab-hw/blob/hw92/img/hw9223PNG.PNG?raw=true)

wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb  
dpkg -i zabbix-release_6.0-4+debian11_all.deb  
sudo apt update  
sudo apt install zabbix-agent      
systemctl restart zabbix-agent    
systemctl enable zabbix-agent  
cd /etc/zabbix/  
nano zabbix_agentd.conf - правка сервера  
cd /var/log/zabbix/  
tail -f zabbix_agentd.log  
