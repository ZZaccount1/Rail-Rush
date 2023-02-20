ui = {}

ui.woodAmount = 0
ui.stoneAmount = 0

ui.textScale = 20

function ui:load()
    ui.defaultFont = love.graphics.newFont(ui.textScale)
    love.graphics.setFont(ui.defaultFont)
end

function ui:draw()
    love.graphics.print("wood: "..ui.woodAmount, 10, 10)
    love.graphics.print("stone: "..ui.stoneAmount, 10, 10*2 + ui.textScale)
end

return
{
    load = function(...) return ui:load(...) end,
    draw = function(...) return ui:draw(...) end,
}