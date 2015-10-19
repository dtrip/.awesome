-- Standard awesome library
gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")

radical = require("radical")
tyrannical = require("tyrannical")

-- {{{ Error handling
require("errors")
-- {{{ Variable definitions

CONFIG_PATH = os.getenv("HOME") .. "/.config/awesome"
-- _G.CONFIG_PATH = awful.util.geticonpath('rc.lua', {'lua'}, { "~/.config/awesome"})
-- -- naughty.notify({ text = CONFIG_PATH })

-- naughty.notify({ TEXT="CTest" })

require("startup")

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init("@AWESOME_THEMES_PATH@/powerarrows/theme.lua")
beautiful.init(CONFIG_PATH .. "/themes/powerarrows/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "terminator"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"


require("layouts")

require("java")

-- {{{ Helper functions
require("helpers")

-- {{{ Wallpaper
require("wallpaper")

-- {{{ Tags
require("tags")

-- {{{ Menu
require("menubars")

require("bindings")

-- {{{ Rules
require("rules")


require("signals")
