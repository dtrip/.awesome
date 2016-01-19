-- -- wifi
neticon = wibox.widget.imagebox()
neticon:set_image(beautiful.pa_net)

wifiwidget_txt = wibox.widget.textbox()
wifiwidgetSSID = wibox.widget.background()
wifiwidgetSSID:set_widget(wifiwidget_txt)
wifiwidgetSSID:set_bg(beautiful.arrow_bg_2)
wifiwidgetSSID:set_fg(beautiful.datewidget_fg)
-- -- wifiwidget:set_border_color(beautiful.arrow_bg_2)
vicious.register(wifiwidget_txt, vicious.widgets.wifi, " ${ssid} ", 3, 'wlp1s0')
--
--
local netCfg = {
    width = 40,
    height = 18,
    bar = true,
    label = "$percent%",
    value_format = "%2.f",
    show_text = true,
    background_color = beautiful.arrow_bg_2,
    graph_background_color = beautiful.arrow_bg_2,
    graph_color = beautiful.bg_normal
}
wifiwidget = blingbling.triangular_progress_graph(netCfg)
vicious.register(wifiwidget, vicious.widgets.wifi, "${linp}", 3, 'wlp1s0')
-- vicious.register(wifiwidget, vicious.widgets.wifi, "${linp}", 3, 'mlan0')

