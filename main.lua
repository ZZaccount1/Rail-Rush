windowW = 0
windowH = 0

mobileScale = 2
pcScale = 3.2
globalScale = pcScale
scaleRatio = globalScale / 3.2

release = false
debug = false

pause = false

mobile = false

function love.load()
    -- Disable smooth scaling
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Check the arguments
    for i, arg in ipairs(arg) do
        if arg == "release" then
            release = true
        end
    end  

    -- Check if playing on a smartphone
    if love.system.getOS() == "Android" or love.system.getOS() == "iOS" then
        mobile = true
        --love.window.setMode(0, 0, { fullscreen = true, fullscreentype = "desktop" })
    end

    -- Fullscrean if debug
    if not release then
        love.window.setFullscreen(false)
    end

    -- Different scale for mobile devices
    if mobile then
        globalScale = mobileScale
    end

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
    require "libs.gooi"
    
    -- Create the camera
    cam = camera()

    -- Require and load every single script
    af.requireAll("src")
    world:load()
    player:load()
    cursor:load()
    af.load()

    -- Move the camera on the player
    cameraBorders()

    -- Setup and run the background music
    bgMusic = love.audio.newSource("sounds/ost/ost1.mp3", "stream")
    bgMusic:setVolume(0.05)
    bgMusic:setLooping(true)
    bgMusic:play()  

    -- Turn off the audio by default if not release
    if not release then
        love.audio.setVolume(0)
    end
end

function gameStart()
    player.collider:setPosition(200 * scaleRatio, 875 * scaleRatio)

    map:gameStart()
end

function love.update(dt)
    -- Hide status bar and home buttons for mobile devices
    if mobile then
        local _, _, flags = love.window.getMode()
        if flags.fullscreen and not flags.usedpiscale then
          love.window.setMode(0, 0, { fullscreen = true, fullscreentype = "desktop", usedpiscale = false })
        end
    end

    -- Update from the scripts
    gooi:update(dt)
    world:update(dt)
    player:update(dt)
    af:update(dt)
end

function love.draw()
    -- Draw from the scripts
    world:draw()
    af:draw()
    player:draw()

    for i,v in ipairs(map.entities) do
        if map.entities[i].drawAbove then
            map.entities[i]:drawAbove()
        end
    end

    -- Debug
    if debug then
        world:draw()
    
        -- Draw fps
        love.graphics.print("FPS: "..love.timer.getFPS( ), 0, windowH - love.graphics.getFont():getHeight())
    end

    -- Draw the ui
    ui:draw()
    gooi.draw()
    cursor:draw()
end

function love.keypressed(k, sc, r)
    if k == "escape" then
        love.event.quit()
    end

    if k == "y" then
        love.event.quit("restart")
    end

    if k == "m" then
        local volume = love.audio.getVolume()
        if volume > 0.1 then
            love.audio.setVolume(0)
        else
            love.audio.setVolume(1)
        end
    end

    if not release then
        if k == "i" then
            debug = not debug
        elseif k == "o" then
            minecart.speed = minecart.speed + 5
        elseif k == "p" then
            minecart.speed = 0
            minecart.speedIncrease = 0
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
        elseif k == "n" then
            love.filesystem.remove("tutorial.dat")
            love.event.quit("restart")
        elseif k == "b" then
            mobile = not mobile
        end
    end
end

function love.mousereleased(x, y, button) gooi.released() end

function love.mousepressed(x, y, button, istouch)
    gooi.pressed()

    if button == 1 and not pause then
       map:onClick(x,y)
    end
end

function love.resize(w, h)
    windowW = w
    windowH = h

    ui:calculateButtonsPos()
end