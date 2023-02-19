map = {}

local scale = 3.2

function map:load()
    gameMap = sti("maps/mainMap.lua")
end

function map:draw()
    cam:attach()
        love.graphics.scale(scale)
        gameMap:drawLayer(gameMap.layers["ground"])
        gameMap:drawLayer(gameMap.layers["railway"])
        love.graphics.scale(1)
    cam:detach()
end

return
{
    load = function(...) return map:load(...) end,
    draw = function(...) return map:draw(...) end,
}