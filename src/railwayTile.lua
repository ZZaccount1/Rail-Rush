rwTile = object.extend(object)

function rwTile:new(x, y, orientation)
    self.x = x
    self.y = y
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.orientation = orientation
    print("orientation:", orientation)

    self.collider = worldMap:newRectangleCollider(self.x*globalScale+2, self.y*globalScale+2, 14*globalScale, 14*globalScale)
    self.collider:setType("static")

    self.builded = false
end

function rwTile:draw()
    if self.builded then
        love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
    end
end

function rwTile:onClick(x,y)
    if self.dead then 
        return
    end
    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)

    local selfX = self.x * globalScale
    local selfY = self.y * globalScale

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        print("rwTile CLICK!",self.tableID)
        self.hp = self.hp - 1
    end

    if self.hp <= 0 then
        print(self.hp)
        --worldMap:remove(self.collider)
        --self.collider:destroy()
        
        for i, fixture in ipairs(self.collider:getFixtures()) do
            fixture:setSensor(true)
        end          

        ui.stoneAmount = ui.stoneAmount + 1
        print("amount plus")
        self.dead = true
    end
end
