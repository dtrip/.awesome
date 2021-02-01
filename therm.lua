require("color_gradient")

local thermtb = wibox.widget{
    layout = wibox.container.margin,
    top = 0,
    right = 0,
    left = 0,
    bottom = 0,
    {
        widget = wibox.widget.textbox,
        font = "Panton 14",
        text = "",
        opacity = 0.5
    }
}

local therm_graph = wibox.widget.graph {
    height = 20,
    width = 100
}


therm_widget = wibox.widget {
    layout = wibox.container.margin,
    top = 0,
    left = 0,
    bottom = 0,
    right = -10,
    {
        widget = wibox.container.background,
        bg = beautiful.arrow_bg_5,
        fg = beautiful.bg_focus,
        shape_clip = true,
        set_shape = function (cr, width, height)
            gears.shape.powerline(cr, width, height,((height/2) * -1))
        end,
        {
            {
                max_value = 100,
                min_value = 20,
                step_width = 1,
                step_spacing = 0,
                color = beautiful.bg_focus,
                background_color = beautiful.arrow_bg_5,
                widget = therm_graph
            },
            thermtb,
            layout = wibox.layout.stack
        }
    }
}



vicious.register(therm_graph, vicious.widgets.thermal, function(widget, args)

    local barColor = barGradient({30, 30, 36}, {90, 0, 4}, math.floor(args[1]), 30, 100)
    -- if math.floor(args[1]) >= 90 then
    -- elseif (math.floor(args[1]) >= 70 and math.floor(args[1]) < 90) then
    -- naughty.notify({ preset = naughty.config.presets.critical,
                     -- title = "barcolor",
                     -- text = tostring(args[1]) })
    --
    --
    -- therm_graph.color(gears.color("#" .. rgbToHex(barColor)))
    -- therm_graph.color(gears.color('#' .. rgbToHex(barColor)))
    therm_graph:add_value(math.floor(args[1]))
end, 1, {"hwmon4", "hwmon"})
