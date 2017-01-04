-- -- wifi
neticon = wibox.widget.imagebox()
neticon:set_image(beautiful.pa_net)

wifiwidget_txt = wibox.widget.textbox()
wifiwidgetSSID = wibox.widget.background()
wifiwidgetSSID:set_widget(wifiwidget_txt)
wifiwidgetSSID:set_bg(beautiful.arrow_bg_2)
wifiwidgetSSID:set_fg(beautiful.bg_normal)
-- -- wifiwidget:set_border_color(beautiful.arrow_bg_2)
vicious.register(wifiwidget_txt, vicious.widgets.wifi, " ${ssid} ${linp}% ", 3, 'wlp2s0')
--
--
-- local netCfg = {
--     width = 40,
--     height = 18,
--     bar = false,
--     label = "$percent%",
--     value_format = "%2.f",
--     show_text = true,
--     background_color = beautiful.bg_normal,
--     graph_background_color = beautiful.bg_normal,
--     graph_color = beautiful.bg_normal
-- }
-- wifiwidget = blingbling.triangular_progress_graph(netCfg)
-- vicious.register(wifiwidget, vicious.widgets.wifi, "${linp}", 3, 'wlan0')
