#!/bin/bash

if [ $# != 0 ]
then
    echo -e "\033[31mОшибка. Скрипт не должен принимать параметры\e[0m"
else
    chmod +rx print.sh
    ./print.sh
    echo -e "\e[32mЖелаете записать данные? (Y/N)\e[0m"
    read res
    if [[ $res == Y || $res == y ]]
    then
        name="$(date +"%d_%m_%y_%H_%M_%S").status"
    ./print.sh > $name
    fi
fi
