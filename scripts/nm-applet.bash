#!/bin/bash
# Description: checks if nm-applet is running

PID=$(pidof nm-applet)

if [ -z $PID ]; then
    nm-applet &
fi
