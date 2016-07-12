
local cpus = 4

cpuIcon = wibox.widget.imagebox()
cpuIcon:set_image(beautiful.widget_cpu)

c = wibox.widget.textbox()

cpuWidget = wibox.widget.background()
cpuWidget:set_widget(c)
cpuWidget:set_bg(beautiful.larrow_bg_1)
cpuWidget:set_fg(beautiful.bg_normal)



vicious.register(c, vicious.widgets.cpu, '$1%', 1)
