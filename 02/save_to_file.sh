#!/bin/bash

read -p "Do you want to save the result in a file? (Y/N): " # -p is prompt

if [[ $REPLY = "Y" || $REPLY = "y" ]]; then
    cp temp.txt $(date +"%d_%m_%y_%H_%M_%S").status
fi