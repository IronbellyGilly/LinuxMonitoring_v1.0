#!/bin/bash

chmod +rx output.sh colors.sh

source colors.sh
source output.sh

if [[ $# != 4 ]]
then
        echo -e "\e[1;31mНужно подавать 4 числовых параметра. Повторите еще раз\e[0m"
        exit
else
        param="^[1-6]"
        for num in $@
        do
                if [[ $num -lt 1 ]] || [[ $num -gt 6 ]];
                then echo -e "\033[31mПараметры должны иметь значения от 1 до 6. Повторите еще раз\e[0m"
                exit
                fi
        done
        if ! [[ $1 =~ $param && $2 =~ $param && $3 =~ $param && $4 =~ $param ]];
        then
                echo -e "\033[31mПараметры должны иметь значения от 1 до 6. Повторите еще раз\e[0m"
                exit
        else
                if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
                echo -e "\033[31mЦвета шрифта и фонa не должны совпадать. Повторите еще раз\e[0m"
                exit
                fi
        fi
fi

print "${front_colors[$2-1]}" "${back_colors[$1-1]}" "${front_colors[$4-1]}" "${back_colors[$3-1]}"
