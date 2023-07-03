#!bin/bash

COMPONENT=frontend

ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilage \e[0m"
    exit 1
fi

stat() {
if [ $1 -eq 0 ] ; then
    echo -e "\e[32m success \e[0m"
else
    echo - "\e[32m failure \e[0m"
    exit 2
fi
}

echo -n "Installing Nginx :"
yum install nginx -y &>> "/tmp/${COMPONENT}.log"
stat $?

echo -n "Downloading the ${COMPONENT} component :"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "performing cleanup: "
cd /usr/share/nginx/html
rm -rf *  &>> "/tmp/{COMPONENT}.log"
stat $?

# The frontend is the service in RobotShop to serve the web content over Nginx.

# Install Nginx.


# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx



# Let's download the HTDOCS content and deploy it under the Nginx path.


# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"



# Deploy in Nginx Default Location.


# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf



# - Finally, restart the service once to effect the changes.
# - Now, you should be able to access the ROBOSHOP e-commerce webpage as shown below