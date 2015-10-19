#!/bin/bash
if [[ $(which synclient) ]]; then
    exec synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
fi
