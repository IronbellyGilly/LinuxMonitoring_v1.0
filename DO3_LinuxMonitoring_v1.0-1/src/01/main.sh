#!/bin/bash

re='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# = 0 ]; then
    echo -e "\033[31mНет переданных параметров\e[0m"
elif [ $# != 1 ]; then
    echo -e "\033[31mДолжно приниматься не более одного параметра\e[0m"
elif [[ $1 =~ $re ]]; then
    echo -e "\033[31mДолжен приниматься только текстовoй параметр\e[0m"
else
    echo $1
fi
