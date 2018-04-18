#!/bin/bash
export XAUTHORITY=/home/dtrip/.Xauthority
export DISPLAY=:0

LOG="/tmp/sensor.log"

monitor-sensor >> $LOG 2>&1 &

while inotifywait -e modify $LOG; do

    ORIEN=$(tail -n 1 $LOG | grep 'orientation' | grep -oE '[^ ]+$')

    logger "ORIENTATION changed: $ORIEN"
    
    case "$ORIEN" in
        normal)
            xinput enable "ELAN1200:00 04F3:3058 Touchpad"
            xrandr --output eDP-1 --rotate normal
            xinput set-prop "ELAN24CC:00 04F3:24CC" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
            xinput set-prop "ELAN24CC:00 04F3:24CC Pen Pen (0)" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
            ;;
        bottom-up)
            xinput disable "ELAN1200:00 04F3:3058 Touchpad"
            xrandr --output eDP-1 --rotate inverted
            xinput set-prop "ELAN24CC:00 04F3:24CC" --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
            xinput set-prop "ELAN24CC:00 04F3:24CC Pen Pen (0)" --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
            ;;
        right-up)
            xinput disable "ELAN1200:00 04F3:3058 Touchpad"
            xrandr --output eDP-1 --rotate right
            xinput set-prop "ELAN24CC:00 04F3:24CC" --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
            xinput set-prop "ELAN24CC:00 04F3:24CC Pen Pen (0)" --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
            ;;
        left-up)
            xinput disable "ELAN1200:00 04F3:3058 Touchpad"
            xrandr --output eDP-1 --rotate left
            xinput set-prop "ELAN24CC:00 04F3:24CC" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
            xinput set-prop "ELAN24CC:00 04F3:24CC Pen Pen (0)" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
            ;;
    esac

done
