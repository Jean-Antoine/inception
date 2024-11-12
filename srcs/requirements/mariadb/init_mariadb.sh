#!/bin/bash
service mariadb start
service mariadb status
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_WP_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_WP_NAME}.* TO \`${DB_WP_USER}\`@'%';"
service mariadb stop
exec mysqld_safe --port=3306 --bind-address=0.0.0.0