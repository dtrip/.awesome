#!/bin/bash

if [[ $(which indicator-sound-switcher) ]]; then
    if [[ -z $(pgrep indicator-sound) ]]; then
        indicator-sound-switcher &
    fi
fi
