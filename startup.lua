
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/xcomp.bash &")
awful.util.spawn_with_shell("xfce4-power-manager --restart &")

awful.util.spawn_with_shell("xmodmap " .. CONFIG_PATH .. "/scripts/.Xmodmap &")
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/lightlocker.bash &")

-- sets network monitor applet in taskbar
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/nm-applet.bash &")

-- used to start solaar applet for logitech keyboards
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/solaar.bash &")
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/x11-calibrator.bash")

-- starts conky widgets
awful.util.spawn_with_shell("sh ~/conky/start-conky.sh &")

-- awful.util.spawn_with_shell("sh " .. CONFIG_PATH .. "/scripts/wallpaper &")

-- launches onscreen keyboard
awful.util.spawn_with_shell("onboard &")
