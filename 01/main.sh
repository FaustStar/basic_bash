#!/bin/bash

# --------------------------------------------------------------------------------------
# $# is the number of arguments passed to the script
# --------------------------------------------------------------------------------------
# Equal Tilde (=~) operator allows the use of the regular expressions in an if statement
# [[ ... ]] is used for Regular Expression Matching
# --------------------------------------------------------------------------------------
# Regular expression:
# ^ is the start of the string, $ is the end of the string
# + means that previous character is repeated one or more times
# ? means that previous character is optional (repeated zero or one time)
# [] means any one of the characters inside the brackets
# - inside brackets means a range
# () means grouping
# --------------------------------------------------------------------------------------
if [ $# -ne 1 ]; then
    echo "The wrong number of arguments passed to the script (one argument is expected)"
elif [[ $1 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
    echo "A number as an argument is not allowed"
else
    echo $1
fi