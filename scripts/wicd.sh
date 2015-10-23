#!/bin/sh
# Description: checks if wicd is running

if [ $(which wicd-client) ]; then
    if [ -z $(pgrep wicd-client) ]; then
        wicd-client -t &
    fi
fi
