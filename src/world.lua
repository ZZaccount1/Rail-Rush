world = {}

print("-----------------yea")

function world:load()
    worldMap = wf.newWorld(0,0)
end

function world:update(dt)
    if pause then return end

    worldMap:update(dt)
end

function world:draw()
    cam:attach()

    worldMap:draw() 
  
    cam:detach()
end

function world:generateSolid()
    world.walls = {}
    if gameMap.layers["solid"] then
        for i, obj in pairs(gameMap.layers["solid"].objects) do
            local wall = worldMap:newRectangleCollider(obj.x*globalScale, obj.y*globalScale, obj.width*globalScale, obj.height*globalScale)
            wall:setType("static")
            table.insert(world.walls, wall)
        end
    end
end

return
{
    load = function(...) return world:load(...) end,
    update = function(...) return world:update(...) end,
    include = false
}