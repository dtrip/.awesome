#!/bin/bash
#
# Description: Starts picom should it not be running

if [[ $(which picom) ]]; then
    if [[ -z $(pidof picom) ]]; then
        picom -b > /dev/null &
    fi
fi
