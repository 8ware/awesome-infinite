
local awful = require("awful")

local capi = {
    screen = screen,
}


local versatile = {}

local shelf = capi.screen.fake_add(
    -capi.screen[1].geometry.width, -capi.screen[1].geometry.height,
     capi.screen[1].geometry.width,  capi.screen[1].geometry.height
)

function versatile.screen(index)
    return capi.screen[index] or shelf
end

local function move(taglist)
    return {
        to = function (screen)
            for _, tag in ipairs (taglist) do
                tag.screen = screen
            end
        end,
    }
end

function versatile.activate(taglist)
    local screen = awful.screen.focused()
    move(screen.tags).to(shelf)
    move(taglist).to(screen)
end

local function from(taglist)
    return {
        get_selected_or_first = function ()
            for _, tag in ipairs (taglist) do
                if tag.selected then
                    return tag
                end
            end

            return taglist[0]
        end,
    }
end

function versatile.move(client)
    return {
        to = function (taglist)
            local tag = from(taglist).get_selected_or_first()
            client:move_to_tag(tag)
        end,
    }
end

return versatile

