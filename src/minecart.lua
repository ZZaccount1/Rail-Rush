minecart = {}

railwayTriggers = {}
emptyRailways = {}
endTrigger = nil

minecart.startX = 0
minecart.startY = 0

minecart.orientation = ""

minecart.easySpeed = 20
minecart.mediumSpeed = 30
minecart.hardSpeed = 40

minecart.speedIncreaseEasy = 0.5
minecart.speedIncreaseMedium = 0.75
minecart.speedIncreaseHard = 0.95


minecart.speed = 25
minecart.speedIncrease = 0.5

function minecart:load()
    minecart.x = minecart.startX
    minecart.y = minecart.startY
    minecart.w = 16
    minecart.h = 16
    
    --minecart.collider = worldMap:newRectangleCollider(minecart.x*globalScale, minecart.y*globalScale, 16*globalScale, 16*globalScale)
    --minecart.collider:setType("static")
    
    minecart.spriteSheet = love.graphics.newImage("sprites/props.png")
    minecart.quadH = love.graphics.newQuad(16,16,minecart.w,minecart.h, minecart.spriteSheet)
    minecart.quadV = love.graphics.newQuad(16,16*2,minecart.w,minecart.h, minecart.spriteSheet)
    minecart.quad = minecart.quadH
end

function minecart:update(dt)
    if pause then return end

    --print("speed:",minecart.speed, "speedIncrease:",minecart.speedIncrease)

    minecart.speed = minecart.speed + minecart.speedIncrease  * dt

    --print(minecart.speed)

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

        --print("builded", o.builded)
        if x + w > trigX and x < trigX + trigW and y + h > trigY and y < trigY + trigH and not o.builded then
            pause = true
            ui.drawLose = true
            print("empty layer trig")
        end
    end

    if minecart.x + minecart.w > endTrigger.x and minecart.x < endTrigger.x + endTrigger.width and minecart.y + minecart.h > endTrigger.y and minecart.y < endTrigger.y + endTrigger.height then
        minecart.speed = 0
        pause = true
        ui.drawWin = true
    end

    -- Move
    if minecart.orientation == "d" then
        minecart.x = minecart.x + minecart.speed * dt
        minecart.quad = minecart.quadH
    elseif minecart.orientation == "s" then
        minecart.y = minecart.y + minecart.speed * dt
        minecart.quad = minecart.quadV
    elseif minecart.orientation == "a" then
        minecart.x = minecart.x - minecart.speed * dt
        minecart.quad = minecart.quadH
    elseif minecart.orientation == "w" then
        minecart.y = minecart.y - minecart.speed * dt
        minecart.quad = minecart.quadV
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