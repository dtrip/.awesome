#!/bin/bash

if [[ $(which blueman-applet) ]]; then
    if [[ -z $(pgrep blueman-applet) ]]; then
        blueman-applet &
    fi
fi
