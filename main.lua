windowW = 0
windowH = 0

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

    af.load("src")

    cam = camera()
end

function love.keypressed(k, sc, r)
    if k == "escape" then
        love.event.quit()
    end
end