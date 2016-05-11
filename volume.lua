

local volCfg = {
    height = 18,
    width = 40,
    bar = true,
    show_text = true,
    label = "$percent%",
    pulseaudio = true,
    background_color = theme.bg_normal,
    graph_color = beautiful.graph_line_color
}

vol = blingbling.volume(volCfg)
vol:update_master()
vol:set_master_control()
