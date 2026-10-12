#!/bin/bash

source ./helper.sh
source ./$CONFIG

is_empty_input $@

param[0]=$column1_background
param[1]=$column1_font_color
param[2]=$column2_background
param[3]=$column2_font_color

# ${!param[*]} - array of indexes (0 1 2 3)
# [-z ${param[$i]} ] - checking if the string is empty
for i in ${!param[*]}; do
    if [ -z ${param[$i]} ]; then
        param[$i]=$(set_default_color $i)
        default[$i]=1 # 1 means that the color is default
    else
        default[$i]=0
    fi
done

check_args ${param[*]}

# ${!param[*]} - array of indexes (0 1 2 3)
for i in ${!param[*]}; do
    if [ $(( i % 2 )) != 0 ]; then
        color[i]=$(define_f_color ${param[i]})
    else
        color[i]=$(define_b_color ${param[i]})
    fi
done

chmod +x output_res.sh
./output_res.sh ${color[*]} $END # ${color[*]} - array of arguments

echo ""
echo "Column 1 background = $( print_num ${default[0]} ${param[0]} ) ($( print_color ${param[0]} ))"
echo "Column 1 font color = $( print_num ${default[1]} ${param[1]} ) ($( print_color ${param[1]} ))"
echo "Column 2 background = $( print_num ${default[2]} ${param[2]} ) ($( print_color ${param[2]} ))"
echo "Column 2 font color = $( print_num ${default[3]} ${param[3]} ) ($( print_color ${param[3]} ))"