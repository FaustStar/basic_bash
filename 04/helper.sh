#!/bin/bash

CONFIG="color.conf"

function is_empty_input {
    if [ $# -ne 0 ]; then
        echo "No need to pass arguments to the script"
        exit 1
    fi
}

COLUMN_1=1
COLUMN_2=2

# $@ - array of arguments passed to the function ($1 $2 $3 ...)
function check_args {
    for i in $@; do
        if [[ $i != [1-6] ]]; then
            echo "Arguments must be numbers from 1 to 6"
            exit 1
        fi
    done

    if [ $1 == $2 ]; then
        print_error $COLUMN_1
        exit 1
    elif [ $3 == $4 ]; then
        print_error $COLUMN_2
        exit 1
    fi
}

function print_error {
    echo -e "Arguments column$1_background and column$1_font_color must be different.\n\
The possible reasons of this error are:\n\
\t1) you set them to the same value;\n\
\t2) you set only one of them and the value is the same as default value of another one.\n\
-------------------------------------------------------------------------------------------------\n\
Below is default values:\n\
\tcolumn1_background=$DEFAULT_BACKGROUND_1\n\
\tcolumn1_font_color=$DEFAULT_FONT_1\n\
\tcolumn2_background=$DEFAULT_BACKGROUND_2\n\
\tcolumn2_font_color=$DEFAULT_FONT_2\n\
-------------------------------------------------------------------------------------------------\n\
Check $CONFIG file and run the script again"
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

# (1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black)
DEFAULT_BACKGROUND_1=6
DEFAULT_FONT_1=1
DEFAULT_BACKGROUND_2=2
DEFAULT_FONT_2=4

function set_default_color {
    case $1 in
        0) echo $DEFAULT_BACKGROUND_1 ;;
        1) echo $DEFAULT_FONT_1 ;;
        2) echo $DEFAULT_BACKGROUND_2 ;;
        3) echo $DEFAULT_FONT_2 ;;
    esac
}

function print_num {
    if [ $1 -eq 1 ]; then
        echo "default"
    else
        echo $2
    fi
}

function print_color {
    case $1 in
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        6) echo "black" ;;
    esac
}