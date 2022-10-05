#!/bin/bash

# path to log file
LOGFILE=/home/vagrant/memory_log/memory.log

# email address recipient
EMAIL="ibechuksvictor@gmail.com"

# format date to extract just hour and minute
TIMETOSEND=$(date +%H%M)

# function that creates log file
function logfile() {
	if test -f $LOGFILE; then
		date >> $LOGFILE
		free -h >> $LOGFILE
		echo "--------------------" >> $LOGFILE
	else
		touch $LOGFILE
		date >> $LOGFILE
		free -h >> $LOGFILE
		echo "--------------------" >> $LOGFILE
	fi
}

logfile

if [[ $TIMETOSEND == 0000 ]]; then
	echo "Hello Chuks,
Find attached the memory log for today." | mail -s "Memory Log" -A $LOGFILE $EMAIL
fi
