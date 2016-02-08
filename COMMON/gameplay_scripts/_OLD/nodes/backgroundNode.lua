local arg={...}

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)

end

local angle = 0
local update = function(self, timeStep)

-- self.node:setOpacity(0.1)
    local quat = njli.btQuaternion()
    angle = angle + (timeStep * 1)

    -- quat:setEuler(angle, angle, angle)
    -- cubeNode:setRotation(quat)

    -- angle = angle + (timeStep * 2)
    quat:setEuler(angle, angle, angle)
    -- self.node:setRotation(quat)
    -- print(self.node:getOrigin())
    -- print(self.node:getParentNode():getOrigin())
end

local exit = function(self)
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
end

local near = function(self, otherNode)
end

local touchDown = function(self, rayContact)
end

local touchUp = function(self, rayContact)
end

local touchMove = function(self, rayContact)
    -- print(os.clock() .. " move")
end

local touchCancelled = function(self, rayContact)
end

local delete = function(self)
    destroyObject(self.physicsShape)
    destroyObject(self.rigidBody)

    for k,v in pairs(self.nodeStates) do
        destroyObject(self.nodeStates[k])
    end
    self.nodeStates = {}

    destroyObject(self.node)
end

local methods = 
{
    actionUpdate = actionUpdate,
    actionComplete = actionComplete,
    hide = hide,
    enter = enter,
    update = update,
    exit = exit,
    onMessage = onMessage,
    collide = collide,
    near = near,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,
    __gc = delete
}

local new = function(name, shader, material, geometry)
    local node = njli.Node.create()
    node:setName(name)

    local names =
    {
        display = name,
    }
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    -- local image = njli.Image.create()
    -- local material = njli.Material.create()
    -- local geometry = njli.Sprite2D.create()
    -- njli.World.getInstance():getWorldResourceLoader():load("images/" .. name .. ".png", image)
    -- material:getDiffuse():loadGPU(image)
    -- geometry:addMaterial(material)
    -- geometry:addShaderProgram(shader)

    node:addGeometry(geometry)

    local rigidBody = njli.PhysicsBodyRigid.create()
    rigidBody:setStaticPhysics()
    node:addPhysicsBody(rigidBody)

    local physicsShape = njli.PhysicsShapeBox.create()
    physicsShape:setMargin(1)
    rigidBody:addPhysicsShape(physicsShape)

    node:getStateMachine():pushState(nodeStates.display)

    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,
        

        -- image = image,
        

        rigidBody = rigidBody,
        physicsShape = physicsShape,

        --do not delete
        shader = shader,
        material = material,
        geometry = geometry,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
