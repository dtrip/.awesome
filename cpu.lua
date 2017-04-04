
local cpus = 4
--
cpuIcon = wibox.widget.imagebox()
cpuIcon:set_image(beautiful.widget_cpu)
--
cpu_box = wibox.widget.textbox()
--
-- cpuWidget = wibox.container.background()
-- cpuWidget:set_widget(c)
-- cpuWidget:set_bg(beautiful.arrow_bg_3)
-- cpuWidget:set_fg(beautiful.bg_normal)
--
--
--
-- vicious.register(c, vicious.widgets.cpu, '$1%', 1)


cpu = blingbling.line_graph({
    graph_background_color = beautiful.arrow_bg_3,
    graph_color = beautiful.bg_normal
})

cpu_box:set_widget(cpu)
vicious.register(cpu, vicious.widgets.cpu, '$1%', 1)
