#!bin/bash

sample() {
    echo "I am a sample function with name sample"
    echo "I am executing the sample function"
    echo "Sample function is completed"
}

sample

sample() {
    echo "My name is Nikhil kumar"
    echo "My name is Bharath kumar"
    echo "My name is Nithya"
    echo "My name is Dharvik"
}

ACTION=$1 

if [ "$ACTION" == "start" ] ; then 
        echo -e "\e[32m Starting RabbitMQ Service \e[0m"
        exit 0  
        

sample