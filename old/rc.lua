-- Standard awesome library
gears = require("gears")
awful = require("awful")
blingbling = require("blingbling")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
vicious = require("vicious")

radical = require("radical")
-- require("init")

-- radical      = require( "radical"                    )
-- rad_task     = require( "radical.impl.tasklist"      )
-- rad_taglist  = require( "radical.impl.taglist"       )
-- alttab       = require( "radical.impl.alttab"        )
-- rad_client   = require( "radical.impl.common.client" )
-- rad_tag      = require( "radical.impl.common.tag"    )


-- tyrannical = require("tyrannical")

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

spacer = wibox.widget.textbox()
spacer:set_text(' ')

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

require("calendar")
require("java")
-- require("net")

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
