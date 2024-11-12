#!/bin/bash
service mariadb start
service mariadb status
until mariadb -e "USE mysql;" ;
do
	echo "Waiting for MariaDB"
	echo $DB_WP_USER
	echo $DB_WP_PWD
done
echo "> CREATE DB/USER FOR WORDPRESS IF NEEDED"
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_WP_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_WP_USER}'@'%' IDENTIFIED BY '${DB_WP_PWD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_WP_NAME}.* TO \`${DB_WP_USER}\`@'%';"
echo "< CREATE DB/USER FOR WORDPRESS IF NEEDED"
echo "> STOPPING DB TO USE MYSQLD_SAFE"
service mariadb stop
echo "< STOPPING DB TO USE MYSQLD_SAFE"
exec mysqld_safe --port=3306 --bind-address=0.0.0.0