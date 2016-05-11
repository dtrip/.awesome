#!/bin/bash

# Turn backlight down for what
xbacklight -set 50%

# Export KDE styles to QT
export QT_PLUGIN_PATH="${HOME}/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/"

# {{{ Resource and keymap settings
usermodmap="${HOME}/.Xmodmap"
userresources="${HOME}/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"

# Merge system and user resources and keymaps
[[ -r "${sysresources}" ]]  && xrdb -merge "${sysresources}"
[[ -r "${sysmodmap}" ]]     && xmodmap "${sysmodmap}"
[[ -r "${userresources}" ]] && xrdb -merge "${userresources}"
[[ -r "${usermodmap}" ]]    && xmodmap "${usermodmap}"
# }}}


# set mouse speed
xset m 50/10 4

# enable cursor theme should there be one
xsetroot -cursor_name left_ptr

# check if external monitor is conneted
# if [[ $(xrandr -d :0 -q | grep '\sconnected' | wc -l) -eq 2 ]]; then
   # xrandr --output eDP1 --mode 1366x768 --output HDMI1 --primary --mode 1920x1080 --right-of eDP1
   # xrandr --output HDMI1 --primary
# else
   # xrandr --output eDP1 --primary --mode 1366x768
   # xrandr --output eDP1 --primary
# fi
xrandr --output eDP1 --primary --mode 1366x768

#disable capslock
setxkbmap -option caps:none

# some java fix
export _JAVA_AWT_WM_NONREPARENTING=1
# export _JAVA_AWT_WM_NONREPARENTING

# launch the business
exec awesome
# exec dwm
#exec ck-launch-session db-launch awesome
