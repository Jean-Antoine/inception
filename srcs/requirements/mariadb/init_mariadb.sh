#!/bin/bash
source /run/secrets/pwd
service mariadb start
service mariadb status
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_WP_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_WP_NAME}.* TO \`${DB_WP_USER}\`@'%';"
mariadb -e "create database ${DB_ZABBIX_NAME} character set utf8mb4 collate utf8mb4_bin;"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_ZABBIX_USER}'@'%' IDENTIFIED BY '${DB_ZABBIX_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_ZABBIX_NAME}.* TO \`${DB_ZABBIX_USER}\`@'%';"
service mariadb stop
exec mysqld_safe --port=3306 --bind-address=0.0.0.0