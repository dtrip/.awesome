-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- blingbling = require("blingbling")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
vicious = require("vicious")
-- radical = require("radical")


-- require("debian.menu")

-- obvious = require("obvious")

-- local hotkeys_popup = require("awful.hotkeys_popup").widget

CONFIG_PATH = os.getenv("HOME") .. "/.config/awesome"

-- {{{ startup scripts
-- awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/xcomp.bash &")
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/compton.bash &")
awful.spawn.with_shell("xmodmap " .. CONFIG_PATH .. "/scripts/.Xmodmap &")

-- sets network monitor applet in taskbar
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/nm-applet.bash &")

-- used to start solaar applet for logitech keyboards
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/solaar.bash &")
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/indicator-sound.bash")
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/pulseaudio.bash")
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/blueman-applet.bash")
awful.spawn.with_shell("bash " .. CONFIG_PATH .. "/scripts/xscreensaver.bash")

-- starts conky widgets
-- awful.spawn.with_shell("sh ~/conky/start-conky.sh &")

-- awful.spawn.with_shell("xscreensaver -no-splash &")
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(awful.util.get_themes_dir() .. "default/theme.lua")
beautiful.init(CONFIG_PATH .. "/themes/powerarrows/theme.lua")

require("arrows")
require("calendar")
require("net")
-- require("cpu")
require("mem")
require("bat")

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

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    -- awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu


myawesomemenu = {
   { "Manual", terminal .. " -e man awesome" },
   { "Edit Config", editor_cmd .. " " .. awesome.conffile },
   { "Reload Awesome", awesome.restart },
   { "Log Out", awesome.quit },
   { "", nil },
   { "Restart Computer", "shutdown -r now" },
   { "Shutdown Computer", "shutdown -h now" }
}

mymainmenu = awful.menu({ items = {
                                    { "Firefox", "firefox", beautiful.firefox },
                                    { "Chrome", "chromium-browser", beautiful.www_icon },
                                    -- { "Chrome", "chromium", beautiful.www_icon },
                                    { "Incognito Chrome", "chromium-browser --incognito", beautiful.www_icon },
                                    -- { "Incognito Chrome", "chromium --incognito", beautiful.www_icon },
                                    { "Burp Suite", "burpsuite", beautiful.burp_icon },
                                    { "Terminal", terminal, beautiful.term_icon },
                                    { "SQLiteStudio", "sqlitestudio", beautiful.sqlite_icon },
                                    { "Keyboard", "onboard", beautiful.keyboard },
                                    { "Files", "pcmanfm", beautiful.files },
                                    -- { "ReCalibrate Touch", "xinput_calibrator", beautiful.touchcali },
                                    -- { "Terminology", terminology, beautiful.term_icon },
                                    -- { "Main Menu", debian.menu.Debian_menu.Debian, beautiful.debian },
                                    { "Awesome", myawesomemenu, beautiful.awesome_lg_icon }
                                  }
                        })



mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })


-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, awful.layout.layouts[1])
end



