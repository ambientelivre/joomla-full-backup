#!/bin/bash
#
# joomlafullbackup
#
# version 1.0
#
# Copyright (C) 2011 Ambiente Livre
# Marcio Junior Vieira - < marcio <%> ambientelivre.com.br > 
#
# All rights reserved.
# License: GNU/GPL License v2 or later.
# RemoveMessageOpenFire is free software. This version may have been modified pursuant
# to the GNU General Public License, and as distributed it includes or
# is derivative of works licensed under the GNU General Public License or
# other free or open source software licenses.
# http://www.ambientelivre.com.br
#
# Help and Support in http://www.ambientelivre.com.br

#*********************************************************************#
# Variables to Config JoomlaFullBackup, alter for your data
DIRBACKUP=/home/marcio/teste
DIRJOOMLA=/var/www/ambientelivre
MYSQLUSER=root
MYSQLHOST=localhost
MYSQLPASSWORD=123456
MYSQLDATABASE=cdf
#*********************************************************************#


# Script Backup 

DATE=`date +%Y-%m-%d-%H.%M`

# create the sql backup
mysqldump --host=$MYSQLHOST --user=$MYSQLUSER --password=$MYSQLPASSWORD --databases $MYSQLDATABASE > $DIRBACKUP/base_$MYSQLDATABASE-$DATE.sql

# compact the data
tar -zcvf $DIRBACKUP/backupfulljoomla-"$DATE".tar.gz $DIRJOOMLA $DIRBACKUP/base_$MYSQLDATABASE-$DATE.sql

# remove the sql backup file
rm $DIRBACKUP/base_$MYSQLDATABASE-$DATE.sql
