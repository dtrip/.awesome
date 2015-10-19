#!/bin/bash
# Description: checks if nm-applet is running

if [[ $(which nm-applet) ]]; then
    if [[ -z $(pidof nm-applet) ]]; then
        nm-applet &
    fi
fi
