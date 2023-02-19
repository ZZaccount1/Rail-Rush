player = {}

player.x = 0
player.y = 0
player.speed = 0.5
player.scale = 3.2

local rectangleSize = 32
player.animations = {}

player.facingRight = true

function player:load()
    player.spriteSheet = love.graphics.newImage('sprites/player.png')
    player.grid = anim8.newGrid(11, 15, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations.speed = 0.2
    player.animations.idleR = anim8.newAnimation(player.grid('1-3', 1), player.animations.speed)
    player.animations.idleL = anim8.newAnimation(player.grid('1-3', 2), player.animations.speed)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), player.animations.speed)
    player.animations.left  = anim8.newAnimation(player.grid('1-4', 4), player.animations.speed)

    player.anim = player.animations.idleR
end

function player:update(dt)
    if player.facingRight then
        player.anim = player.animations.idleR
    else
        player.anim = player.animations.idleL
    end

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed
        
        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end 
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed

        if player.facingRight then
            player.anim = player.animations.right
        else
            player.anim = player.animations.left
        end
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed
        player.facingRight = true
        player.anim = player.animations.right
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed    
        player.facingRight = false
        player.anim = player.animations.left
    end

    player.anim:update(dt)
end

function player:draw()
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, player.scale)
end

return
{
    load = function(...) return player:load(...) end,
    update = function(...) return player:update(...) end,
    draw = function(...) return player:draw(...) end,
}