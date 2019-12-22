
function barGradient(
        startRGB, -- starting color, example: {255, 255, 255}
        endRGB, -- ending color, example: {0, 0, 0}
        val, -- value: 50
        min, -- min value: 0
        max)  -- max value: 100

    local rgb = {}
    
    local x = (val - min)/(max-min)

    table.insert(rgb, x * startRGB[1] + x * endRGB[1])
    table.insert(rgb, x * startRGB[2] + x * endRGB[2])
    table.insert(rgb, x * startRGB[3] + x * endRGB[3])

    return rgb
end


function rgbToHex(rgb)
    return decToHex(rgb[1]) .. decToHex(rgb[2]) .. decToHex(rgb[3])
end


function decToHex(dec)

    
    -- naughty.notify({ preset = naughty.config.presets.critical,
    --                  title = "dec to hex",
    --                  text = string.format("%d", dec) })

    local b = 16
    local k = "0123456789ABCDEF"
    local hex = ""
    local i = 0
    local d

    while dec > 0 do

        -- local h = ""
        i=i+1

        dec,d = math.floor(dec/b),math.fmod(dec,b)+1
        hex = string.sub(k,math.floor(d),math.floor(d)) .. hex

        -- if (string.len(h) == 0) then 
        --     h = '00'
        -- elseif (string.len(h) == 1) then
        --     h = '0' .. h
        -- end

        -- hex = hex .. h
    end

    return hex
end
