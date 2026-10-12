#!/bin/bash

. ./helper.sh # . is alternative to "source"

check_args $@

#-------------------------------------------------------------------------------------------------
# find (search for files in a directory hierarchy):
# * (means not to include $1 directory itself)
# -type d (print only directories)
#-------------------------------------------------------------------------------------------------
# wc (print newline, word, and byte counts for each file):
# - l (print the newline counts)
echo "Total number of folders (including all nested ones) = $(sudo find $1* -type d | wc -l)"

#-------------------------------------------------------------------------------------------------
# du (estimate file space usage):
# --si (output in units in power of 1000 (kilo, mega, giga, tera, peta, etc))
#-------------------------------------------------------------------------------------------------
# sort (sort lines of text files):
# -h (compare human readable numbers (e.g., 2K 1G))
# -r (reverse the result of comparisons)
echo "TOP 5 folders of maximum size arranged in descending order (path and size):
$(sudo du --si $1 | sort -hr | head -n 6 | tail -n 5 | awk '{print FNR " - " $2 "/, " $1}' | \
sed 's/k$/ KB/; s/M$/ MB/; s/G$/ GB/; s/T$/ TB/; s/P$/ PB/; s/E$/ EB/; s/Z$/ ZB/; s/Y$/ YB/')" 

#-------------------------------------------------------------------------------------------------
# -type f,l (print only files and symbolic links)
# -name pattern (base of file name (the path with the leading directories removed) matches shell pattern)
# -o (means logical OR)
echo "Total number of files = $(sudo find $1* -type f,l | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(sudo find $1* -type f -name "*.conf" | wc -l)"
echo "Text files = $(sudo find $1* -type f -name "*.txt" | wc -l)"
echo "Executable files = $(sudo find $1* -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(sudo find $1* -type f -name "*.log" | wc -l)"
echo "Archive files = $(sudo find $1* -type f -name "*.zip" -o -name "*.rar" -o -name "*.gz" -o -name "*.tar" -o -name "*.7z" | wc -l)"
echo "Symbolic links = $(sudo find /var/log/* -type l | wc -l)"

#-------------------------------------------------------------------------------------------------
# -exec command {} ; (execute command)
# {} (The string `{}' is replaced by the current file name being processed)
# ; (end of command; might need to be escaped (with a `\'))
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):
$(sudo find $1* -type f,l -exec du --si {} \; | sort -hr | head -n 10 | awk '{print FNR " - " $2 ", " $1}' | \
sed 's/k$/ KB/; s/M$/ MB/; s/G$/ GB/; s/T$/ TB/; s/P$/ PB/; s/E$/ EB/; s/Z$/ ZB/; s/Y$/ YB/' | \
awk '{print $0 ", "; system()}')"

# $(du -a --si $1 | sort -hr | head -n 11 | awk '{print FNR " - " $2 ", " $1 " " $3}')
# TOP 10 files of maximum size arranged in descending order (path, size and type):  
# 1 - /var/log/one/one.exe, 10 GB, exe  
# 2 - /var/log/two/two.log, 10 MB, log  
# etc up to 10
