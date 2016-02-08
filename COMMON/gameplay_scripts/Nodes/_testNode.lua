local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)

    print("enter (" .. self.node:getName() .. "->" .. self.node:getStateMachine():getState():getName() .. ")")

end

local update = function(self, timeStep)
    
    -- print("update (" .. self.node:getStateMachine():getState():getName() .. ")")

end

local exit = function(self)

    print("exit (" .. self.node:getName() .. "->" .. self.node:getStateMachine():getState():getName() .. ")")

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
    local nodeName = self.node:getName()

    -- self:exit()
    self.node:getStateMachine():pushState(nil)

    njli.PhysicsShape.destroy(self.physicsShape)
    self.physicsShape = nil

    njli.PhysicsBody.destroy(self.physicsBody)
    self.physicsBody = nil

    njli.Node.destroy(self.node)
    self.node = nil

    for k,v in pairs(self.nodeStates) do
        njli.NodeState.destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    print("delete (" .. nodeName .. ")")
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

local new = function(name, geometry)
    print("new (" .. name .. ")")

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

    node:addGeometry(geometry)

    local physicsBody = njli.PhysicsBodyRigid.create()
    physicsBody:setStaticPhysics()
    node:addPhysicsBody(physicsBody)

    local physicsShape = njli.PhysicsShapeBox.create()
    physicsShape:setMargin(1)
    physicsBody:addPhysicsShape(physicsShape)

    node:getStateMachine():pushState(nodeStates.display)

    njli.World.getInstance():getScene():getRootNode():addChildNode(node)
    
    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        physicsBody = physicsBody,
        physicsShape = physicsShape,

        instanceName = name,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
