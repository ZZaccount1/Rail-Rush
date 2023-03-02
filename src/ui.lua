ui = {}

ui.woodAmount = 0
ui.stoneAmount = 0

ui.textScale = 20 * scaleRatio

-- Different menus
ui.tutorial = true
ui.pickDifficulty = false
ui.drawWin = false
ui.drawLose = false

local iconScale = 2.5 * scaleRatio
local buttons = {}
local offset = 100 * scaleRatio

-- If the tutorial was completed
function saveTutorialCompletionStatus(completed)
    love.filesystem.write("tutorial.dat", tostring(completed))
end
  
-- Load the tutorial completion status from a file
function loadTutorialCompletionStatus()
    if love.filesystem.getInfo("tutorial.dat") then
        local contents = love.filesystem.read("tutorial.dat")
        return contents == "true"
    end
    return false
end

function ui:endTutorial()
    ui.tutorial = false
    ui.pickDifficulty= true
    saveTutorialCompletionStatus(true)
end

function ui:calculateButtonsPos()
    -- Get the position of the center of the screen
    centerX = windowW / 2
    centerY = windowH / 2 

    -- Calculate the X position for the buttons
    buttons.medium.x = centerX - buttons.medium.w / 2
    buttons.easy.x = centerX - buttons.easy.w - offset
    buttons.hard.x = centerX + offset

    -- Calculate the Y position for the buttons
    buttons.medium.y = centerY
    buttons.easy.y = centerY
    buttons.hard.y = centerY
end

function ui:load()
    -- Create button variables
    buttons.easy = {x=0, y=0, w=125*scaleRatio, h=40*scaleRatio, text="Super Easy"}
    buttons.medium = {x=0, y=0, w=125*scaleRatio, h=40*scaleRatio, text="Very Easy"}
    buttons.hard = {x=0, y=0, w=75*scaleRatio, h=40*scaleRatio, text="Easy"}

    ui:calculateButtonsPos()

    -- Create and setup the default font 
    ui.defaultFont = love.graphics.newFont(ui.textScale)
    love.graphics.setFont(ui.defaultFont)

    -- Load the spritesheet and the sprites
    ui.spriteSheet = love.graphics.newImage("sprites/icons.png")
    ui.woodIcon = love.graphics.newQuad(0,0,11,10, ui.spriteSheet)
    ui.stoneIcon = love.graphics.newQuad(11,0,11,11, ui.spriteSheet)
    ui.tutorialArrow = love.graphics.newImage("sprites/arrow.png")

    -- Where is the tutorial in the tutorial
    ui.tutorialStep = 0

    -- Check if already played the tutorial
    if loadTutorialCompletionStatus() then
        ui.tutorial = false
        ui.pickDifficulty= true
    end
end

function ui:draw()
    -- Draw the tutorial
    if ui.tutorial then
        -- Draw the arrow
        cam:attach()
        if ui.tutorialStep == 0 then
            love.graphics.draw(ui.tutorialArrow, ui.tutorialTree.x * globalScale - ui.tutorialArrow:getWidth()*globalScale, ui.tutorialTree.y * globalScale - ui.tutorialArrow:getHeight()*globalScale, nil, globalScale, globalScale)
        elseif ui.tutorialStep == 1 then
            love.graphics.draw(ui.tutorialArrow, ui.tutorialRock.x * globalScale - ui.tutorialArrow:getWidth()*globalScale, ui.tutorialRock.y * globalScale - ui.tutorialArrow:getHeight()*globalScale, nil, globalScale, globalScale)
        elseif ui.tutorialStep == 2 then
            love.graphics.draw(ui.tutorialArrow, ui.tutorialRW.x * globalScale - ui.tutorialArrow:getWidth()*globalScale, ui.tutorialRW.y * globalScale - ui.tutorialArrow:getHeight()*globalScale, nil, globalScale, globalScale)
        else
            ui:endTutorial()
        end
        cam:detach()

        -- Draw the background
        love.graphics.setColor(75/255, 0, 130/255, 0.5)
        love.graphics.rectangle("fill", 0, 0, windowW, windowH)
        love.graphics.setColor(1,1,1,1)

        -- Top text
        love.graphics.print("Tutorial", windowW/2 - ui.defaultFont:getWidth("Tutorial")/2, 0)
        
        local skipTutorText = "Press H to skip the tutorial"
        love.graphics.print(skipTutorText, windowW - ui.defaultFont:getWidth(skipTutorText), windowH - ui.defaultFont:getHeight(skipTutorText))
        return
    end

    -- Draw the menu for picking the difficulty
    if ui.pickDifficulty then
        ui:difficultyMenuDraw()
        return
    end

    -- Draw the amount of items
    love.graphics.draw(ui.spriteSheet, ui.woodIcon, 10, 10, nil, iconScale, iconScale)
    love.graphics.draw(ui.spriteSheet, ui.stoneIcon, 10, 10*2+ui.textScale, nil, iconScale, iconScale)
    love.graphics.print("wood: "..ui.woodAmount, 10+12*iconScale, 10)
    love.graphics.print("stone: "..ui.stoneAmount, 10+12*iconScale, 10*2 + ui.textScale)

    -- Draw the panel when paused
    if pause then
        love.graphics.setColor(75/255, 0, 130/255, 0.5)
        love.graphics.rectangle("fill", 0, 0, windowW, windowH)
        love.graphics.setColor(1,1,1,1)
    end

    -- Draw Lose/Win menu
    if ui.drawWin then
        ui.drawLose = false
        love.graphics.print("You Win!", windowW/2 - ui.defaultFont:getWidth("You Win!")/2, 0)
        love.graphics.print("Press Y to restart", windowW/2 - ui.defaultFont:getWidth("Press Y to restart")/2,  windowH/2 - ui.defaultFont:getHeight()/2)
    elseif ui.drawLose then
        ui.drawWin = false
        love.graphics.print("You Lost!", windowW/2 - ui.defaultFont:getWidth("You Lost!")/2, 0)
        love.graphics.print("Press Y to restart", windowW/2 - ui.defaultFont:getWidth("Press Y to restart")/2,  windowH/2 - ui.defaultFont:getHeight()/2)
    end
