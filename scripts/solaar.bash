#!/bin/bash

if [[ $(which solaar) ]]; then
    if [[ -z $(pgrep solaar) ]]; then
        sudo solaar &
    fi
fi
