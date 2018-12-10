#!/bin/bash

appdir=/var/www/html
index=$appdir/index.php
apache=/usr/local/bin/apache2-foreground

if [ ! -f $index ]; then
    echo Downloading Chevereto installer
    wget --quiet --output-document=$index https://cdn.jsdelivr.net/gh/Chevereto/php-repo-installer@master/index.php
    if [ $? -ne 0 ]; then
        echo Could not downolad installer... failing
        exit 1
    fi
    chown www-data:www-data $index
fi

echo "Starting Apache2 ($apache)"
$apache
