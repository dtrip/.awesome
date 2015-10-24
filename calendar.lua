-- datewidget = blingbling.calendar()
--
-- local dateStyle = {
--     width = 300,
--     height = 20
-- }
-- datewidget:set_current_date_widget_style(dateStyle)
-- datewidget:set_info_cell_style(dateStyle)
-- datewidget:set_link_to_external_calendar(true)

--  Date widget
datewidget_txt2 = wibox.widget.textbox()
datewidget_txt = wibox.layout.constraint(datewidget_txt2, "exact", 158, nil)

-- local dateCfg = {
--     height = 20,
--     v_margin = 0,
--     h_margin = 0,
--     width = 150,
--     background_color = "#d7ff80FF",
--     text_background_color = "#d7ff80FF",
--         -- background_color = beautiful.arrow_bg_2,
--     -- text_background_color = beautiful.arrow_bg_2,
--     label = "$1 %",
--     text_color = "#313131FF",
--     -- values_text_color = "#313131FF"
-- }
--
-- datewidget = blingbling.value_text_box(dateCfg)

datewidget = wibox.widget.background()
-- datewidget.width = 300
datewidget:set_widget(datewidget_txt)
datewidget:set_bg(beautiful.arrow_bg_1)
datewidget:set_fg(beautiful.datewidget_fg)
vicious.register(datewidget_txt2, vicious.widgets.date, " %b %d %r", 1)


-- calendar = blingbling.calendar()
-- calendar:set_link_to_external_calendar(true)
