#!/bin/bash

#Special variables gives special properties to your variables

#Here are few of the special variables : $0 to $9 , $? ,$# , $* $@

echo $0 # $0 prints the script name your executing
echo "Name of the script executed is $0"
echo "Name of the trainer is $1"
echo "Training Batch Number is $2"
echo "current Topics is $3"

# we can supply the vaules from the command line

#bash scriptName.sh 100 200 300 (Like this you can supply  a maximum of 9 variables from the command line)
#                     $1  $2  $3