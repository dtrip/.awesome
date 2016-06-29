
--  Date widget
datewidget_txt2 = wibox.widget.textbox()
datewidget_txt = wibox.layout.constraint(datewidget_txt2, "exact", 158, nil)

datewidget = wibox.widget.background()
-- datewidget.width = 300
datewidget:set_widget(datewidget_txt)
vicious.register(datewidget_txt2, vicious.widgets.date, " %b %d %r", 1)


-- calendar = blingbling.calendar()
-- calendar:set_link_to_external_calendar(true)
