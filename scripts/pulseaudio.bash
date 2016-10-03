#!/bin/bash

if [[ $(which pulseaudio) ]]; then
    if [[ -z $(pgrep pulseaudio) ]]; then
        pulseaudio -D --start &
    fi
fi
