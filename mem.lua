
ram_conf = {
    text = "RAM",
    height = 20,
    width = 100,
    h_margin = 0,
    v_margin = 0,
    label = "RAM: $percent%",
    rounded_size = 0,
    background_color = beautiful.arrow_bg_3,
    graph_line_color = beautiful.graph_line_color,
    graph_color      = beautiful.graph_color,
    graph_background_color = beautiful.arrow_bg_3,
    background_border = beautiful.arrow_bg_3
}

-- ramLbl = widget({ type="textbox" })
-- ramLbl.text="RAM:"
ramWidget = blingbling.line_graph(ram_conf)
-- ramWidget.set_tiles_color("#00000022")
ramWidget:set_show_text(true)
-- vicious.register(ramWidget, vicious.widgets.mem, '$2', 2)
vicious.register(ramWidget, vicious.widgets.mem, "$1", 1)
