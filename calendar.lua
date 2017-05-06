
txtclock = wibox.widget.textclock("%b %d - %I:%M:%S %p", 1)
txtclock.align = "center"

date_widget = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.larrow_bg_1,
    fg = beautiful.bg_normal,
    set_shape = function (cr, width, height)
            gears.shape.powerline(cr, width, height, ((height/2) * -1))
    end,
    shape_clip = true,
    forced_width = 240,
    txtclock
}

