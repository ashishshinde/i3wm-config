#!/bin/bash

ifconfig | grep "192\."

if [ $? -eq 0 ]; then
    echo "network connected"
    exit 0
fi

nohup nmcli device wifi connect Ashish password $(cat $HOME/.wifi) >/dev/null 2>&1 &
