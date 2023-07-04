#!bin/bash

COMPONENT=frontend
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

echo -e "****** \e[35m $COMPONENT installation is Started \e[0m******"

echo -n "Installing Nginx :"
yum install nginx -y &>> LOGFILE
stat $?

echo -n "Downloading the ${COMPONENT} component :"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "performing cleanup: "
cd /usr/share/nginx/html
rm -rf *  &>> LOGFILE
stat $?

echo -n "Extracting ${COMPONENT} component :"
unzip /tmp/${COMPONENT}.zip &>> LOGFILE
mv ${COMPONENT}-main/* .
mv static/* . &>> LOGFILE
rm -rf ${COMPONENT}-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

echo -n "Updating the Backend ${COMPONENT} reverseproxy details :"
for component in catalogue ; do
    sed -i -e "/$component/s/localhost/$component.roboshop.internal" /etc/nginx/default.d/roboshop.conf
done
stat $?

echo -n "Starting ${COMPONENT} service: "
systemctl daemon-reload &>> LOGFILE
systemctl enable nginx &>> LOGFILE
systemctl restart nginx &>> LOGFILE
stat $?

echo -e "****** \e[35m $COMPONENT installation is completed \e[0m******"
