

ramIcon = wibox.widget.imagebox()
ramIcon:set_image(beautiful.widget_mem)

ramWidget = wibox.widget.textbox()
vicious.register(ramWidget, vicious.widgets.mem, "$1%", 1)
