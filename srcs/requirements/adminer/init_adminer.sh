#!/bin/bash
cd /var/www/adminer/
wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
mv adminer-4.8.1.php adminer.php

mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F