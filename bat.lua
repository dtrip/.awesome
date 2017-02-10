
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_battery)


local btimer = 0 -- battery timer in seconds
local binterval = 5 -- interval to check battery


batwidget = wibox.container.background()
batwidget_txt = wibox.widget.textbox()

batwidget:set_widget(batwidget_txt)

batwidget:set_bg(beautiful.arrow_bg_5)
batwidget:set_fg(beautiful.fg_normal)


vicious.register(batwidget_txt, vicious.widgets.bat, 
    function (widget, args)
        -- on AC Power
        if args[1] == "-" then
            baticon:set_image(beautiful.widget_ac)
        -- else on Battery
        else
            baticon:set_image(beautiful.widget_battery)
        end
        return args[2] .. "%" .. args[1]
end, binterval, 'BAT1')
