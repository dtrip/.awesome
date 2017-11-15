#!/bin/bash

# Turn backlight down for what
xbacklight -set 20%

xrdb -merge ~/.Xresources

# Export KDE styles to QT
export QT_PLUGIN_PATH="${HOME}/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/"


# set mouse speed
xset m 50/10 4

# enable cursor theme should there be one
xsetroot -cursor_name left_ptr


#disable capslock
setxkbmap -option caps:none


# xset dpms 600 600

# some java fix
export _JAVA_AWT_WM_NONREPARENTING=1

# if external monitor connected, run hdmi-hotplug script to adjust screens properly
if [ $(cat $HDMIEV | grep -Ec "^connected") -eq 1 ]; then
    hdmi-hotplug;
fi
# launch the business
exec awesome

# exec $1
# exec dwm
#exec ck-launch-session db-launch awesome
