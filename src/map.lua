map = {}

map.entities = {}

-- Radius in which player can interact with the rock
interactionRadius = 90 * scaleRatio

function map:load()
    -- Load the map
    gameMap = sti("maps/default.lua")

    -- Go through every single item from the "entity" layer
    for i,v in ipairs(gameMap.layers["entity"].objects) do
        if v.class == "stone" then
			local entity = rock(v.x, v.y)

            if v.properties["tutorial"] then
                ui.tutorialRock = v
                entity.tutorial = true
            end

            table.insert(map.entities, entity)
        elseif v.class == "tree" then
            local entity = tree(v.x, v.y)

            if v.properties["tutorial"] then
                ui.tutorialTree = v
                entity.tutorial = true
            end

            table.insert(map.entities, entity)
        elseif v.class == "emptyRailway" then
            local entity = rwTile(v.x, v.y, v.properties["orientation"])

            if v.properties["tutorial"] then
                ui.tutorialRW = v
                entity.tutorial = true
            end

            table.insert(map.entities, entity)
            table.insert(emptyRailways, entity)
        elseif v.class == "minecartStart" then
            minecart.startX = v.x
            minecart.startY = v.y
            minecart.orientation = v.properties["startOrientation"]
        elseif v.class == "minecartEnd" then
            endTrigger = v
        elseif v.class == "railwayTrigger" then
            table.insert(railwayTriggers, v)
        end
	end

    world:generateSolid()
end

function map:gameStart()
    for i,v in ipairs(map.entities) do
        if v.gameStart then
            v:gameStart()
        end
    end
end

function map:draw()
    cam:attach()
    love.graphics.scale(globalScale)
        
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["railway"])

    for i in ipairs(map.entities) do
        map.entities[i]:draw()
    end
    
    love.graphics.scale(1)

    cam:detach()
    minecart:draw()
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