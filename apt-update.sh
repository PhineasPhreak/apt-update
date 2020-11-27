#!/bin/bash
#
# XARGS :
# xargs reads items from the standard input, delimited by blanks
# (which can be protected with double or single quotes or a backslash) or newlines,
# and executes the command (default is /bin/echo) one or more times with any initial-arguments
# followed by items read from standard input
#

file_pkg="packages_kali.lst"

CAT=$(command -v cat)
XARGS=$(command -v xargs)
SUDO=$(command -v sudo)

if [ -f $file_pkg ]; then
    if [ -z "$CAT" ] || [ -z "$XARGS" ] || [ -z "$SUDO" ]; then
        echo -e "\nRequired tools are missing\n"
        exit 1;
    else
        sudo apt-get update
        cat $file_pkg | xargs sudo apt-get install --only-upgrade -y
    fi
else
    echo -e "\nFile $file_pkg not found in this current directory\n"
fi

