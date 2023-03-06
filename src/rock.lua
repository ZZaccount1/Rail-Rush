rock = object.extend(object)

function rock:new(x, y)
    -- Basic variables
    self.x = x
    self.y = y
    self.w = 16 * globalScale
    self.h = 16 * globalScale
    self.spriteSheet = love.graphics.newImage("sprites/props.png")
    
    -- Pick a random sprite between 2 of them
    local random = math.random(2)
    if random == 1 then
        self.quad = love.graphics.newQuad(0, 0, 16, 16, self.spriteSheet)
    else
        self.quad = love.graphics.newQuad(16, 0, 16, 16, self.spriteSheet)
    end

    -- Setup the collider
    self.collider = worldMap:newRectangleCollider(self.x*globalScale+2, self.y*globalScale+2, 14*globalScale, 14*globalScale)
    self.collider:setType("static")

    -- Hp system
    self.hp = 3
    self.dead = false
    
    -- Setup sfx
    self.sfx = {}
    self.sfx.mine = {love.audio.newSource("sounds/sfx/mining/mine1.mp3", "static"), 
                     love.audio.newSource("sounds/sfx/mining/mine2.mp3", "static"),
                     love.audio.newSource("sounds/sfx/mining/mine3.mp3", "static")}
end

function rock:draw()
    if self.dead then return end

    love.graphics.draw(self.spriteSheet, self.quad, self.x, self.y)
end

function rock:onClick(x,y)
    if self.dead or ( ui.tutorial and ( not self.tutorial or ( self.tutorial and ui.tutorialStep ~= ui.tutorial.rockStepID ))) then return end

    -- Convert the mouse coordinates to world coordinates
    local mouseX, mouseY = cam:worldCoords(x, y)

    local selfX = self.x * globalScale
    local selfY = self.y * globalScale

    -- Check if the mouse click was within the boundaries of the tree
    if mouseX >= selfX and mouseX <= selfX + self.w and mouseY >= selfY and mouseY <= selfY + self.h then
        local distance = math.sqrt((selfX + 16/2 - player.x+(11/2)*globalScale)^2 + (selfY - player.y+(15/2)*globalScale)^2)

        if distance <= interactionRadius then
            local random = math.random(#self.sfx.mine)
            self.sfx.mine[random]:stop()
            self.sfx.mine[random]:play()
            self.hp = self.hp - 1
        end
    end

    -- If no hp
    if self.hp <= 0 then
        -- Disable collider
        for i, fixture in ipairs(self.collider:getFixtures()) do
            fixture:setSensor(true)
        end          

        ui.stoneAmount = ui.stoneAmount + 1 -- Increment the stone amount
        self.dead = true -- Change the dead variable to true

        -- If its a tutorial object, go to the next step
        if self.tutorial then
            ui.tutorialStep = ui.tutorialStep + 1
        end
    end
end
