tree = object.extend(object)

-- Radius in which player can interact with the tree
local interactionRadius = 90 * scaleRatio

function tree:new(x, y)
    -- Variables
    self.x = x
    self.y = y + 16
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    self.quad = {}
    self.quad.trunk = love.graphics.newQuad(16*0, 16*3, 16*1, 16*1, self.spriteSheet)
    self.quad.top = love.graphics.newQuad(16*0, 16*1, 16*1, 16*2, self.spriteSheet)

    -- Create and setup the collider
    self.collider = worldMap:newPolygonCollider({self.x*globalScale, (self.y*1)*globalScale,
                                                 self.x*globalScale + 16*globalScale, (self.y*1)*globalScale,
                                                 self.x*globalScale + (16*globalScale)/2, (self.y*1)*globalScale + 16*globalScale})
    self.collider:setType("static")

    -- HP system
    self.hp = 3
    self.dead = false

    -- Setup sfx
    self.sfx = {}
    self.sfx.chop = {love.audio.newSource("sounds/sfx/treeChopping/chop1.mp3", "static"), 
                     love.audio.newSource("sounds/sfx/treeChopping/chop2.mp3", "static"),
                     love.audio.newSource("sounds/sfx/treeChopping/chop3.mp3", "static")}
end

-- Default draw
function tree:draw()
    if not self.dead then
        love.graphics.draw(self.spriteSheet, self.quad.trunk, self.x, self.y)
    end
end

-- The drawing in this function will be above the player
function tree:drawAbove()
    cam:attach()
    love.graphics.scale(globalScale)
    if not self.dead then
        love.graphics.draw(self.spriteSheet, self.quad.top, self.x, self.y-32)
    end
    love.graphics.scale(1)
    cam:detach()
end

function tree:onClick(x,y)
    if self.dead or ( ui.tutorial and ( not self.tutorial or ( self.tutorial and ui.tutorialStep ~= ui.tutorial.treeStepID ))) then return end

    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)

    local selfX = self.x * globalScale
    local selfY = (self.y) * globalScale

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        local distance = math.sqrt((selfX + 16/2 - player.x+(11/2)*globalScale)^2 + (selfY - player.y+(15/2)*globalScale)^2)

        if distance <= interactionRadius then
            local random = math.random(#self.sfx.chop)
            self.sfx.chop[random]:stop()
            self.sfx.chop[random]:play()
            self.hp = self.hp - 1
        end
    end

    -- If no hp
    if self.hp <= 0 then
        -- Disable collider
        for i, fixture in ipairs(self.collider:getFixtures()) do
            fixture:setSensor(true)
        end          

        ui.woodAmount = ui.woodAmount + 1 -- Increment the stone amount
        self.dead = true -- Change the dead variable to true

        -- If its a tutorial object, go to the next step
        if self.tutorial then
            ui.tutorialStep = ui.tutorialStep + 1
        end
    end
end
