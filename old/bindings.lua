require("java")

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx( 1)
            -- delay_raise()
            if client.focus then client.focus:raise() end
        end),

    awful.key({modkey, "Shift"}, "m",
        function()
            awful.util.spawn_with_shell(CONFIG_PATH .. "/scripts/trackpad-toggle.sh &", false)
            naughty.notify({
                title = "Trackpad",
                text = "Trackpad has been toggled",
                position = top_right,
                timeout = 2,
                ontop = true
            })
        end),

    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.history.previous()
            -- delay_raise()
            -- if client.focus then
                -- client.focus:raise()
            -- end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1) end),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end),

    -- Prompt
    awful.key({ modkey }, "r",
        function () 
            mypromptbox[awful.screen.focused()]:run() 
        end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[awful.screen.focused()].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end),

    -- Brightness
    awful.key({ modkey, "Shift"      }, "p",
        function ()
            awful.util.spawn("xbacklight -dec 5") 
        end),

    awful.key({ modkey, "Shift"      }, "o",
        function ()
            awful.util.spawn("xbacklight -inc 5")
        end),

    awful.key({ modkey, "Control" }, "l",
        function ()
            awful.util.spawn("xscreensaver-command -lock")
        end),

    -- awful.key({ }, "F10", function() toggle_conky() end),
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            awful.util.spawn("amixer -c 1 set Master 5%+", false)
        end),

    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            awful.util.spawn("amixer -c 1 set Master 5%-", false)
        end),
    awful.key({ }, "XF86AudioMute",
        function ()
            awful.util.spawn("amixer -c 1 set Master toggle", false)
        end),

    -- executes script to enable only primary monitor
    awful.key({ modkey, "Shift" }, "Down",
        function ()
            awful.util.spawn_with_shell("~/.ubuntu/scripts/ext_monitor_disconnect &", false)
        end),
    -- executes script to enable secondary external monitor (in this case HDMI1)
    awful.key({ modkey, "Shift" }, "Up",
        function ()
            awful.util.spawn_with_shell("~/.ubuntu/scripts/ext_monitor_connect &", false)
        end)

)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end)
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
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)