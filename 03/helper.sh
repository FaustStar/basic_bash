#!/bin/bash

# $@ - array of arguments passed to the function ($1 $2 $3 ...)
function check_args {
    if [ $# -ne 4 ]; then
        echo "The wrong number of arguments passed to the script (four arguments are expected)"
        exit 1
    fi

    for i in $@; do
        if [[ $i != [1-6] ]]; then
            echo "Arguments must be numbers from 1 to 6"
            exit 1
        fi
    done

    if [ $1 == $2 ]; then
        echo "Arguments 1 and 2 must be different. Run the script again"
        exit 1
    elif [ $3 == $4 ]; then
        echo "Arguments 3 and 4 must be different. Run the script again"
        exit 1
    fi
}

# foreground
f_WHITE="\033[97m"
f_RED="\033[91m"
f_GREEN="\033[92m"
f_BLUE="\033[94m"
f_PURPLE="\033[95m"
f_BLACK="\033[30m"

# background
b_WHITE="\033[107m"
b_RED="\033[101m"
b_GREEN="\033[102m"
b_BLUE="\033[104m"
b_PURPLE="\033[105m"
b_BLACK="\033[40m"

# system default color
END="\033[0m"

# (1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black)
function define_f_color {
    case $1 in
        1) echo $f_WHITE ;;
        2) echo $f_RED ;;
        3) echo $f_GREEN ;;
        4) echo $f_BLUE ;;
        5) echo $f_PURPLE ;;
        6) echo $f_BLACK ;;
    esac
}

function define_b_color {
    case $1 in
        1) echo $b_WHITE ;;
        2) echo $b_RED ;;
        3) echo $b_GREEN ;;
        4) echo $b_BLUE ;;
        5) echo $b_PURPLE ;;
        6) echo $b_BLACK ;;
    esac
}