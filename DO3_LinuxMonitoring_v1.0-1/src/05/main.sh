#!/bin/bash

timer_run=$(date +%s)
chmod +rx output.sh

if [ $# != 1 ];then
echo -e "\033[31mМожет подаваться только один параметр\e[0m"
elif ! [ -d $1 ]; then
echo -e "\033[31mКаталог не существует\e[0m"
elif [ ${1: -1} != "/" ]; then
    echo -e "\033[31mПараметр должен заканчиваться символом '/'\e[0m"
else
    ./output.sh $1
    timer_end=$(date +%s)
    echo "Script execution time (in seconds) = $(($timer_end-$timer_run))"
fi


