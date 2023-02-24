ui = {}

ui.woodAmount = 0
ui.stoneAmount = 0

ui.textScale = 20

ui.pickDifficulty = true
ui.drawWin = false
ui.drawLose = false

local iconScale = 2.5
local buttons = {}

function ui:load()
    buttons.easy = {x=0, y=0, w=75, h=40, text="Easy"}
    buttons.medium = {x=0, y=0, w=100, h=40, text="Medium"}
    buttons.hard = {x=0, y=0, w=75, h=40, text="Hard"}

    centerX = windowW / 2
    centerY = windowH / 2 

    local offset = 100

    buttons.medium.x = centerX - buttons.medium.w / 2
    buttons.easy.x = centerX - buttons.easy.w - offset
    buttons.hard.x = centerX + offset 

    buttons.medium.y = centerY
    buttons.easy.y = centerY
    buttons.hard.y = centerY

    ui.defaultFont = love.graphics.newFont(ui.textScale)
    love.graphics.setFont(ui.defaultFont)

    ui.spriteSheet = love.graphics.newImage("sprites/icons.png")
    ui.woodIcon = love.graphics.newQuad(0,0,11,10, ui.spriteSheet)
    ui.stoneIcon = love.graphics.newQuad(11,0,11,11, ui.spriteSheet)
end

function ui:draw()
    if ui.pickDifficulty then
        ui:difficultyMenuDraw()
        return
    end

    love.graphics.draw(ui.spriteSheet, ui.woodIcon, 10, 10, nil, iconScale, iconScale)
    love.graphics.draw(ui.spriteSheet, ui.stoneIcon, 10, 10*2+ui.textScale, nil, iconScale, iconScale)
    love.graphics.print("wood: "..ui.woodAmount, 10+12*iconScale, 10)
    love.graphics.print("stone: "..ui.stoneAmount, 10+12*iconScale, 10*2 + ui.textScale)

    if pause then
        love.graphics.setColor(75/255, 0, 130/255, 0.5)
        love.graphics.rectangle("fill", 0, 0, windowW, windowH)
        love.graphics.setColor(1,1,1,1)
    end

    if ui.drawWin then
        ui.drawLose = false
        love.graphics.print("You Win!", windowW/2 - ui.defaultFont:getWidth("You Lost!")/2, windowH/2 - ui.defaultFont:getHeight()/2)
    elseif ui.drawLose then
        ui.drawWin = false
        love.graphics.print("You Lost!", windowW/2 - ui.defaultFont:getWidth("You Lost!")/2, windowH/2 - ui.defaultFont:getHeight()/2)
    end
end

function ui:difficultyMenuDraw()
    -- Draw the bg
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", 0, 0, windowW, windowH)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Pick the difficulty", windowW/2 - ui.defaultFont:getWidth("Pick the difficulty")/2, 25)
    

    -- Draw the bg
    love.graphics.rectangle("line", buttons.easy.x,   buttons.easy.y,   buttons.easy.w,   buttons.easy.h)
    love.graphics.rectangle("line", buttons.medium.x, buttons.medium.y, buttons.medium.w, buttons.medium.h)
    love.graphics.rectangle("line", buttons.hard.x,   buttons.hard.y,   buttons.hard.w,   buttons.hard.h)

    -- Draw the text for each button
    local easyTextSize = ui.defaultFont:getWidth("Easy")/2
    local mediumTextSize = ui.defaultFont:getWidth("Medium")/2
    local hardTextSize = ui.defaultFont:getWidth("Hard")/2
    love.graphics.print(buttons.easy.text, buttons.easy.x + buttons.easy.w / 2 - easyTextSize, centerY + buttons.easy.h / 2 - love.graphics.getFont():getHeight() / 2)
    love.graphics.print(buttons.medium.text, buttons.medium.x + buttons.medium.w / 2 - mediumTextSize, centerY + buttons.medium.h / 2 - love.graphics.getFont():getHeight() / 2)
    love.graphics.print(buttons.hard.text, buttons.hard.x + buttons.hard.w / 2 - hardTextSize, centerY + buttons.hard.h / 2 - love.graphics.getFont():getHeight() / 2)
end

function ui:mousepressed(x, y, button, istouch)
    if button == 1 and ui.pickDifficulty then
        -- Check if the mouse is within the Easy button
        if x >= buttons.easy.x and x <= buttons.easy.x + buttons.easy.w and
           y >= buttons.easy.y and y <= buttons.easy.y + buttons.easy.h then
            -- The Easy button is pressed
            print("Easy button pressed")
            ui.pickDifficulty = false
            pause = false

            minecart.speed = minecart.easySpeed
            minecart.speedIncrease = minecart.speedIncreaseEasy
        end

        -- Check if the mouse is within the Medium button
        if x >= buttons.medium.x and x <= buttons.medium.x + buttons.medium.w and
           y >= buttons.medium.y and y <= buttons.medium.y + buttons.medium.h then
            -- The Medium button is pressed
            print("Medium button pressed")
            ui.pickDifficulty = false
            pause = false

            minecart.speed = minecart.mediumSpeed
            minecart.speedIncrease = minecart.speedIncreaseMedium
        end

        -- Check if the mouse is within the Hard button
        if x >= buttons.hard.x and x <= buttons.hard.x + buttons.hard.w and
           y >= buttons.hard.y and y <= buttons.hard.y + buttons.hard.h then
            -- The Hard button is pressed
            print("Hard button pressed")
            ui.pickDifficulty = false
            pause = false

            minecart.speed = minecart.hardSpeed
            minecart.speedIncrease = minecart.speedIncreaseHard
        end
    end
end

return
{
    load = function(...) return ui:load(...) end,
    mousepressed = function(...) return ui:mousepressed(...) end,
}