map = {}

map.scale = 3.2

map.entities = {}

function map:load()
    gameMap = sti("maps/mainMap.lua")

    for i,v in ipairs(gameMap.layers["entity"].objects) do
		if v.type == "stone" then
			local entity = rock(v.x, v.y, i)
            table.insert(map.entities, entity)
        elseif v.type == "tree" then
            local entity = tree(v.x, v.y)
            table.insert(map.entities, entity)
        end
	end

    world:generateSolid()
end

function map:draw()
    cam:attach()
    love.graphics.scale(map.scale)
        
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["railway"])

    for i in ipairs(map.entities) do
        map.entities[i]:draw()
    end
    
    love.graphics.scale(1)
    cam:detach()
end

function map:onClick(x,y)
    for i in ipairs(map.entities) do
        if map.entities[i].onClick then
            map.entities[i]:onClick(x,y)
        end
    end
end

return
{
    load = function(...) return map:load(...) end,
    draw = function(...) return map:draw(...) end,
}