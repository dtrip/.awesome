-- -- wifi

wifiwidget_txt = wibox.widget.textbox()
wifiwidget_txt.align = "center"

wifiwidgetSSID = wibox.widget {
    layout = wibox.container.margin,
    top = 0,
    bottom = 0,
    left = 0,
    right = -10,
    {
        widget = wibox.container.background,
        bg = beautiful.arrow_bg_2,
        fg = beautiful.bg_normal,
        set_shape = function (cr, width, height)
            gears.shape.powerline(cr, width, height, ((height/2) * -1))
        end,
        {
            layout = wibox.container.margin,
            top = 0,
            bottom = 0,
            left = 10,
            right = 10,
            wifiwidget_txt
        }
    }
}


vicious.register(wifiwidget_txt, vicious.widgets.wifi, "  ${ssid} ${linp}% ", 3, 'wlp1s0')
