player = {}

-- Sprite sheet tiles
local tileSizeX = 11
local tileSizeY = 15

-- Player variables
player.x = 173 * scaleRatio
player.y = 850 * scaleRatio
player.speed = 0.5 * 500
player.animations = {}
player.facingRight = true
player.w = tileSizeX
player.h = tileSizeY
player.colliderW = 11
player.colliderH = 5

local yOffset = player.colliderH * globalScale

player.attackLine = {}

function player:load()
    -- Load the spritesheet
    player.spriteSheet = love.graphics.newImage('sprites/player.png')
    player.grid = anim8.newGrid(tileSizeX, tileSizeY, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    -- Create the animations
    player.animations.speed = 0.15
    player.animations.idleR = anim8.newAnimation(player.grid('1-4', 1), player.animations.speed)
    player.animations.idleL = anim8.newAnimation(player.grid('1-4', 2), player.animations.speed)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), player.animations.speed)
    player.animations.left  = anim8.newAnimation(player.grid('1-4', 4), player.animations.speed)

    -- First animation
    player.anim = player.animations.idleR

    -- Setup the collider for the player
    player.collider = worldMap:newBSGRectangleCollider(player.x, player.y + yOffset, player.colliderW*globalScale, player.colliderH*globalScale, 3)
    player.collider:setFixedRotation(true)

    cam:lookAt(player.x + (tileSizeX/2), player.y + (tileSizeY/2))
end

function player:update(dt)
    if pause or ui.pickDifficulty then return end

    -- Velocity
    local vx = 0
    local vy = 0

    -- Idle animation
    if player.facingRight then
        player.anim = player.animations.idleR
    else
        player.anim = player.animations.idleL
    end

    -- Movement
    if mobile then
        if movementJoystick:xValue() ~= 0 or movementJoystick:yValue() ~= 0 then
            vx = movementJoystick:xValue() * player.speed
            vy = movementJoystick:yValue() * player.speed
    
            -- Animation
            if vx > 0 then
                player:animationSetup('d')
            else
                player:animationSetup('a')
            end
        end
    end

    -- Keyboard
    -- Up
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        vy = -player.speed
        player:animationSetup('w')
    end
    -- Down
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        vy = player.speed
        player:animationSetup('s')
    end
    -- Right
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        vx = player.speed
        player:animationSetup('d')
    end
    -- Left
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        vx = -player.speed    
        player:animationSetup('a')
    end

    -- Update animation
    player.anim:update(dt)

    -- Alling the player's position to the collider's
    player.x = player.collider:getX() - ( (player.w * globalScale) / 2 )
    player.y = player.collider:getY() - ( (player.h * globalScale) / 2 )
    
    -- Apply the velocity to the collider
    player.collider:setLinearVelocity(vx, vy)

    -- Move the camera
    cam:lookAt(player.x + (tileSizeX/2), player.y + (tileSizeY/2))
    
    cameraBorders()
end

function player:draw()
    cam:attach()

    if mobile then
        local pX = player.x + (player.w * globalScale) / 2
        local pY = player.y + (player.h * globalScale) / 2
        local knobX = attackJoystick:xValue() * interactionRadius
        local knobY = attackJoystick:yValue() * interactionRadius

        -- Calculate the length of the line using the Pythagorean theorem
        local lineLength = math.sqrt(knobX^2 + knobY^2)

        -- Scale the x and y values of the knob position to maintain the line length
        if lineLength > 0 then
            knobX = knobX * (interactionRadius / lineLength)
            knobY = knobY * (interactionRadius / lineLength)
        end

        player.attackLine.x = knobX + pX
        player.attackLine.y = knobY + pY
        player.attackLine.thickness = 5

        love.graphics.setLineWidth(player.attackLine.thickness)
        love.graphics.setColor(1,1,1,0.60)
        love.graphics.line(pX, pY, player.attackLine.x, player.attackLine.y)
        love.graphics.setColor(1,1,1,1)
        love.graphics.setLineWidth(1)
    end
    
    player.anim:draw(player.spriteSheet, player.x, player.y-yOffset, nil, globalScale)
    
    cam:detach()
end

function player:animationSetup(orientation)
    if orientation == 'w' or orientation == 's' then
        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end 
    elseif orientation == 'd' then
        player.facingRight = true
        player.anim = player.animations.right
    elseif orientation == 'a' then
        player.facingRight = false
        player.anim = player.animations.left
    end
end

function cameraBorders()
    local mapW = gameMap.width * gameMap.tilewidth * globalScale
    local mapH = gameMap.height * gameMap.tileheight * globalScale
    if cam.x < windowW/2 then
        cam.x = windowW/2
    end
    if cam.y < windowH/2 then
        cam.y = windowH/2
    end
    if cam.x > (mapW - windowW/2) then
        cam.x = (mapW - windowW/2)
    end
    if cam.y > (mapH - windowH/2) then
        cam.y = (mapH - windowH/2)
    end
end

return
{
    load = function(...) return player:load(...) end,
    update = function(...) return player:update(...) end,
    draw = function(...) return player:draw(...) end,
    include = false
}