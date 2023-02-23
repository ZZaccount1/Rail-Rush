windowW = 0
windowH = 0

globalScale = 3.2

release = true
debug = false

pause = false

function love.load()
    -- Disable smooth scaling
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Get the size of the window
    windowW = love.graphics.getWidth()
    windowH = love.graphics.getHeight()

    -- Require all the libs
    anim8 = require("libs.anim8")
    af = require("libs.autofuncs")
    sti = require("libs.sti")
    camera = require("libs.camera")
    object = require("libs.classic")
    wf = require("libs.windfield")

    af.load("src")

    cam = camera()

    bgMusic = love.audio.newSource("sounds/ost/ost1.mp3", "stream")
    bgMusic:setVolume(0.05)
    bgMusic:setLooping(true)
    bgMusic:play()
end

function love.draw()
    af:draw()
    for i,v in ipairs(map.entities) do
        if map.entities[i].drawAbove then
            map.entities[i]:drawAbove()
        end
    end

    if debug then
        world:draw()
    end

    ui:draw()
end

function love.keypressed(k, sc, r)
    if k == "escape" then
        love.event.quit()
    end

    if k == "y" then
        love.event.quit("restart")
    end

    if not release then
        if k == "i" then
            debug = not debug
        elseif k == "o" then
            minecart.speed = minecart.speed + 5
        elseif k == "p" then
            minecart.speed = 0
        elseif k == "k" then
            ui.woodAmount = 100
            ui.stoneAmount = 100
        elseif k == "l" then
            ui.woodAmount = 0
            ui.stoneAmount = 0
        elseif k == "j" then
            for i,v in ipairs(emptyRailways) do
                v.builded = true
            end
        end
    end
end

function love.mousepressed(x, y, button, istouch)
    
    if button == 1 and not pause then
       map:onClick(x,y)
    end
 end
