--[[
                                             
     Powerarrow Darker Awesome WM config 2.0 
     github.com/copycat-killer               
                                             
--]]

local awful = require("awful")
awful.util = require("awful.util")

--{{{ Main
theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/local/src/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16-16.png") then
    shared    = "/usr/share/local/awesome"
end
sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/powerarrows"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = themes .. themename

-- wallpaper1    = themedir .. "/spacebg.png"
-- theme.wallpaper    = themedir .. "/dcity2.png"
-- theme.wallpaper    = themedir .. "/dtrip2.png"
theme.wallpaper    = themedir .. "/waterspiked.png"
-- wallpaper1    = themedir .. "/bgt.png"
-- wallpaper1    = themedir .. "/hud3.png"
-- wallpaper1    = themedir .. "/1504.png"
-- wallpaper1    = themedir .. "/ex.jpg"
-- theme.wallpaper1    = themedir .. "/skullmusic.jpg"
-- theme.wallpaper2    = themedir .. "/term.jpg"
-- wallpaper1    = themedir .. "/radeon.jpg"
-- wallpaper2    = themedir .. "/background.png"
-- wallpaper3    = sharedthemes .. "/zenburn/zenburn-background.png"
-- wallpaper4    = sharedthemes .. "/default/background.png"
wpscript      = home .. "/.wallpaper"
theme.wallpaper1    = themedir .. "/jumpgl.png"
theme.wallpaper2    = themedir .. "/jumpgr.png"
-- theme.wallpaper2    = themedir .. "/super.jpg"

-- if awful.util.file_readable(wallpaper1) then
    -- theme.wallpaper = wallpaper1
-- elseif awful.util.file_readable(wpscript) then
--   theme.wallpaper_cmd = { "sh ~/.wallpaper &" }
-- end
    --
-- if awful.util.file_readable(wallpaper1) then
  -- theme.wallpaper = wallpaper1
-- elseif awful.util.file_readable(wallpaper2) then
  -- theme.wallpaper = wallpaper2
-- elseif awful.util.file_readable(wpscript) then
  -- theme.wallpaper_cmd = { "sh " .. wpscript }
-- elseif awful.util.file_readable(wallpaper3) then
  -- theme.wallpaper = wallpaper3
-- else
  -- theme.wallpaper = wallpaper4
-- end
--}}}
theme.background                    = "#000000"
-- theme.font                          = "Terminus 9"
-- theme.font                          = "Oxygen-Sans Sans-Book 7"
theme.font                          = "Panton light 11"
theme.fg_normal                     = "#e8e8e8"
theme.fg_focus                      = "#F0DFAF"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = "#2f343f96" -- main top title bar BG color
theme.fg_dark                       = "#2f343f"


-- theme.bg_focus                      = "#5a98c8" -- right click menu bg for selected item
theme.bg_focus                      = "#FFFFFF" -- right click menu bg for selected item
theme.bg_urgent                     = "#2f343f"
theme.border_width                  = "0"
theme.border_normal                 = "#3F3F3F"
theme.border_focus                  = "#7F7F7F"
theme.border_marked                 = "#CC9393"
theme.titlebar_bg_focus             = "#FFFFFF"
theme.titlebar_bg_normal            = "#FFFFFF"


theme.taglist_bg_occupied           = "#d7ff8096"
-- theme.taglist_shape                 = gears.shape.parallelogram
-- theme.taglist_spacing               = 0
theme.taglist_fg_occupied           = "#1a1a1a"
theme.taglist_bg_focus              = "#b5d66ci"
theme.taglist_fg_focus              = "#1a1a1a"

theme.taglist_bg_empty              = "#d7ff80"
theme.taglist_fg_empty              = "#ccf27a"
theme.taglist_bg_selected           = "#c2e673"
-- theme.taglist_

theme.tasklist_bg_normal            = "#46464668" -- other apps on same screen
theme.tasklist_fg_normal            = "#e4d482"
theme.tasklist_bg_focus             = "#d4ed4c35" -- Currently using app
theme.tasklist_fg_focus             = "#ffffff"

