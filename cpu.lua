
local cpus = 4
local cCfg = {
    height = 20,
    width = 100,
    h_margin = 5,
    v_margin = 0,
    show_text = true,
    label = "CPU: $percent%",
    rounded_size = 0,
    background_color = beautiful.arrow_bg_4,
    graph_background_color = beautiful.arrow_bg_4,
    graph_line_color = beautiful.graph_line_color,
    graph_color = beautiful.graph_color
}

c = blingbling.line_graph(cCfg)
vicious.register(c, vicious.widgets.cpu, '$1', 1)
