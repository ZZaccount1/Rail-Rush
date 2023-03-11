minecart = {}

railwayTriggers = {}
emptyRailways = {}
endTrigger = nil

minecart.startX = 0
minecart.startY = 0

minecart.orientation = ""

minecart.easySpeed = 15
minecart.mediumSpeed = 20
minecart.hardSpeed = 35

minecart.speedIncreaseEasy = 0.3
minecart.speedIncreaseMedium = 0.50
minecart.speedIncreaseHard = 0.80


minecart.speed = 25
minecart.speedIncrease = 0.5

function minecart:load()
    minecart.x = minecart.startX
    minecart.y = minecart.startY
    minecart.w = 16
    minecart.h = 16
    
    minecart.spriteSheet = love.graphics.newImage("sprites/props.png")
    minecart.quadH = love.graphics.newQuad(16,16,minecart.w,minecart.h, minecart.spriteSheet)
    minecart.quadV = love.graphics.newQuad(16,16*2,minecart.w,minecart.h, minecart.spriteSheet)
    minecart.quad = minecart.quadH
end

function minecart:update(dt)
    if pause or ui.tutorial or ui.pickDifficulty then return end

    minecart.speed = minecart.speed + minecart.speedIncrease  * dt

    for i,o in ipairs(railwayTriggers) do
        local x = minecart.x
        local y = minecart.y
        local w = minecart.w
        local h = minecart.h
        local trigX = o.x
        local trigY = o.y
        local trigW = o.width
        local trigH = o.height

        if x + w > trigX and
           x < trigX + trigW and 
           y + h > trigY and 
           y < trigY + trigH then
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
        if x + w > trigX and x < trigX + trigW and y + h > trigY and y < trigY + trigH and not o.builded then
            pause = true
            ui.drawLose = true
        end
    end

    if minecart.x + minecart.w > endTrigger.x and
       minecart.x < endTrigger.x + endTrigger.width and
       minecart.y + minecart.h > endTrigger.y and
       minecart.y < endTrigger.y + endTrigger.height then
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

    love.graphics.draw(minecart.spriteSheet, minecart.quad, minecart.x, minecart.y - 3.75)

    love.graphics.scale(1)
    cam:detach()
end

return 
{
    load = function(...) return minecart:load(...) end,
    update = function(...) return minecart:update(...) end,
}