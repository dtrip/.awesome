
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
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },

    -- Currently using Tryannical tags instead of built in tags
    { rule = { class = "Gimp" },
      properties = { tag = tags[1][4], floating = true } },
    -- tags[screen #][tag #] 
    { rule_any = { class = { "sun-awt-X11-XDialogPeer", "sun-awt-X11-XFramePeer", "burp-StartBurp"} },
      properties = { tag = tags[1][2], floating = false } },
    { rule = { class = "sqlitestudio" },
      properties = { tag = tags[1][3], floating = false } },
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][1], floating = false } },
    { rule = { class = "Chromium-browser" },
      properties = { tag = tags[1][1], floating = false } },
    { rule_any = { class = { 'pcmanfm', 'Pcmanfm' } },
      properties = { tag = tags[1][5], floating = false } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    if not awesome.startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they do not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    elseif not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

end)

