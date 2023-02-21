tree = object.extend(object)

local interactionRadius = 90

function tree:new(x, y)
    self.x = x
    self.y = y
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.quad = {}
    self.quad.trunk = love.graphics.newQuad(16*0, 16*3, 16*1, 16*1, self.spriteSheet)
    self.quad.top = love.graphics.newQuad(16*0, 16*1, 16*1, 16*2, self.spriteSheet)

    --self.collider = worldMap:newRectangleCollider(self.x*globalScale, (self.y+16*1)*globalScale, 16*globalScale, 16*globalScale)
    self.collider = worldMap:newPolygonCollider({self.x*globalScale, (self.y+16*1)*globalScale,
                                                 self.x*globalScale + 16*globalScale, (self.y+16*1)*globalScale,
                                                 self.x*globalScale + (16*globalScale)/2, (self.y+16*1)*globalScale + 16*globalScale})
    self.collider:setType("static")

    self.hp = 3
    self.dead = false
end

function tree:draw()
    if not self.dead then
        love.graphics.draw(self.spriteSheet, self.quad.trunk, self.x, self.y+16)
    end
end

function tree:drawAbove()
    cam:attach()
    love.graphics.scale(map.scale)
    if not self.dead then
        love.graphics.draw(self.spriteSheet, self.quad.top, self.x, self.y-16)
    end
    love.graphics.scale(1)
    cam:detach()
end

function tree:onClick(x,y)
    if self.dead then 
        return
    end
    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)

    local selfX = self.x * globalScale
    local selfY = (self.y+16) * globalScale

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        local distance = math.sqrt((selfX + 16/2 - player.x+(11/2)*player.scale)^2 + (selfY - player.y+(15/2)*player.scale)^2)
        print(distance)

        if distance <= interactionRadius then
            print("TREE CLICK!",self.tableID)
            self.hp = self.hp - 1
        end
    end

    if self.hp <= 0 then
        print(self.hp)
        --worldMap:remove(self.collider)
        --self.collider:destroy()
        
        for i, fixture in ipairs(self.collider:getFixtures()) do
            fixture:setSensor(true)
        end          

        ui.woodAmount = ui.woodAmount + 1
        print("amount plus")
        self.dead = true
    end
end
