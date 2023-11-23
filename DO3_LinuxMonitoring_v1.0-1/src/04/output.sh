#!/bin/bash

function print()
{
        echo -e $1$2HOSTNAME $NC=$NC$3$4 $(hostname)$NC
        echo -e $1$2TIMEZONE $NC=$NC$3$4 $(timedatectl | grep 'Time zone:' | sed 's/Time zone: //')$NC
        echo -e $1$2USER $NC=$NC$3$4 $(whoami)$NC
        echo -e $1$2OS $NC=$NC$3$4 $(hostnamectl | grep 'Operating System:' | sed 's/Operating System: //')$NC
        echo -e $1$2DATE $NC=$NC$3$4 $(date +"%d %b %Y %T")$NC
        echo -e $1$2UPTIME $NC=$NC$3$4 $(uptime -p)$NC
        echo -e $1$2UPTIME_SEC $NC=$NC$3$4 $(awk '{print $1}' /proc/uptime)$NC
        echo -e $1$2IP $NC=$NC$3$4 $(ip a | grep inet | sed 's/\/../ /' | sed -n '1'p | awk '{print $2}')$NC
        echo -e $1$2MASK $NC=$NC$3$4 $(ifconfig lo | grep netmask | awk '{print $4}')$NC
        echo -e $1$2GATEWAY $NC=$NC$3$4 $(ip route | grep 'default via' | awk '{print $3}')$NC
        echo -e $1$2RAM_TOTAL $NC=$NC$3$4 $(free -h | awk '/Mem:/{printf "%.3f GB", $2 / 1024}')$NC
        echo -e $1$2RAM_USED $NC=$NC$3$4 $(free -h | awk '/Mem:/{printf "%.3f GB", $3 / 1024}')$NC
        echo -e $1$2RAM_FREE $NC=$NC$3$4 $(free -h | awk '/Mem:/{printf "%.3f GB", $4 / 1024}')$NC
        echo -e $1$2SPACE_ROOT $NC=$NC$3$4 $(df -BK | grep '/$' | awk '{printf "%.2f MB", $2/1024}')$NC
        echo -e $1$2SPACE_ROOT_USED $NC=$NC$3$4 $(df -BK | grep '/$' | awk '{printf "%.2f MB", $3/1024}')$NC
        echo -e $1$2SPACE_ROOT_FREE $NC=$NC$3$4 $(df -BK | grep '/$' | awk '{printf "%.2f MB", $4/1024}')$NC
}

function info()
{
        echo ;
        echo "Column 1 background = $1 ($2)"
        echo "Column 1 font color = $3 ($4)"
        echo "Column 2 background = $5 ($6)"
        echo "Column 2 font color = $7 ($8)"
}