end

function ui:difficultyMenuDraw()
    -- Draw the bg
    love.graphics.setColor(75/255, 0, 130/255, 0.5)
    love.graphics.rectangle("fill", 0, 0, windowW, windowH)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Pick the difficulty", windowW/2 - ui.defaultFont:getWidth("Pick the difficulty")/2, 25)
    
    -- Draw the bg
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line", buttons.easy.x,   buttons.easy.y,   buttons.easy.w,   buttons.easy.h)
    love.graphics.rectangle("line", buttons.medium.x, buttons.medium.y, buttons.medium.w, buttons.medium.h)
    love.graphics.rectangle("line", buttons.hard.x,   buttons.hard.y,   buttons.hard.w,   buttons.hard.h)
    love.graphics.setColor(1,1,1,1)

    -- Draw the text for each button
    local easyTextSize = ui.defaultFont:getWidth("Super Easy")/2
    local mediumTextSize = ui.defaultFont:getWidth("Very Easy")/2
    local hardTextSize = ui.defaultFont:getWidth("Easy")/2
    love.graphics.print(buttons.easy.text, buttons.easy.x + buttons.easy.w / 2 - easyTextSize, centerY + buttons.easy.h / 2 - love.graphics.getFont():getHeight() / 2)
    love.graphics.print(buttons.medium.text, buttons.medium.x + buttons.medium.w / 2 - mediumTextSize, centerY + buttons.medium.h / 2 - love.graphics.getFont():getHeight() / 2)
    love.graphics.print(buttons.hard.text, buttons.hard.x + buttons.hard.w / 2 - hardTextSize, centerY + buttons.hard.h / 2 - love.graphics.getFont():getHeight() / 2)
end

function ui:mousepressed(x, y, button, istouch)
    if button == 1 then
        if ui.pickDifficulty then
            -- Check if the mouse is within the Easy button
            if x >= buttons.easy.x and x <= buttons.easy.x + buttons.easy.w and
            y >= buttons.easy.y and y <= buttons.easy.y + buttons.easy.h then
                ui.pickDifficulty = false
                pause = false

                minecart.speed = minecart.easySpeed
                minecart.speedIncrease = minecart.speedIncreaseEasy
            end

            -- Check if the mouse is within the Medium button
            if x >= buttons.medium.x and x <= buttons.medium.x + buttons.medium.w and
            y >= buttons.medium.y and y <= buttons.medium.y + buttons.medium.h then
                ui.pickDifficulty = false
                pause = false

                minecart.speed = minecart.mediumSpeed
                minecart.speedIncrease = minecart.speedIncreaseMedium
            end

            -- Check if the mouse is within the Hard button
            if x >= buttons.hard.x and x <= buttons.hard.x + buttons.hard.w and
            y >= buttons.hard.y and y <= buttons.hard.y + buttons.hard.h then
                ui.pickDifficulty = false
                pause = false

                minecart.speed = minecart.hardSpeed
                minecart.speedIncrease = minecart.speedIncreaseHard
            end
        end
    end
end

function ui:keypressed(k)
    if ui.tutorial then
        if k == "h" then
            ui:endTutorial()
        end    
    end
end

return
{
    load = function(...) return ui:load(...) end,
    mousepressed = function(...) return ui:mousepressed(...) end,
    keypressed = function(...) return ui:keypressed(...) end,
}