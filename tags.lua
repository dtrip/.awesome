
-- Define a tag table which hold all screen tags.
-- tags = {}
-- for s = 1, screen.count() do
--     -- Each screen has its own tag table.
--     tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, awful.layout.layouts[1])
-- end


-- using tryannical tags as replacment for tags 1,2,3,4,5,6,7,9 thing

tyrannical.tags = {
    {
        name = "Term",  -- tag name
        init = true,    -- load tag on startup
        exclusive = true, -- refuse other types of clients
        icon = CONFIG_PATH .. "/icons/term.png",
        -- screen  = screen.count()>1 and 1 o 1,-- Setup on screen 2 if there is more than 1 screen, else on screen 1
        screen = 1,
        layout = awful.layout.suit.max, -- layout style to use
        -- instance = {"dev", "ops"}, -- accepts the following instances; takes precedence over 'class'
        class = { 'Terminator', 'luakit' } -- accepts the folloing class
    },
    {
        name = "Burp",
        init = true,
        -- exclusive = true,
        icon = CONFIG_PATH .. "/icons/burp.png",
        -- icon = "/home/dtrip/.config/awesome/icons/burp.png",
        screen = 1,
        -- screen  = screen.count()>1 and 2 or 1,-- Setup on screen 2 if there is more than 1 screen, else on screen 1
        layout = awful.layout.suit.floating,
        class = { "sun-awt-X11-XDialogPeer", "sun-awt-X11-XFramePeer", "burp-StartBurp" }
    },
    {
        name = "SQL",
        init = true,
        -- screen  = screen.count()>1 and 2 or 1,
        screen = 1,
        icon = CONFIG_PATH .. "/icons/sql.png",
        layout = awful.layout.suit.max,
        class = { "sqlitestudio" },
        exclusive = true
    },
    {
        name = "Gimp",
        init = true,
        -- screen  = screen.count()>1 and 2 or 1,
        screen = 1,
        icon = CONFIG_PATH .. "/icons/gimp.png",
        layout = awful.layout.suit.max,
        exclusive = true,
        class = { "Gimp" }
    },
    {
        name = "Files",
        init = true,
        -- screen  = screen.count()>1 and 2 or 1,
        screen = 1,
        layout = awful.layout.suit.max,
        exclusive = true,
        class = { "pcmanfm" }
    },
    {
        name = "Conky",
        screen = 1,
        hide = true,
        class = { "Conky" }
    }
}

-- clients by class which ignore "exclusive" tag
tyrannical.properties.intrusive = { "pinentry", "xcalc", "kcalc", "Gnome-calculator" }

-- Clients by class ignoring tile layout
tyrannical.properties.floating = { "Lxappearance", "Gnome-calculator" }

tyrannical.properties.fullscreen = { "sun-awt-X11-XDialogPeer", "sun-awt-X11-XFramePeer", "burp-StartBurp" }

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {  }

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.centered = { }

tyrannical.properties.below = { "Conky" }

-- not added to tasklist
tyrannical.properties.skip_taskbar = { "Conky" }

-- no autofocus for new instance
tyrannical.properties.no_autofocus = { "Conky" }

-- block popups/alert diaglogs and such 
tyrannical.settings.block_children_focus_stealing = true

-- clients must be on same tag as parent such as alerts
tyrannical.settings.group_children = true

