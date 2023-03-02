rwTile = object.extend(object)

-- Radius in which player can interact with the tile
local interactionRadius = 90 * scaleRatio

function rwTile:new(x, y, orientation)
    -- Main variables
    self.x = x
    self.y = y
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.builded = false
    
    self.orientation = orientation
    if self.orientation == "h" then -- If horizontal, get the horizontal tile
        self.quad = love.graphics.newQuad(16*3, 0, 16, 16, self.spriteSheet)
    else -- If vertical, get the vertical tile
        self.quad = love.graphics.newQuad(16*2, 16*1, 16, 16, self.spriteSheet)
    end
    
    -- Get the sfx
    self.sfx = love.audio.newSource("sounds/sfx/railway.mp3", "static")
    self.negativeBeep = love.audio.newSource("sounds/sfx/negativeBeep.mp3", "static")
end

function rwTile:draw()
    if self.builded then
        love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
    end
end

function rwTile:onClick(x,y)
    if self.builded then return end

    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)

    local selfX = self.x * globalScale
    local selfY = self.y * globalScale

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        local distance = math.sqrt((selfX + 16/2 - player.x+(11/2)*globalScale)^2 + (selfY - player.y+(15/2)*globalScale)^2)

        -- If the player is close enough
        if distance <= interactionRadius then            
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
