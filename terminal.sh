#!/bin/bash

# Add the following to .zshrc or .bashrc
# Open new terminal in same directory as last terminal:
# function cd {
#     builtin cd $@
#
#     # Store the directory in file for later use along with the PID.
#     pid=$$
#     file=/tmp/$USER.last.dir
#     touch $file
#     grep -q "$pid-" $file && sed -i "s:^$pid-.*:$pid-$(pwd):" $file || echo "$pid-$(pwd)" >> $file
# }


ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PARENT_PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3) + 0))
PID=$(pgrep -P $PARENT_PID | sort -n | head -1)

set -o pipefail
file=/tmp/$USER.last.dir
dir=$(grep "$PID-" $file | sed -e 's/[0-9][0-9]*-//g' | head -1)

if [ $? -ne 0  ]; then
    dir=$(pwdx $PID | sed -e "s/^$PID: //")
    if [ $? -ne 0 ]; then
       dir=$HOME
    fi
fi

konsole --workdir $dir &
dir=
