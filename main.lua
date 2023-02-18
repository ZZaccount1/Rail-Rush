function love.load()
    -- Disable smooth scaling
    love.graphics.setDefaultFilter("nearest", "nearest")

    anim8 = require('libs.anim8')
    af = require("libs.autofuncs")

    af.load("src")
end

function love.keypressed(k, sc, r)
    if k == "escape" then
        love.event.quit()
    end
end