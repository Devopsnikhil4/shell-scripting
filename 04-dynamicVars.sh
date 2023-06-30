#!/bin/bash
Todays_date=30 jun 2023  #hard coding value make it consistant 
TODAYS_DATE=$(date +%F)  #Always enclose expresions in paranthesis
NO_OF_SESSIONS=$(who | wc -l)
echo -e "Good morning and todays date is \e[32m $TODAYS_DATE \e[0m "
echo -e "Number of opened sessions : \e[32m $NO_OF_SESSIONS \e[0m "
