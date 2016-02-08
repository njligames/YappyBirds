local arg={...}

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local setScaleFactor = function(self, scale)
    self.scaleFactor = scale
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    -- self.node:setOrigin(njli.btVector3(0, 323, njli.World.getInstance():getScene():getRootNode():getCamera():getZFar() - njli.World.getInstance():getScene():getRootNode():getCamera():getZNear()))
    -- local d = njli.btVector2(1470, 1470)
    -- self.node:getGeometry():setDimensions(self.node, d)

    local nodeStateName = self.node:getStateMachine():getState():getName()
    self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, false)
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
    setScaleFactor = setScaleFactor,
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

local new = function(name, spriteAtlas, geometry)--, x, y, width, height, layer)

    local node = njli.Node.create()
    node:setName(name)

    local idx = string.find(name, "/")
    -- print(idx, name)
    -- name = string.sub(name, idx + 1)

    -- print("to " .. name)

    local names =
    {
        display = string.sub(name, idx + 1),
    }
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    node:addGeometry(geometry)
    
    local rigidBody = njli.PhysicsBodyRigid.create()
    rigidBody:setStaticPhysics()
    -- rigidBody:enableHandleCollideCallback()
    rigidBody:setCollisionGroup(CollisionGroups.tile)
    rigidBody:setCollisionMask(CollisionMasks.tile)

    local physicsShape = njli.PhysicsShapeBox.create()
    physicsShape:setMargin(1)
    

    rigidBody:addPhysicsShape(physicsShape)

    node:addPhysicsBody(rigidBody)

    

    node:getStateMachine():pushState(nodeStates.display)

    local properties = 
    {
        node = node,
        nodeStateNames = names,
        nodeStates = nodeStates,
        rigidBody = rigidBody,
        physicsShape = physicsShape,

        --do not delete
        geometry = geometry,
        spriteAtlas = spriteAtlas,
        -- x = x,
        -- y = y,
        -- width = width,
        -- height = height,
        -- layer = layer,
        -- scaleFactor = 1,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