theme.textbox_widget_margin_top     = 15
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = "#1f1f1f"
theme.notify_border                 = theme.border_focus
theme.awful_widget_height           = 15
theme.awful_widget_margin_top       = 0
theme.mouse_finder_color            = "#CC9393"
theme.bar_height                    = 18
theme.menu_height                   = "30"
theme.menu_width                    = "200"

theme.arrow_bg_1                    = "#d7ff80"
theme.arrow_bg_2                    = "#A7C56D"
theme.arrow_bg_3                    = "#8FA864"
theme.arrow_bg_4                    = "#778B5A"
theme.arrow_bg_5                    = "#5F6E51"
theme.arrow_bg_6                    = "#475148"
theme.arrow_bg_7                    = "#a63737"
theme.arrow_bg_8                    = "#313131"
-- theme.arrow_bg_9                    = "#"

theme.larrow_bg_1                   = "#d7ff80"

theme.menu_submenu_icon             = themedir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themedir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themedir .. "/icons/square_unsel.png"

theme.layout_tile                   = themedir .. "/icons/tile.png"
theme.layout_tilegaps               = themedir .. "/icons/tilegaps.png"
theme.layout_tileleft               = themedir .. "/icons/tileleft.png"
theme.layout_tilebottom             = themedir .. "/icons/tilebottom.png"
theme.layout_tiletop                = themedir .. "/icons/tiletop.png"
theme.layout_fairv                  = themedir .. "/icons/fairv.png"
theme.layout_fairh                  = themedir .. "/icons/fairh.png"
theme.layout_spiral                 = themedir .. "/icons/spiral.png"
theme.layout_dwindle                = themedir .. "/icons/dwindle.png"
theme.layout_max                    = themedir .. "/icons/max.png"
theme.layout_fullscreen             = themedir .. "/icons/fullscreen.png"
theme.layout_magnifier              = themedir .. "/icons/magnifier.png"
theme.layout_floating               = themedir .. "/icons/floating.png"

theme.arrl                          = themedir .. "/icons/arrl.png"
theme.arrl_dl                       = themedir .. "/icons/arrl_dl.png"
theme.arrl_ld                       = themedir .. "/icons/arrl_ld.png"
theme.arrl_ld_sf                    = themedir .. "/icons/arrl_ld_sf.png"

-- theme.bg_systray                    = theme.bg_normal
theme.bg_systray                    = theme.bg_normal
-- colored arrows & icons
theme.arr1                          = themedir .. "/icons/powerarrow/arr1.png"
theme.arr2                          = themedir .. "/icons/powerarrow/arr2.png"
theme.arr3                          = themedir .. "/icons/powerarrow/arr3.png"
theme.arr4                          = themedir .. "/icons/powerarrow/arr4.png"
theme.arr5                          = themedir .. "/icons/powerarrow/arr5.png"
theme.arr6                          = themedir .. "/icons/powerarrow/20/arr6.png"
theme.arr6e                         = themedir .. "/icons/powerarrow/20/arr6_end.png"

theme.arr7                          = themedir .. "/icons/powerarrow/20/arr7.png"
theme.arrclr                        = themedir .. "/icons/powerarrow/20/arrow_clr.png"
theme.arr8                          = themedir .. "/icons/powerarrow/arr8.png"
theme.arr9                          = themedir .. "/icons/powerarrow/arr9.png"

theme.arrby                          = themedir .. "/icons/powerarrow/arr2by.png"
theme.arryb                          = themedir .. "/icons/powerarrow/arr2yb.png"

theme.larr1                         = themedir .. "/icons/powerarrow/20/larr1.png"

theme.pa_cpu                        = themedir .. "/icons/powerarrow/cpu.png"
-- theme.pa_net                        = themedir .. "/icons/powerarrow/net.png"
theme.pa_net                        = themedir .. "/icons/wifi20.png"

