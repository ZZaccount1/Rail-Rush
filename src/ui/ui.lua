ui = {}

ui.woodAmount = 0
ui.stoneAmount = 0

ui.textScale = 20 * scaleRatio

-- Different menus
ui.isTutorial = true
ui.pickDifficulty = false
ui.drawWin = false
ui.drawLose = false

difficulty = "easy"

local iconScale = 2.5 * scaleRatio
local buttons = {}
local offset = 100 * scaleRatio

-- Tutorial variables
ui.tutorial = {}
ui.tutorial.treeStepID = 0
ui.tutorial.rockStepID = 1
ui.tutorial.railStepID = 2

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
    ui:loadDifficultyMenu(true)
    
    saveTutorialCompletionStatus(true)
end

function ui:loadDifficultyMenu(value)
    ui.isTutorial = not value
    pause = value
    ui.pickDifficulty= value
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
    -- Gooi setup
    style = {
        showBorder = true,
        bgColor = {0.208, 0.220, 0.222, 0.5},
    }
    gooi.setStyle(style)

    local joyOffsetX = 12 * scaleRatio
    local joyOffsetY = 25 * scaleRatio
    local joySize = 100 * scaleRatio

    movementJoystick = gooi.newJoy({
        x = joyOffsetX,
        y = windowH - joySize - joyOffsetY,
        size = joySize,
    })
    attackJoystick = gooi.newJoy({
        x = windowW - joySize - joyOffsetX,
        y = windowH - joySize - joyOffsetY,
        size = joySize,
    }):onRelease(function()
        if player.attackLine.hoveredObj then
            player.attackLine.hoveredObj:hit()
        end
    end)
    
    -- Create button variables
    buttons.easy = {x=0, y=0, w=125*scaleRatio, h=40*scaleRatio, text="Super Easy"}
    buttons.medium = {x=0, y=0, w=125*scaleRatio, h=40*scaleRatio, text="Very Easy"}
    buttons.hard = {x=0, y=0, w=75*scaleRatio, h=40*scaleRatio, text="Easy"}

    -- Create difficulty buttons
    style = {
        showBorder = true,
        bgColor = {0.208, 0.220, 0.222, 1},
    }
    gooi.setStyle(style)
    
    local buttonsW = 430
    local buttonsH = 50

    difficultyPanel = gooi.newPanel({
        x = (windowW/2)-(buttonsW/2),
        y = (windowH/2)-(buttonsH/2),
        w = buttonsW,
        h = buttonsH,
        layout = "grid 1x3"
    })

    easyButton = gooi.newButton({ text = "Super Easy" }):onRelease(function()
        ui.pickDifficulty = false
        pause = false

        difficulty = "easy"

        interactionRadius = 110 * scaleRatio

        minecart.speed = minecart.easySpeed
        minecart.speedIncrease = minecart.speedIncreaseEasy

        gameStart()
    end)
    mediumButton = gooi.newButton({ text = "Very Easy" }):onRelease(function()
        ui.pickDifficulty = false
        pause = false

        difficulty = "medium"

        interactionRadius = 90 * scaleRatio
                
        minecart.speed = minecart.mediumSpeed
        minecart.speedIncrease = minecart.speedIncreaseMedium

        gameStart()
    end)
    hardButton = gooi.newButton({ text = "Easy" }):onRelease(function()
        ui.pickDifficulty = false
        pause = false

        difficulty = "hard"

        interactionRadius = 75 * scaleRatio

        minecart.speed = minecart.hardSpeed
        minecart.speedIncrease = minecart.speedIncreaseHard
                
        gameStart()
    end)
    difficultyPanel:add(easyButton)
    difficultyPanel:add(mediumButton)
    difficultyPanel:add(hardButton)

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
        ui:loadDifficultyMenu(true)
    end
end

function ui:update(dt)
    difficultyPanel:setVisible(ui.pickDifficulty)

    movementJoystick:setVisible(mobile)
    attackJoystick:setVisible(mobile)
end

function ui:draw()
    -- Draw the amount of items
    love.graphics.draw(ui.spriteSheet, ui.woodIcon, 10, 10, nil, iconScale, iconScale)
    love.graphics.draw(ui.spriteSheet, ui.stoneIcon, 10, 10*2+ui.textScale, nil, iconScale, iconScale)
    love.graphics.print("wood: "..ui.woodAmount, 10+12*iconScale, 10)
    love.graphics.print("stone: "..ui.stoneAmount, 10+12*iconScale, 10*2 + ui.textScale)

    -- Draw the tutorial
    if ui.isTutorial then
        -- Draw the arrow
        cam:attach()
        if ui.tutorialStep == ui.tutorial.treeStepID then
            love.graphics.draw(ui.tutorialArrow, ui.tutorialTree.x * globalScale - 4 - ui.tutorialArrow:getWidth()*globalScale, ui.tutorialTree.y * globalScale + 48 - ui.tutorialArrow:getHeight()*globalScale, nil, globalScale, globalScale)
        elseif ui.tutorialStep == ui.tutorial.rockStepID then
            love.graphics.draw(ui.tutorialArrow, ui.tutorialRock.x * globalScale - ui.tutorialArrow:getWidth()*globalScale, ui.tutorialRock.y * globalScale - ui.tutorialArrow:getHeight()*globalScale, nil, globalScale, globalScale)
        elseif ui.tutorialStep == ui.tutorial.railStepID then
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
    love.graphics.setColor(23/255, 32/255, 56/255, 0.5)
    love.graphics.rectangle("fill", 0, 0, windowW, windowH)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Pick the difficulty", windowW/2 - ui.defaultFont:getWidth("Pick the difficulty")/2, windowH/3)
end

function ui:keypressed(k)
    if ui.isTutorial then
        if k == "h" then
            ui:endTutorial()
        end    
    end
end

return
{
    load = function(...) return ui:load(...) end,
    update = function(...) return ui:update(...) end,
    keypressed = function(...) return ui:keypressed(...) end,
}