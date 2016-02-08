local spawnBirdNode = function(self, x, y, layer, type)
end

local spawnDogNode = function(self, x, y, layer)
end

local spawnProjectile = function(self, x, y)
end

local delete = function(self)
    --TODO: clean up memory
end

local methods = 
{
    --TODO: Add functions here...
    __gc = delete
}

local new = function(scene)
    --TODO: Implement the constructor for this object.

    local properties = 
    {
        --TODO: Add variables here...
        scene = scene
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}