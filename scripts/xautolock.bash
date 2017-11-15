#!/bin/bash

if [[ $(which xautolock) ]]; then
    if [[ -z $(pidof xautolock) ]]; then
        xautolock -locker lock -secure
    fi
fi
