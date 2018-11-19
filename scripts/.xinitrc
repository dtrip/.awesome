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


xmodmap -e 'keycode 150='

#disable capslock
setxkbmap -option caps:none


# xset dpms 600 600

# some java fix
export _JAVA_AWT_WM_NONREPARENTING=1

# if external monitor connected, run hdmi-hotplug script to adjust screens properly
# if [ $(cat $HDMIEV | grep -Ec "^connected") -eq 1 ]; then
    # hdmi-hotplug;
# fi

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# launch the business
exec awesome

# exec $1
# exec dwm
#exec ck-launch-session db-launch awesome
