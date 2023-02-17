function love.load()
    af = require("libs.autofuncs")
    af.load("src")
end

function love.keypressed(k, sc, r)
    if k == "escape" then
        love.event.quit()
    end
end