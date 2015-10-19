#!/bin/bash

if [[ $(which x11-touchscreen-calibrator) ]]; then
    if [[ -z $(pidof x11-touchscreen-calibrator) ]]; then
        x11-touchscreen-calibrator -d;
    fi
fi
