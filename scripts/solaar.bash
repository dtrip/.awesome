#!/bin/bash

if [[ $(which solaar) ]]; then
    if [[ -z $(pgrep solaar) ]]; then
        solaar -w hide &
    fi
fi
