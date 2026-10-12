#!/bin/bash

echo "HOSTNAME = $(hostname)" | tee -a temp.txt # -a: append to the given FILEs, do not overwrite
echo "TIMEZONE = $(cat /etc/timezone) $(date +"UTC %-:::z")" | tee -a temp.txt
echo "USER = $(whoami)" | tee -a temp.txt
echo "OS = $(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)" | tee -a temp.txt # -d is delimiter, -f is field
echo "DATE = $(date +"%d %B %Y %X")" | tee -a temp.txt
echo "UPTIME = $(uptime -p | sed 's/up //')" | tee -a temp.txt # s is substitute (s/pattern1/pattern2/)
echo "UPTIME_SEC = $(cut -f 1 -d "." /proc/uptime)" | tee -a temp.txt
echo "IP = $(ip a | grep "inet " | grep -v " lo" | awk '{print $2}' | cut -d "/" -f 1)" | tee -a temp.txt
echo "MASK = $(ifconfig | grep "inet " | awk '{if (FNR == 1) print $4}')" | tee -a temp.txt # FNR is number of current record
echo "GATEWAY = $(ip route | grep default | awk '{print $3}')" | tee -a temp.txt
echo "RAM_TOTAL = $(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')" | tee -a temp.txt # -m means mebi (power of 1024)
echo "RAM_USED = $(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')" | tee -a temp.txt
echo "RAM_FREE = $(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')" | tee -a temp.txt
echo "SPACE_ROOT = $(df -k / | grep -v "Filesystem" | awk '{printf "%.2f MB", $2/1024}')" | tee -a temp.txt # -k is like --block-size=1K (kibi, power of 1024)
echo "SPACE_ROOT_USED = $(df -k / | grep -v "Filesystem" | awk '{printf "%.2f MB", $3/1024}')" | tee -a temp.txt
echo "SPACE_ROOT_FREE = $(df -k / | grep -v "Filesystem" | awk '{printf "%.2f MB", $4/1024}')" | tee -a temp.txt

chmod +x save_to_file.sh
./save_to_file.sh

rm temp.txt