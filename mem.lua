

ramIcon = wibox.widget.imagebox()
ramIcon:set_image(beautiful.widget_mem)

ramW = wibox.widget.textbox()

ramWidget = wibox.widget.background()
ramWidget:set_widget(ramW)
ramWidget:set_bg(beautiful.arrow_bg_4)

vicious.register(ramW, vicious.widgets.mem, "$1%", 1)
