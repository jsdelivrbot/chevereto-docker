#!/bin/bash

# This script can help you create the database and the user for the Chevereto application.
# It assumes your mysql instance is running in a docker container.
# Just change the parameters below and run the script on your docker host.

# Parameters to change:

MYSQL_ADMIN_USER=root
MYSQL_ADMIN_PASS=password
MYSQL_DOCKER_NAME=mysql
MYSQL_PORT=3306
CHEVERETO_DATABASE_NAME=chevereto
CHEVERETO_DATABASE_USER=chevereto
CHEVERETO_DATABASE_PASS=chevereto

# End parameters

docker run -it --link $MYSQL_DOCKER_NAME:mysql_chevereto --rm mysql sh -c "exec mysql -h'mysql_chevereto' -P'$MYSQL_PORT' -u$MYSQL_ADMIN_USER -p'$MYSQL_ADMIN_PASS' -e 'create database IF NOT EXISTS $CHEVERETO_DATABASE_NAME; GRANT ALL PRIVILEGES ON $CHEVERETO_DATABASE_NAME.* To \"$CHEVERETO_DATABASE_USER\" IDENTIFIED BY \"$CHEVERETO_DATABASE_PASS\";'"
