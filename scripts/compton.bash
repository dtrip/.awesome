#!/bin/bash
#
# Description: Starts compton should it not be running

if [[ $(which compton) ]]; then
    if [[ -z $(pidof compton) ]]; then
        compton -b > /dev/null &
    fi
fi
