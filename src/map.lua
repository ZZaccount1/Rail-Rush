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

function lineSquareColl(squareX, squareY, squareW, squareH, line1X, line1Y, line2X, line2Y)
    -- check if any of the line endpoints is inside the square
    if (line1X >= squareX and line1X <= squareX + squareW and line1Y >= squareY and line1Y <= squareY + squareH) or
       (line2X >= squareX and line2X <= squareX + squareW and line2Y >= squareY and line2Y <= squareY + squareH) then
      return true
    end
  
    -- check if any of the square's sides intersect with the line segment
    local corners = {{squareX, squareY}, {squareX + squareW, squareY}, {squareX, squareY + squareH}, {squareX + squareW, squareY + squareH}}
    for i = 1, #corners do
        local j = i % #corners + 1
        if doLineSegmentsIntersect(line1X, line1Y, line2X, line2Y, corners[i][1], corners[i][2], corners[j][1], corners[j][2]) then
            return true
        end
    end
  
    return false
end
  
  -- helper function to check if two line segments intersect
function doLineSegmentsIntersect(aX, aY, bX, bY, cX, cY, dX, dY)
    local s1_x, s1_y, s2_x, s2_y = bX - aX, bY - aY, dX - cX, dY - cY
    local s, t = (-s1_y * (aX - cX) + s1_x * (aY - cY)) / (-s2_x * s1_y + s1_x * s2_y), ( s2_x * (aY - cY) - s2_y * (aX - cX)) / (-s2_x * s1_y + s1_x * s2_y)
    return s >= 0 and s <= 1 and t >= 0 and t <= 1
end

return
{
    load = function(...) return map:load(...) end,
    draw = function(...) return map:draw(...) end,
}