-- -- wifi

-- batwidget_txt = wibox.widget.textbox()
-- batwidget = wibox.widget.background()
-- batwidget:set_widget(batwidget_txt)
-- batwidget:set_bg(beautiful.arrow_bg_2)
-- batwidget:set_fg(beautiful.datewidget_fg)
-- vicious.register(batwidget_txt, vicious.widgets.bat, " $2", 3, 'BAT0')

local batCfg = {
    width = 40,
    height = 18,
    bar = false,
    label = "$percent%",
    value_format = "%2.f",
    show_text = true,
    background_color = beautiful.arrow_bg_6,
    graph_background_color = beautiful.arrow_bg_6
}
batwidget = blingbling.triangular_progress_graph(batCfg)
vicious.register(batwidget, vicious.widgets.bat, "$2", 3, 'BAT0')
