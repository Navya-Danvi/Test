#!/bin/bash

PACKNAME=$1

Instpack()
{
  if [ "$(rpm -qa | grep $PACKNAME)" != "" ] ; then 
     echo "$PACKNAMAE Already exists in machine"
  else
     sudo yum -y install $PACKNAME 
     echo "$PACKNAME installed successfully"
  fi
}

if [ ! "$PACKNAME" ] ; then
   echo "Enter Package Name to verify"
   exit
fi

Instpack

#To check whether the service is up 
if [ "$(sudo netstat -ntpl | grep $PACKNAME)" == "" ] ; then
   sudo systemctl start $PACKNAME.service
   echo "$PACKNAME service started"
else
   echo "Server is already running"
fi

PACKNAME=php
Instpack

#set timezone in php.ini file
#if [ -f "/etc/php.ini" ] ; then
 # sed -i 's#;date.timezone=#date.timezone=Asia/Kolkata#' /etc/php.ini
 #  sed -i 's#Mango#App/Mango#' fruitbasket
 # echo "word replaced"
#else
 # echo "File not Found"
#fi

if [ "$(awk '/Kolkata/{print}' /etc/php.ini)" == "" ] ; then
 sed -i 's#;date.timezone=#date.timezone=Asia/kolkata#g'  /etc/php.ini 
 echo "Asia/Kolkatta - set Timezone"
else
echo "Asia/kolkata already exists"
fi
 

#to create index.html in /var/www/html
if [ -f "/var/www/html/index.html" ] ; then
   echo "File exists no need to create"
else
  cd /var/www/html
  sudo touch index.html
  echo "index.html created successfully"
fi

