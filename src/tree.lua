tree = object.extend(object)

function tree:new(x, y)
    self.x = x
    self.y = y
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.quad = love.graphics.newQuad(16*0, 16*1, 16*1, 16*3, self.spriteSheet)
end

function tree:draw()
    love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
end