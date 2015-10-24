-- -- wifi
neticon = wibox.widget.imagebox()
neticon:set_image(beautiful.pa_net)

wifiwidget_txt = wibox.widget.textbox()
wifiwidget = wibox.widget.background()
wifiwidget:set_widget(wifiwidget_txt)
wifiwidget:set_bg(beautiful.arrow_bg_2)
wifiwidget:set_fg(beautiful.arrow_bg_1)
-- -- wifiwidget:set_border_color(beautiful.arrow_bg_2)
vicious.register(wifiwidget_txt, vicious.widgets.wifi, " ${ssid} ${linp}% ", 3, 'mlan0')
--
--
-- local netCfg = {
--     width = 40,
--     height = 18,
--     bar = true,
--     label = "$percent%",
--     value_format = "%2.f",
--     show_text = true
-- }
-- wifiwidget = blingbling.triangular_progressgraph(netCfg)
-- vicious.register(wifiwidget, vicious.widgets.wifi, "${linp}", 3, 'mlan0')

