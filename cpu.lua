
local cpu_icon = wibox.widget{
    layout = wibox.container.margin,
    top = 0,
    right = 0,
    left = 20,
    bottom = 0,
    {
        widget = wibox.widget.textbox,
        font = "Panton 14",
        text = "",
        opacity = 0.5
    }
}

local cpu_graph = wibox.widget.graph {
    height = 20,
    width = 100
}

cpuwidget = wibox.widget {
        layout = wibox.container.margin,
        top = 0,
        left = 0,
        bottom = 0,
        right = -10,
        {
            widget = wibox.container.background,
            bg = beautiful.arrow_bg_3,
            fg = beautiful.bg_focus,
            shape_clip = true,
            set_shape = function (cr, width, height)
                gears.shape.powerline(cr, width, height, ((height/2) * -1))
            end,
            {
                {
                    max_value = 100,
                    min_value = 0,
                    step_width = 1,
                    step_spacing = 0,
                    color = beautiful.bg_focus,
                    background_color = beautiful.arrow_bg_3,
                    widget = cpu_graph
                },
                cpu_icon,
                layout = wibox.layout.stack,
            }
        }
}
-- 
vicious.register(cpu_graph, vicious.widgets.cpu, function (widget, args) 
    cpu_graph:add_value(args[1])
end, 1)
