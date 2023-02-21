ui = {}

ui.woodAmount = 0
ui.stoneAmount = 0

ui.textScale = 20

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
end

return
{
    load = function(...) return ui:load(...) end,
    draw = function(...) return ui:draw(...) end,
}