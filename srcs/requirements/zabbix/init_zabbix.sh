#!/bin/bash
source /run/secrets/pwd
envsubst < /usr/local/etc/zabbix_server.conf > /home/zabbix_server.conf
cat /home/zabbix_server.conf
zabbix_agentd -c /etc/zabbix/zabbix_agentd.conf
mkdir -p /run/zabbix
chmod 777 /run/zabbix -R
# zabbix_server -c /home/zabbix_server.conf -f
tail -f /dev/null