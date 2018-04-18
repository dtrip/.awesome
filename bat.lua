
bat_graph = wibox.container.radialprogressbar
battb = wibox.widget.textbox()


battb.font = "Panton 8"
battb.align = "center"
battb.forced_width = 30

bat_box = wibox.widget {
    layout = bat_graph,
    border_width = 2,
    padding = 0,
    color = gears.color("#FFFFFF"),
    border_color = gears.color("#2f343f"),
    forced_width = 18,
    max_value = 100,
    min_vaue = 0,
}

bat_widget = wibox.widget {
        layout = wibox.container.margin,
        top = 0,
        left = 0,
        bottom = 0,
        right = -10,
        {
            widget = wibox.container.background,
            bg = beautiful.arrow_bg_5,
            fg = beautiful.bg_normal,
            shape_clip = true,
            set_shape = function (cr, width, height)
                gears.shape.powerline(cr, width, height, ((height/2) * -1))
            end,
            {
                layout = wibox.container.margin,
                top = 1,
                bottom = 1,
                left = 20,
                right = 10,
                {
                    bat_box,
                    {
                        widget = wibox.container.background,
                        fg = beautiful.bg_focus,
                        {
                        layout = wibox.container.margin,
                        top = 6,
                        battb,
                        forced_width = 40
                        }
                    },
                    layout = wibox.layout.fixed.horizontal,
                    spacing = 4
                }
            }
        }
}

vicious.register(bat_graph, vicious.widgets.bat, function (widget, args)
    bat_box.value = args[2]

    if tonumber(args[2]) <= 15 then
        bat_box.color = gears.color("#FF0000")
    else
        bat_box.color = gears.color("#FFFFFF")
    end

    battb:set_text(args[2] .. "%")
end,  5, 'BAT0')
