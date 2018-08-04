local p = wibox.widget {
    widget = wibox.widget.progressbar,
    max_value = 100,
    min_value = 0,
	paddings = 20,
	forced_width = 100,
	forced_height = 50,
	value = 50
}

volume_popup = wibox.widget { 
		
	{
		widget = p
	},

	width = 200,
	top = 0,
	height = 200,
    -- layout = wibox.layout.stack
}


local tmr = gears.timer {
    timeout = 3,
    call_now = true,
    autostart = true,
    callback = function ()
        volume_popup:emit_signal("volume::hide")
    end
}

volume_popup:connect_signal("volume::adjust", function () 
    awful.placement.top(volume_popup, {})
    volume_popup.visible = true
    tmr.start_new()
end)


volume_popup:connect_signal("volume::hide", function () 
    volume_popup.visible = false
end)
