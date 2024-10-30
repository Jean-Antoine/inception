#!/bin/bash
DB_PWD=$(cat $DB_PWD_FILE)
until mysql --host=mariadb \
				--user=${DB_USER} \
				--password=${DB_PWD} \
				-e "USE wp;" ;
do
	echo "Waiting for MariaDB"
done

#cf https://make.wordpress.org/cli/handbook/how-to/how-to-install/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod -R 755 /var/www/wordpress/
cd /var/www/wordpress
wp core download --allow-root
wp config create	--dbname=${DB_NAME} \
					--dbuser=${DB_USER} \
					--dbpass=${DB_PWD} \
					--dbhost=mariadb:3306 \
					--allow-root
wp core install	--url=${DOMAIN_NAME} \
				--title="INCEPTION" \
				--admin_user=${WP_ADMIN_NAME} \
				--admin_password=${WP_ADMIN_PWD} \
				--admin_email=${WP_ADMIN_MAIL} \
				--allow-root
wp user create	${WP_USER_NAME} \
				${WP_USER_MAIL} \
				--role=${WP_USER_ROLE} \
				--user_pass=${WP_USER_PWD} \
				--allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp plugin install redis-cache --allow-root
wp plugin activate redis-cache --allow-root
wp redis enable --allow-root

mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F