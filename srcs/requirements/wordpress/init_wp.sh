#!/bin/bash
#https://make.wordpress.org/cli/handbook/how-to/how-to-install/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod -R 755 /var/www/wordpress/
cd /var/www/wordpress
wp core download --allow-root
wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PWD} --dbhost=mariadb:3306 --allow-root
wp core install --url=${DOMAIN_NAME} --title="INCEPTION" --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_MAIL} --allow-root
wp user create ${WP_USER_NAME} ${WP_USER_MAIL} --role=${WP_USER_ROLE} --user_pass=${WP_USER_PWD} --allow-root

