
-- Create a laucher widget and a main menu
require("arrows")
require("mem")
require("volume")
require("cpu")
require("bat")
-- require("rmenu")

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
                                    { "Incognito Chrome", "chromium-browser --incognito", beautiful.www_icon },
                                    { "Burp Suite", "burpsuite", beautiful.burp_icon },
                                    { "Terminal", terminal, beautiful.term_icon },
                                    { "SQLiteStudio", "sqlitestudio", beautiful.sqlite_icon },
                                    { "Keyboard", "onboard", beautiful.keyboard },
                                    { "Files", "pcmanfm", beautiful.files },
                                    { "ReCalibrate Touch", "xinput_calibrator", beautiful.touchcali },
                                    -- { "Terminology", terminology, beautiful.term_icon },
                                    -- { "Main Menu", debian.menu.Debian_menu.Debian, beautiful.debian },
                                    { "Awesome", myawesomemenu, beautiful.awesome_lg_icon }
                                  }
                        })



mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- local m = radical.context{}
-- m:add_item {
--     text="screen 1", 
--     item_style = radical.item.style.arrow_prefix,
--     icon = "/home/dtrip/.config/awesome/icons/burp.png",
--     tooltip = "Application Menu"
-- }
--
-- local mytextbox = wibox.widget.textbox()
-- mytextbox:set_menu(m,3)
--
-- m:add_key_binding({"Mod4"}, ",")


-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
statusBars = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
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
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c.first_tag)
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

for s = 1, screen.count() do
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
    mywibox[s] = awful.wibox({ position = "top", height = '20', screen = s })

    -- statusBars[s] = awful.wibox({ position = "bottom", screen = s })
    -- statusBars[s] = awful.wibox({ position = "bottom", ontop=false, screen = s, height="18" })


    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(larr1)
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(mykeyboardlayout)

    -- if s == 1 then right_layout:add(wibox.widget.systray()) end
    -- right_layout:add(mytextclock)

    
    if s == 1 then
        right_layout:add(arr7)
        -- right_layout:add(spacer)
        right_layout:add(wibox.widget.systray())
        -- right_layout:add(spacer)
        right_layout:add(arr6)
    else
        right_layout:add(arr6e)
    end

    -- right_layout:add(arr8)
    -- right_layout:add(arr7)
    -- right_layout:add(arr6)
    right_layout:add(batwidget)
    right_layout:add(vol)
    right_layout:add(arr5)
    right_layout:add(c)
    right_layout:add(arr4)
    right_layout:add(ramWidget)
    right_layout:add(arr3)
    -- right_layout:add(neticon)
    right_layout:add(wifiwidget)
    right_layout:add(wifiwidgetSSID)
    right_layout:add(arr2)
    right_layout:add(datewidget)
    right_layout:add(arr1)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
    
    -- statusBars[s]:set_widget(bar_menu_w)
    -- statusBars[s]:set_widget(rbox)
 
    -- statusBars[s]:set_widgets {
    --     { --Left
    --         bar_menu_w     ,
    --         {
    --             mypromptbox[s] ,
    --             layout = wibox.widget.background(nil,beautiful.fg_normal)
    --         },
    --         layout = wibox.layout.fixed.horizontal,
    --     },
    --     nil,
    --     layout = wibox.layout.align.horizontal
    -- }


end

