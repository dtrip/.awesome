
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/xcomp.bash &")

awful.util.spawn_with_shell("xmodmap " .. CONFIG_PATH .. "/scripts/.Xmodmap &")

-- sets network monitor applet in taskbar
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/nm-applet.bash &")

-- used to start solaar applet for logitech keyboards
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/solaar.bash &")
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/indicator-sound.bash")
awful.util.spawn_with_shell("bash " .. CONFIG_PATH .. "/scripts/blueman-applet.bash")

-- starts conky widgets
awful.util.spawn_with_shell("sh ~/conky/start-conky.sh &")

awful.util.spawn_with_shell("xscreensaver -no-splash &")