-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibox
-- Create a textclock widget
-- mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
statusBars = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end

    -- Each screen has its own tag table.
    -- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    --
    -- bar_menu, bar_menu_w = radical.bar {
    --     item_style = radical.item.style.basic,
    --     text = " 1 ",
    --     style = radical.style.classic,
    --     arrow_type = radical.base.arrow_type.PRETTY,
    --     layout = radical.layout.horiztonal,
    --     -- disable_submenu_icon = true,
    --     spacing = 4,
    --     -- bg_used = beautiful.bg_normal,
    --     -- bg = beautiful.bg_urgent,
    --     -- fg_focus = beautiful.fg_focus,
    --     -- fg = beautiful.fg_normal,
    --     default_item_margins = {
    --         TOP = 0,
    --         BOTTOM = 0,
    --         LEFT = 0,
    --         RIGHT = 20
    --     }
    -- }


    -- bar_menu:add_colors_namespace("toolbox")
    --
    -- local it = bar_menu:add_item{
    --    text = "Sub",
    --     item_style = radical.item.style.arrow_prefix,
    --     arrow_type = radical.base.arrow_type.NONE,
    --     icon = beautiful.ubuntu_drk,
    --     tooltip = "Application Menu",
    --     sub_menu = function ()
    --         local smenu = radical.context{
    --         }
    --         smenu:add_item{ text="Menu Item" }
    --         smenu:add_item{ text="Menu Item2", icon=beautiful.firefox }
    --         return smenu
    --     end}
    --
    -- it.state[radical.base.item_flags.USED] = true



    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibar({ position = "top", height=25, screen = s })
    -- mywibox[s] = awful.wibox({ position = "top", height=15, screen = s })


    -- statusBars[s] = awful.wibox({ position = "bottom", screen = s })

    -- rbox = wibox.layout.align.horizontal()
    -- rbox:set_left(bar_menu)
    
    -- mywibox[s]:set_widget(rbox)
  
    -- statusBars[s]:set_widget(rbox)

    -- Add widgets to the wibox
    mywibox[s]:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            -- bar_menu_w,
            mytaglist[s],
            larr1,
            mypromptbox[s],
        },
        mytasklist[s], -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            arr5,
            baticon,
            batwidget,
            arr4,
            ramIcon,
            ramWidget,
            arr3,
            -- cpuIcon,
            -- cpuWidget,
            -- cpu_box,
            arr2,
            wifiwidgetSSID,
            arr1,
            datewidget,  
            arryb,
            -- mytextclock,
            mylayoutbox[s],
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    -- awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              -- {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.history.previous()
            -- awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            -- awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[awful.screen.focused()]:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[awful.screen.focused()].widget,
                  awful.util.eval, nil,
                  awful.util.get_cache_dir() .. "/history_eval")
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),


    -- Brightness
    awful.key({ modkey, "Shift"      }, "p",
        function ()
            awful.spawn.with_shell("xbacklight -dec 5") 
        end),

    awful.key({ modkey, "Shift"      }, "o",
        function ()
            awful.spawn.with_shell("xbacklight -inc 5")
        end),

    awful.key({ modkey, "Control" }, "l",
        function ()
            awful.spawn.with_shell("xscreensaver-command -lock")
        end),

    -- awful.key({ }, "F10", function() toggle_conky() end),
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            awful.spawn.with_shell("amixer -c 1 set Master 5%+", false)
        end),

    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            awful.spawn.with_shell("amixer -c 1 set Master 5%-", false)
        end),
    awful.key({ }, "XF86AudioMute",
        function ()
            awful.spawn.with_shell("amixer -c 1 set Master toggle", false)
        end),

    -- executes script to enable only primary monitor
    awful.key({ modkey, "Shift" }, "Down",
        function ()
            awful.spawn.with_shell("~/.ubuntu/scripts/ext_monitor_disconnect &", false)
        end),
    -- executes script to enable secondary external monitor (in this case HDMI1)
    awful.key({ modkey, "Shift" }, "Up",
        function ()
            awful.spawn.with_shell("~/.ubuntu/scripts/ext_monitor_connect &", false)
        end),
    -- manuallly execute hdmi-hotplug script for screen detection
    awful.key({ modkey, "Shift" }, "Right",
        function ()
            awful.spawn.with_shell("hdmi-hotplug&", false)
        end)

)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"}),

          awful.key({modkey,            }, "F1",     function () awful.screen.focus(1) end),
          awful.key({modkey,            }, "F2",     function () awful.screen.focus(2) end)

    )
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     size_hints_honor = false,
                     buttons = clientbuttons,
                     screen = awful.screen.focused,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"},

        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },

    -- tags[screen #][tag #] 
    { rule = { class = "Gimp" },
      properties = { tag = tags[1][4], floating = true } },
    { rule = { class = "sqlitestudio" },
      properties = { tag = tags[1][3], floating = false } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][1], floating = false } },
    { rule = { class = "Chromium-browser" },
      properties = { tag = tags[1][1], floating = false } },

    -- rules for any client
    { rule_any = { class = { 'pcmanfm', 'Pcmanfm' } },
      properties = { tag = tags[1][5], floating = false } },
    { rule_any = { class = { "sun-awt-X11-XDialogPeer", "sun-awt-X11-XFramePeer", "burp-StartBurp"} },
      properties = { tag = tags[1][2], floating = false } },


    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup then
        if not c.size_hints.user_position and not c.size_hints.program_position then
            -- Prevent clients from being unreachable after screen count changes.
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    elseif not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = awful.util.table.join(
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
