#!/bin/bash

if [[ $(which solaar) ]]; then
    if [[ -z $(pgrep solaar) ]]; then
        solaar &
    fi
fi
