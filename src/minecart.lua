minecart = {}

railwayTriggers = {}
emptyRailways = {}

minecart.startX = 0
minecart.startY = 0

minecart.orientation = ""

minecart.speed = 18

function minecart:load()
    minecart.x = minecart.startX
    minecart.y = minecart.startY
    minecart.w = 16
    minecart.h = 16

    self.collider = worldMap:newRectangleCollider(minecart.x*globalScale, minecart.y*globalScale, 16*globalScale, 16*globalScale)
    self.collider:setType("static")

    minecart.spriteSheet = love.graphics.newImage("sprites/props.png")
    minecart.quad = love.graphics.newQuad(16,16,minecart.w,minecart.h, minecart.spriteSheet)
end

function minecart:update(dt)
    if lost then return end

    for i,o in ipairs(railwayTriggers) do
        local x = minecart.x
        local y = minecart.y
        local w = minecart.w
        local h = minecart.h
        local trigX = o.x
        local trigY = o.y
        local trigW = o.width
        local trigH = o.height

        if x + w > trigX and x < trigX + trigW and y + h > trigY and y < trigY + trigH then
            print("trigger", i)
            minecart.orientation = o.properties["newOrientation"]
        end
    end

    for i,o in ipairs(emptyRailways) do
        local x = minecart.x
        local y = minecart.y
        local w = minecart.w
        local h = minecart.h
        local trigX = o.x
        local trigY = o.y
        local trigW = o.w / globalScale
        local trigH = o.h / globalScale

        print("builded", o.builded)
        if x + w > trigX and x < trigX + trigW and y + h > trigY and y < trigY + trigH and not o.builded then
            lost = true
            print("empty layer trig")
        end
    end

    -- Move
    if minecart.orientation == "d" then
        minecart.x = minecart.x + minecart.speed * dt
    elseif minecart.orientation == "s" then
        minecart.y = minecart.y + minecart.speed * dt
    elseif minecart.orientation == "a" then
        minecart.x = minecart.x - minecart.speed * dt
    elseif minecart.orientation == "w" then
        minecart.y = minecart.y - minecart.speed * dt
    end
end

function minecart:draw()
    cam:attach()
    love.graphics.scale(globalScale)

    love.graphics.draw(minecart.spriteSheet, minecart.quad, minecart.x, minecart.y)

    love.graphics.scale(1)
    cam:detach()
end

return 
{
    load = function(...) return minecart:load(...) end,
    update = function(...) return minecart:update(...) end,
}