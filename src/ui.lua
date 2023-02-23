ui = {}

ui.woodAmount = 0
ui.stoneAmount = 0

ui.textScale = 20

ui.drawWin = false
ui.drawLose = false

local iconScale = 2.5

function ui:load()
    ui.defaultFont = love.graphics.newFont(ui.textScale)
    love.graphics.setFont(ui.defaultFont)

    ui.spriteSheet = love.graphics.newImage("sprites/icons.png")
    ui.woodIcon = love.graphics.newQuad(0,0,11,10, ui.spriteSheet)
    ui.stoneIcon = love.graphics.newQuad(11,0,11,11, ui.spriteSheet)
end

function ui:draw()
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
        love.graphics.print("You Win!", windowW/2, windowH/2)
    elseif ui.drawLose then
        ui.drawWin = false
        love.graphics.print("You Lost!", windowW/2, windowH/2)
    end
end

return
{
    load = function(...) return ui:load(...) end,
}