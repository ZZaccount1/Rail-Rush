map = {}

local scale = 3.2

function map:load()
    gameMap = sti("maps/mainMap.lua")
end

function map:draw()
    gameMap:draw(0,0,scale)
end

return
{
    load = function(...) return map:load(...) end,
    draw = function(...) return map:draw(...) end,
}