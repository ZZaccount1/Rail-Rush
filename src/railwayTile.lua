rwTile = object.extend(object)

local interactionRadius = 90

function rwTile:new(x, y, orientation)
    self.x = x
    self.y = y
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    
    self.orientation = orientation

    if self.orientation == "h" then
        self.quad = love.graphics.newQuad(16*3, 0, 16, 16, self.spriteSheet)
    else
        self.quad = love.graphics.newQuad(16*2, 16*1, 16, 16, self.spriteSheet)
    end
    
    self.builded = false
end

function rwTile:draw()
    if self.builded then
        love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
    end
end

function rwTile:onClick(x,y)
    if self.builded then
        return
    end
    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)

    local selfX = self.x * globalScale
    local selfY = self.y * globalScale

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        local distance = math.sqrt((selfX + 16/2 - player.x+(11/2)*player.scale)^2 + (selfY - player.y+(15/2)*player.scale)^2)
        print(distance)

        if distance <= interactionRadius then
        
            print("rwTile CLICK!")
            if ui.stoneAmount > 0 and ui.woodAmount > 0 then
                self.builded = true
                ui.stoneAmount = ui.stoneAmount - 1
                ui.woodAmount = ui.woodAmount - 1
            end 
        end
    end
end
