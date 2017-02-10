
local cpus = 4

cpuIcon = wibox.widget.imagebox()
cpuIcon:set_image(beautiful.widget_cpu)

c = wibox.widget.textbox()

cpuWidget = wibox.container.background()
cpuWidget:set_widget(c)
cpuWidget:set_bg(beautiful.arrow_bg_3)
cpuWidget:set_fg(beautiful.bg_normal)



vicious.register(c, vicious.widgets.cpu, '$1%', 1)
