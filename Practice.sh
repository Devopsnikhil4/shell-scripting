#!bin/bash

echo -e "Line1\t\Line2"
echo -e "Line3\nLine4"

echo -e "\e[45;32m I love you  \e[0m"
Nikhil=Nithya
echo -e "\e[33m $Nikhil  \e[0m"

TODAY_DATE=$(date +%F)
echo -e "\e[35m $TODAY_DATE \e[0m"


echo "Name of the Trainer is $1"
echo "Training Batch Number is $2"
echo "Current Topics is $3"
echo $#
read -p "Enter you are name :"name
echo -e "Name of the entered value is $name"