#!/bin/bash

PID=$(pgrep solaar)

if [ -z $PID ]; then
    sudo solaar &
fi
