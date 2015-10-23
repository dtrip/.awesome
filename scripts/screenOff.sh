#!/bin/sh

LOCK="/tmp/.screenOff.lock"

# if lock file is present or backlight is 0 - will turn monitor on
if [ -w $LOCK  ] || [ -z $(xfpm-power-backlight-helper --get-brightness) ]; then
    #power screen back on

    # clears lock file
    rm -rf $LOCK

    # turns on monitor
    # xset dpms force on;
    # xbacklight -set 40%

else
    #screen was off - enable

    # creates lock file
    touch $LOCK

    # xset dpms force off
fi
