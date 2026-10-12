#!/bin/bash

echo -e "$2$1HOSTNAME$5 = $4$3$(hostname)$5"
echo -e "$2$1TIMEZONE$5 = $4$3$(cat /etc/timezone) $(date +"UTC %-:::z")$5"
echo -e "$2$1USER$5 = $4$3$(whoami)$5"
echo -e "$2$1OS$5 = $4$3$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)$5" # -d is delimiter, -f is field
echo -e "$2$1DATE$5 = $4$3$(date +"%d %B %Y %X")$5"
echo -e "$2$1UPTIME$5 = $4$3$(uptime -p | sed 's/up //')$5" # s is substitute (s/pattern1/pattern2/)
echo -e "$2$1UPTIME_SEC$5 = $4$3$(cut -f 1 -d "." /proc/uptime)$5"
echo -e "$2$1IP$5 = $4$3$(ip a | grep "inet " | grep -v " lo" | awk '{print $2}' | cut -d "/" -f 1)$5"
echo -e "$2$1MASK$5 = $4$3$(ifconfig | grep "inet " | awk '{if (FNR == 1) print $4}')$5" # FNR is number of current record
echo -e "$2$1GATEWAY$5 = $4$3$(ip route | grep default | awk '{print $3}')$5"
echo -e "$2$1RAM_TOTAL$5 = $4$3$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')$5" # -m means mebi (power of 1024)
echo -e "$2$1RAM_USED$5 = $4$3$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')$5"
echo -e "$2$1RAM_FREE$5 = $4$3$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')$5"
echo -e "$2$1SPACE_ROOT$5 = $4$3$(df -k / | grep -v "Filesystem" | awk '{printf "%.2f MB", $2/1024}')$5" # -k is like --block-size=1K (kibi, power of 1024)
echo -e "$2$1SPACE_ROOT_USED$5 = $4$3$(df -k / | grep -v "Filesystem" | awk '{printf "%.2f MB", $3/1024}')$5"
echo -e "$2$1SPACE_ROOT_FREE$5 = $4$3$(df -k / | grep -v "Filesystem" | awk '{printf "%.2f MB", $4/1024}')$5"