#!bin/bash

COMPONENT=mongodb
LOGFILE="/tmp/${COMPONENT}.log"
APPUSER="roboshop"

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

echo -e "****** \e[35m $COMPONENT installation is Started \e[0m******"

echo -n "Configuring the $COMPONENT repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> LOGFILE
stat $?

echo -n "Instatalling Nodejs : "
yum install nodejs -y &>> LOGFILE
stat $?

id $APPUSER
if [ $? -ne 0 ] ; then
    echo -n "Creating the Service Account:"
    useradd $APPUSER
    stat $?
fi

