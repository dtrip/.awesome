
--  Date widget
datewidget_txt2 = wibox.widget.textbox()
datewidget_txt = wibox.layout.constraint(datewidget_txt2, "exact", 125, nil)
-- datewidget_txt:set_bg(beautiful.larrow_bg_1)

datewidget = wibox.widget.background()
-- datewidget.width = 300
datewidget:set_widget(datewidget_txt)
datewidget:set_bg(beautiful.larrow_bg_1)
datewidget:set_fg(beautiful.bg_normal)
vicious.register(datewidget_txt2, vicious.widgets.date, " %b %d %r", 1)


-- calendar = blingbling.calendar()
-- calendar:set_link_to_external_calendar(true)
