rock = object.extend(object)

function rock:new(x, y)
    self.x = x
    self.y = y
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.quad = love.graphics.newQuad(0, 0, 16, 16, self.spriteSheet)
end

function rock:draw()
    love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
    love.graphics.circle("fill", self.x, self.y, 16)
end