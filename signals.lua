
-- Enable sloppy focus
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

-- client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
-- client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
--
--
-- client.disconnect_signal("request::activate", awful.ewmh.activate)
-- function awful.ewmh.activate(c)
--     if c:isvisible() then
--         client.focus = c
--         c:raise()
--     end
-- end
-- client.connect_signal("request::activate", awful.ewmh.activate)
--
--
