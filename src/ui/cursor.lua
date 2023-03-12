cursor = {}

local scale = 3

function cursor:load()
    cursor.spriteSheet = love.graphics.newImage("sprites/cursor.png")
    cursor.default = love.graphics.newQuad(0, 0, 7, 9, cursor.spriteSheet)
    cursor.highlighted = love.graphics.newQuad(7, 0, 7, 9, cursor.spriteSheet)

    love.mouse.setVisible(false)
end

function cursor:draw()

    local x, y = love.mouse.getPosition()
    
    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)
    local cursorSprite = cursor.default

    for i,v in ipairs(map.entities) do
        local selfX = v.x * globalScale
        local selfY = v.y * globalScale
    
        -- Check if the mouse click was within the boundaries of the tree
        if v:isHovering() then
            cursorSprite = cursor.highlighted
            v.hovered = true
            break
        else 
            cursorSprite = cursor.default
            v.hovered = false
        end
    end
    
    if not mobile then
        love.graphics.draw(cursor.spriteSheet, cursorSprite, x, y, nil, scale, scale)
    end
end

return 
{
    include = false 
}