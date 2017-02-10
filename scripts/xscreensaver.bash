#!/bin/bash

if [[ $(which xscreensaver) ]]; then
    if [[ -z $(pidof xscreensaver) ]]; then
        xscreensaver -no-splash &
    fi
fi
