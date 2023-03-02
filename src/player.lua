player = {}

-- Sprite sheet tiles
local tileSizeX = 11
local tileSizeY = 15

-- Player variables
player.x = 173
player.y = 850
player.speed = 0.5 * 500
player.scale = 3.2
player.animations = {}
player.facingRight = true
player.w = tileSizeX
player.h = tileSizeY
player.colliderW = 11
player.colliderH = 5

local yOffset = player.colliderH * globalScale

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
    -- Up
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        vy = -player.speed
        
        -- Animation
        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end 
    end
    -- Down
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        vy = player.speed
        
        -- Animation
        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end
    end
    -- Right
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        vx = player.speed
        player.facingRight = true
        
        -- Animation
        player.anim = player.animations.right
    end
    -- Left
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        vx = -player.speed    
        player.facingRight = false

        -- Animation
        player.anim = player.animations.left
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
    
    -- Camera borders
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

function player:draw()
    cam:attach()
    
    player.anim:draw(player.spriteSheet, player.x, player.y-yOffset, nil, player.scale)
    
    cam:detach()
end

return
{
    load = function(...) return player:load(...) end,
    update = function(...) return player:update(...) end,
    draw = function(...) return player:draw(...) end,
    include = false
}