-- -- wifi

-- batwidget_txt = wibox.widget.textbox()
-- batwidget = wibox.widget.background()
-- batwidget:set_widget(batwidget_txt)
-- batwidget:set_bg(beautiful.arrow_bg_2)
-- batwidget:set_fg(beautiful.datewidget_fg)
-- vicious.register(batwidget_txt, vicious.widgets.bat, " $2", 3, 'BAT0')


baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_battery)


local btimer = 0 -- battery timer in seconds
local binterval = 5 -- interval to check battery

local batCfg = {
    width = 40,
    height = 18,
    bar = false,
    label = "$percent%",
    value_format = "%2.f",
    show_text = true,
    background_color = beautiful.bg_normal,
    graph_background_color = beautiful.bg_normal
}
batwidget = blingbling.triangular_progress_graph(batCfg)
-- vicious.register(batwidget, vicious.widgets.bat, "$2", 3, 'BAT1')
vicious.register(batwidget, vicious.widgets.bat, 
    function (widget, args)
        -- on AC Power
        if args[1] == "-" then
            baticon:set_image(beautiful.widget_ac)
        -- else on Battery
        else
            baticon:set_image(beautiful.widget_battery)
        end
        return args[2]
end, binterval, 'BAT1')
