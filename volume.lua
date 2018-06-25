
local voltb = wibox.widget {
    layout = wibox.container.margin,
    top = 0,
    right = 0,
    left = 20,
    bottom = 0,
    {
        widget = wibox.widget.textbox,
        font = "Panton 14",
        text = "",
        opacity = 0.5
    }
}


local volbar = wibox.widget.progressbar {
    height = 20,
    width = 100
}


volwidget = wibox.widget {
    layout = wibox.container.margin,
    top = 0,
    left = 0,
    bottom = 0,
    right = -10,
    
    widget = wibox.container.background,
    bg = beautiful.arrow_bg_6,
    fg = beautiful.bg_focus,
    shape_clip = true,
    set_shape = function (cr, width, height)
        gears.shape.powerline(cr, width, height ((height/2) * -1))
    end,
    {
        {
            forced_height = 20,
            forced_width = 100,
            max_value = 100,
            min_value = 0,
            color = beautiful.bg_focus,
            background_color = beautiful.arrow_bg_6,
            widget = volbar
        },
        voltb,
        layout = wibox.layout.stack
    }
}

vicious.register(volbar, vicious.widgets.volume, function (widget, args)
    volbar:set_value(args[1])
end, 2, PCM)
