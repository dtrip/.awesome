local tlist = {}
local awful = require("awful")

local function getTaglistWidget (s)
    -- Create a taglist widget
return awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all, 
    buttons = taglist_buttons,
    style = {
        shape = gears.shape.powerline,
    --
        -- shape = function (cr, width, height)
            -- gears.shape.powerline(cr, width, height, ((height/1) * 1))
        -- end,
        -- shape = function (cr, w, h)
            -- gears.shape.transform(gears.shape.powerline) : scale(0.5, 1)(cr, 70, 70)
       -- end,
       spacing = 0,
    --
    },
    layout = {
        -- spacing = 2,
        spacing_widget = {
            color = '#dddddd',
            shape = function (cr, w, h)
                gears.shape.transform(gears.shape.powerline) : scale(0.5, 1)(cr, 70, 70)
            end,
            widget = wibox.widget.separator,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    widget_template = {
        {
            {
                {
                   id = 'text_role',
                   widget = wibox.widget.textbox,
                },
                widget = wibox.container.background,
                -- forced_width = 30,
            },
            left = 7,
            right = 7,
            widget = wibox.container.margin
        },
        -- shape = gears.shape.parallelogram,
        -- shape_clip = true,
        id = 'background_role',
        widget = wibox.container.background,
    },
    -- style = {
    --     shape = function (cr, w, h)
    --         gears.shape.transform(gears.shape.parallelogram) : scale(0.5, 1)(cr, 70, 70)
    --     end
    -- },

    -- widget_template = {
    --     {
    --         {
    --             {
    --                 id = 'index_role',
    --                 widget = wibox.widget.textbox,
    --             },
    --             {
    --                 id = 'icon_role',
    --                widget = wibox.widget.imagebox,
    --             },
    --             {
    --                 id = 'text_role',
    --                 widget = wibox.widget.textbox,
    --             },
    --             widget = wibox.container.background,
    --         },
    --         left = -10,
    --         right = 41,
    --         widget = wibox.container.margin,
    --     },
    --     bg = "#ffffff",
    --     shape_clip = true,
    --     id = 'background_role',
    --     widget = wibox.container.background,
    -- }
    -- widget_template = {
    --     {
    --         {
    --                 {
    --                     {
    --                         {
    --                             id = 'index_role',
    --                             widget = wibox.widget.textbox,
    --                         },
    --                         margins = 1,
    --                         -- left = 20,
    --                         -- right =20,
    --                         widget = wibox.container.margin,
    --                     },
    --
    --                     shape_clip = true,
    --                     widget = wibox.container.background,
    --                 },
    --                 {
    --                     {
    --                         id = 'icon_role',
    --                         widget = wibox.widget.imagebox,
    --                     },
    --                     margins = 2,
    --                     layout = wibox.container.margin,
    --                 },
    --                 {
    --                     {
    --                     id = 'text_role',
    --                     widget = wibox.widget.textbox,
    --                     },
    --                     margins = 3,
    --                     layout = wibox.container.margin,
    --                 },
    --             layout = wibox.layout.flex.horizontal,
    --         },
    --         left = 12,
    --         right = 12,
    --         widget = wibox.container.margin,
    --     },
    --
    --         shape = gears.shape.parallelogram,
    --     id = 'background_role',
    --     widget = wibox.container.background,
    -- }
})
end

tlist.getTaglistWidget =  getTaglistWidget
return tlist
