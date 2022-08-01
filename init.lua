
local awful = require("awful")

local capi = {
    screen = screen,
}


local infinite = {
    screen = {},
    tags = {},
}

local shelf = capi.screen.fake_add(
    -capi.screen[1].geometry.width, -capi.screen[1].geometry.height,
     capi.screen[1].geometry.width,  capi.screen[1].geometry.height
)

function infinite.screen.get(index)
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

function infinite.screen.activate(taglist)
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

-- infinite.tags.move(client).to(taglist)
function infinite.tags.move(client)
    return {
        to = function (taglist)
            local tag = from(taglist).get_selected_or_first()
            client:move_to_tag(tag)
        end,
    }
end

-- infinite.screen.move(client).around()
function infinite.screen.move(client)
    return {
        around = function ()
            client:move_to_screen()
            if client.screen == shelf then
                client:move_to_screen()
            end
        end,
    }
end

setmetatable (infinite.screen, {
    __call = function (_, index) return infinite.screen.get(index) end,
})

return infinite

