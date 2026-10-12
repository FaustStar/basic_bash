#!/bin/bash

if [ $# -ne 0 ]; then
    echo "No need to pass arguments to the script"
else
    chmod +x output_res.sh
    ./output_res.sh
fi