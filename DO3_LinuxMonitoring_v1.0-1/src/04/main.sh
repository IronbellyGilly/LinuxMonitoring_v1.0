#!/bin/bash

chmod +rx output.sh colors.sh colors.conf default.conf

source output.sh
source colors.sh
source colors.conf
source default.conf

default_color[0]=$default_background1
default_color[1]=$default_font_color1
default_color[2]=$default_background2
default_color[3]=$default_font_color2

colors[0]=$column1_background
colors[1]=$column1_font_color
colors[2]=$column2_background
colors[3]=$column2_font_color

for ((i=0; i<=3; i++))
do
        if [[ ${colors[$i]} =~ ^[1-6]$ ]]
        then
                color_names[$i]=${colors[$i]}
        else
                colors[$i]=${default_color[$i]}
                color_names[$i]="default"
        fi
done

if [[ ${colors[1]} == ${colors[0]} ]]
then
        colors[1]=${default_color[1]}
        color_names[1]="default"
        if [[ ${colors[1]} == ${colors[0]} ]]
        then
                colors[1]=${default_color[0]}
        fi
fi

if [[ ${colors[3]} == ${colors[2]} ]]
then
        colors[3]=${default_color[3]}
        color_names[3]="default"
        if [[ ${colors[3]} == ${colors[2]} ]]
        then
                colors[3]=${def_colors[2]}
        fi
fi

print "${front_colors[colors[1] - 1]}" "${back_colors[colors[0] - 1]}" "${front_colors[colors[3] - 1]}" "${back_colors[colors[2]-1]}"
info "${color_names[0]}" "${ncolors[colors[0] - 1]}" "${color_names[1]}" "${ncolors[colors[1] - 1]}" "${color_names[2]}" "${ncolors[colors[2] - 1]}" "${color_names[3]}" "${ncolors[colors[3] - 1]}"
