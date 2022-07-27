
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

return versatile