theme.widget_ac                     = themedir .. "/icons/ac.png"
theme.widget_battery                = themedir .. "/icons/battery.png"
theme.widget_battery_low            = themedir .. "/icons/battery_low.png"
theme.widget_battery_empty          = themedir .. "/icons/battery_empty.png"
theme.widget_mem                    = themedir .. "/icons/mem.png"
theme.widget_cpu                    = themedir .. "/icons/cpu.png"
theme.widget_temp                   = themedir .. "/icons/temp.png"
theme.widget_net                    = themedir .. "/icons/net.png"
theme.widget_hdd                    = themedir .. "/icons/hdd.png"
theme.widget_music                  = themedir .. "/icons/note.png"
theme.widget_music_on               = themedir .. "/icons/note_on.png"
theme.widget_vol                    = themedir .. "/icons/vol.png"
theme.widget_vol_low                = themedir .. "/icons/vol_low.png"
theme.widget_vol_no                 = themedir .. "/icons/vol_no.png"
theme.widget_vol_mute               = themedir .. "/icons/vol_mute.png"
theme.widget_mail                   = themedir .. "/icons/mail.png"
theme.widget_mail_on                = themedir .. "/icons/mail_on.png"


theme.chrome                        = themedir .. "/icons/google-chrome.png"
-- theme.firefox                       = themedir .. "/icons/firefox.png"
theme.firefox                       = themedir .. "/icons/firefox3.png"
theme.files                         = themedir .. "/icons/file-manager.png"
theme.terminal                      = themedir .. "/icons/term.png"
theme.debian                        = themedir .. "/icons/debian.png"
theme.ubuntu                        = themedir .. "/icons/ubuntu.png"
theme.ubuntu_drk                    = themedir .. "/icons/start-here-ubuntu2.png"
theme.virtual_box                   = themedir .. "/icons/virtual-box.png"

theme.term_icon                     = themedir .. "/icons/term.png"
theme.www_icon                      = themedir .. "/icons/chromes.png"
theme.gimp_icon                     = themedir .. "/icons/gimpish.png"
theme.folder                        = themedir .. "/icons/folder.png"
theme.notify                        = themedir .. "/icons/notify.png"

theme.battery_100                   = themedir .. "/icons/gpm-battery-100.png"
theme.battery_80                    = themedir .. "/icons/gpm-battery-080.png"
theme.battery_60                    = themedir .. "/icons/gpm-battery-060.png"
theme.battery_40                    = themedir .. "/icons/gpm-battery-040.png"
theme.battery_20                    = themedir .. "/icons/gpm-battery-020.png"
theme.battery_00                    = themedir .. "/icons/gpm-battery-000.png"
theme.battery_100_charging          = themedir .. "/icons/gpm-battery-100-charging.png"
theme.battery_80_charging           = themedir .. "/icons/gpm-battery-080-charging.png"
theme.battery_60_charging           = themedir .. "/icons/gpm-battery-060-charging.png"
theme.battery_40_charging           = themedir .. "/icons/gpm-battery-040-charging.png"
theme.battery_20_charging           = themedir .. "/icons/gpm-battery-020-charging.png"
theme.battery_00_charging           = themedir .. "/icons/gpm-battery-000-charging.png"
theme.battery_ac                    = themedir .. "/icons/gpm-ac-adapter.png"
theme.battery_empty                 = themedir .. "/icons/gpm-battery-empty.png"
theme.keyboard                      = themedir .. "/icons/keyboard.png"
theme.touchcali                     = themedir .. "/icons/touch-cali.png"
theme.burp_icon                     = themedir .. "/icons/burp.png"
theme.sqlite_icon                     = themedir .. "/icons/sqlitestudio.png"

theme.icon_theme_size = "64x64"

theme.tasklist_disable_icon         = false
theme.tasklist_floating             = ""
theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

-- theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"
theme.awesome_icon = themedir .. "/icons/awesome16-arrow.png"
theme.awesome_lg_icon = themedir .. "/icons/awesome16-2.png"


theme.datewidget_fg                 = "#353638"

theme.graph_line_color              = "#d7ff80FF"
theme.graph_color                   = "#a6d61bBF"

return theme
