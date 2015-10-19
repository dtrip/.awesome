#!/bin/bash
# checks if lightlocker is an executable
if [[ $(which light-locker) ]]; then
    # if no PID is present (not running), executes program
    if [[ -z $(pidof light-locker) ]]; then
        light-locker > /dev/null &
    fi
fi
