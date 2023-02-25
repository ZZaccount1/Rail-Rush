player = {}

player.x = 173
player.y = 850
player.speed = 0.5 * 500
player.scale = 3.2


local rectangleSize = 32
player.animations = {}

player.facingRight = true

local tileSizeX = 11
local tileSizeY = 15

local yOffset = 5*globalScale

function player:load()
    player.spriteSheet = love.graphics.newImage('sprites/player.png')
    player.grid = anim8.newGrid(tileSizeX, tileSizeY, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations.speed = 0.15
    player.animations.idleR = anim8.newAnimation(player.grid('1-4', 1), player.animations.speed)
    player.animations.idleL = anim8.newAnimation(player.grid('1-4', 2), player.animations.speed)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), player.animations.speed)
    player.animations.left  = anim8.newAnimation(player.grid('1-4', 4), player.animations.speed)

    player.anim = player.animations.idleR

    player.collider = worldMap:newBSGRectangleCollider(player.x, player.y + yOffset, 11*globalScale, 5*globalScale, 3)
    player.collider:setFixedRotation(true)
end

function player:update(dt)
    if pause or ui.pickDifficulty then return end

    local vx = 0
    local vy = 0

    if player.facingRight then
        player.anim = player.animations.idleR
    else
        player.anim = player.animations.idleL
    end

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        vy = -player.speed
        
        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end 
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        vy = player.speed

        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        vx = player.speed
        player.facingRight = true
        player.anim = player.animations.right
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        vx = -player.speed    
        player.facingRight = false
        player.anim = player.animations.left
    end

    player.anim:update(dt)

    player.x = player.collider:getX() - ((11*globalScale)/2)
    player.y = player.collider:getY() - ((15*globalScale)/2)
    player.collider:setLinearVelocity(vx, vy)

    cam:lookAt(player.x + (tileSizeX/2), player.y + (tileSizeY/2))
    
    local mapW = gameMap.width * gameMap.tilewidth * map.scale
    local mapH = gameMap.height * gameMap.tileheight * map.scale

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
    order = 2
}