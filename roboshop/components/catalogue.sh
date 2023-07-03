#!bin/bash

COMPONENT=mongodb
LOGFILE="/tmp/${COMPONENT}.log"

ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilage \e[0m"
    exit 1
fi

stat() {
if [ $1 -eq 0 ] ; then
    echo -e "\e[32m success \e[0m"
else
    echo -e "\e[31m failure \e[0m"
    exit 2
fi
}

echo -e "Installing Nodejs : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
yum install nodejs -y   &>> LOGFILE
stat $?
