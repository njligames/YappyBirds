local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
end

local update = function(self, timeStep)
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
end

local touchCancelled = function(self, rayContact)
end

local delete = function(self)
    njli.World.getInstance():getWorldFactory():destroy(self.physicsShape)
    self.physicsShape = nil
    njli.World.getInstance():getWorldFactory():destroy(self.physicsBody)
    self.physicsBody = nil

    for k,v in pairs(self.nodeStates) do
        njli.World.getInstance():getWorldFactory():destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    njli.World.getInstance():getWorldFactory():destroy(self.node)
    self.node = nil
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

local new = function(name, geometry, spawnPoint)
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

    -- node:addGeometry(geometry)

    local physicsBody = njli.PhysicsBodyRigid.create()
    physicsBody:setStaticPhysics()
    node:addPhysicsBody(physicsBody)

    local physicsShape = njli.PhysicsShapeBox.create()
    physicsShape:setMargin(1)
    physicsBody:addPhysicsShape(physicsShape)

    node:getStateMachine():pushState(nodeStates.display)

    --[[
    local spawnPoint = {}
    spawnPoint.shape = object.shape

    spawnPoint.x = object.x
    spawnPoint.y = object.y
    spawnPoint.width = object.width
    spawnPoint.height = object.height
    spawnPoint.rotation = object.rotation
    spawnPoint.enabled = object.visible
    spawnPoint.name = object.name
    spawnPoint.layer = currentObjectLayer
    spawnPoint.likelyhood = layer.opacity
    ]]
    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        physicsBody = physicsBody,
        physicsShape = physicsShape,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
