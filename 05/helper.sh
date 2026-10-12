#!/bin/bash

function check_args {
    if [ $# -ne 1 ]; then
        echo "The wrong number of arguments passed to the script (one argument is expected)"
        exit 1
    fi

    # -d file — Checks if file exists and is a directory.
    if ! [ -d $1 ]; then
        echo "The directory does not exist"
        exit 1
    fi

    # . means any one symbol; * means that previous character is optional (repeated zero or more times)
    # ! [[ ... =~ regexp ]] - value is not equal to regular expression
    if ! [[ $1 =~ .*\/$ ]]; then
        echo "The path must end with /"
        exit 1
    fi
}