#!/bin/bash

source ./helper.sh

# $@ - array of arguments
check_args $@

count=0
while [ -n "$1" ]; do # [ -n "$1" ] - checking if the string is not empty
    if [ $(( count % 2 )) != 0 ]; then
        color[count]=$(define_f_color $1)
    else
        color[count]=$(define_b_color $1)
    fi
    count=$(( count + 1 ))
    shift # reassigns arguments by shifting them to the left ($2 becomes $1 while $1 desappears, etc)
done

chmod +x output_res.sh
./output_res.sh ${color[*]} $END # ${color[*]} - array of arguments