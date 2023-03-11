rwTile = object.extend(object)

function rwTile:new(x, y, orientation, id)
    -- Main variables
    self.x = x
    self.y = y
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.builded = false
    self.id = id
    
    self.hovered = false

    self.orientation = orientation
    if self.orientation == "h" then -- If horizontal, get the horizontal tile
        self.quad = love.graphics.newQuad(16*3, 0, 16, 16, self.spriteSheet)
        self.dead = love.graphics.newQuad(16*2, 16*3, 16, 16, self.spriteSheet)
    else -- If vertical, get the vertical tile
        self.quad = love.graphics.newQuad(16*2, 16*1, 16, 16, self.spriteSheet)
        self.dead = love.graphics.newQuad(16*1, 16*3, 16, 16, self.spriteSheet)
    end
    

    -- Get the sfx
    self.sfx = love.audio.newSource("sounds/sfx/railway.mp3", "static")
    self.negativeBeep = love.audio.newSource("sounds/sfx/negativeBeep.mp3", "static")
end

function rwTile:isHovering()
    local x, y = love.mouse.getPosition()

    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)
    local selfX = self.x * globalScale
    local selfY = self.y * globalScale

    if mobile then
        if lineSquareColl(selfX, selfY, self.w, self.h, player.x+(player.w * globalScale) / 2, player.y+(player.h * globalScale) / 2, player.attackLine.x, player.attackLine.y) then
            player.attackLine.hoveredObj = self
            return true
        end
    end

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        return true
    end
    return false
end

function rwTile:draw()
    if self.builded then
        love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
    else
        -- Draw the sprite
        if self.hovered then 
            love.graphics.setShader(brightnessShader)
            brightnessShader:send("brightness", 1.5)
        end

        love.graphics.draw(self.spriteSheet, self.dead, self.x, self.y)

        love.graphics.setShader()
    end
end

function rwTile:onClick(x,y)
    self:hit()
end

function rwTile:hit()
    if self.builded or ( ui.tutorial and ( not self.tutorial or ( self.tutorial and ui.tutorialStep ~= ui.tutorial.railStepID ))) then return end

    local selfX = self.x * globalScale
    local selfY = self.y * globalScale
    local hovering = self:isHovering()

    -- Check if the mouse click was within the boundaries of the tree
    if hovering then
        local distance = math.sqrt((selfX + 16/2 - player.x+(11/2)*globalScale)^2 + (selfY - player.y+(15/2)*globalScale)^2)

        -- If the player is close enough
        if distance <= interactionRadius  then            
            -- And player has materials
            if ui.stoneAmount > 0 and ui.woodAmount > 0 then
                
                self.sfx:stop()
                self.sfx:play()
                self.builded = true
                ui.stoneAmount = ui.stoneAmount - 1
                ui.woodAmount = ui.woodAmount - 1

                if self.tutorial then
                    ui.tutorialStep = ui.tutorialStep + 1
                end
            else -- If player doesnt have enough materials
                self.negativeBeep:stop()
                self.negativeBeep:play()
            end 
        end
    end
end
