--##############################################################

local getNodeState = function(self)
    return self.nodeState
end

local getNodeObject = function(self)
    return self.nodeObject
end

local push = function(self)
    assert(self:getNodeObject(), "self:getNodeObject() must not be nil in " .. self:getNodeState():getName())

    self:getNodeObject():getNode():getStateMachine():pushState(self:getNodeState())
end

local isIn = function(self)
    assert(self:getNodeObject(), "self:getNodeObject() must not be nil in " .. self:getNodeState():getName())

    return self:getNodeState():getName() == self:getNodeObject():getNode():getStateMachine():getState():getName()
end

local actionUpdate = function(self, action, timeStep)
    -- print(self:getNodeState():getName() .. " actionUpdate for " .. self:getNodeObject():getNode():getName())
end

local actionComplete = function(self, action)
    -- print(self:getNodeState():getName() .. " actionComplete for " .. self:getNodeObject():getNode():getName())
end

local enter = function(self)
    -- print(self:getNodeState():getName() .. " enter for " .. self:getNodeObject():getNode():getName())
    

    self:getNodeObject():setFrameActionName("hit")
    self:getNodeObject():setFrameIncrement(0)

    self:getNodeObject():getMovingEntity():setVelocity(njli.btVector3(0,0,0))

    self:getNodeObject():getNode():getPhysicsBody():setVelocity(njli.btVector3(0,0,0))
    self:getNodeObject():getNode():getPhysicsBody():setDynamicPhysics()
    self:getNodeObject():getNode():getPhysicsBody():setCollisionMask(CollisionMasks.birdDead)


    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()
    nodeObject:getBeakNodeObject():getNode():show(getPerspectiveCamera())

    nodeObject:releaseDog()
    
end

local update = function(self, timeStep)
    -- print(self:getNodeState():getName() .. " update for " .. self:getNodeObject():getNode():getName())

    local direction = njli.btVector3(0, -1, 0)
    local magnitude = 6

    self:getNodeObject():getNode():getPhysicsBody():applyForce(direction * magnitude, true)

    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    local birdParams = self:getNodeObject():getMovingEntityParams()

    if self:getNodeObject():getNode():getOrigin():y() < birdParams.DieY then

        nodeObject:getOwner():destroyBirdNode(nodeObject)
        print("die")

        -- self.owner:destroyBirdNode(self)
    end
end

local exit = function(self)
    -- print(self:getNodeState():getName() .. " exit for " .. self:getNodeObject():getNode():getName())
end

local onMessage = function(self, message)
    -- print(self:getNodeState():getName() .. " onMessage for " .. self:getNodeObject():getNode():getName())
end

local render = function(self)
    -- print(self:getNodeState():getName() .. " render for " .. self:getNodeObject():getNode():getName())
end

local collide = function(self, otherNode, collisionPoint)
    -- print(self:getNodeState():getName() .. " collide for " .. self:getNodeObject():getNode():getName())
    
    local myGroup = self:getNodeObject():getNode():getPhysicsBody():getCollisionGroup()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()

    if bit.band(otherGroup, CollisionGroups.projectile) ~= 0 then
        -- self:getNodeObject():getStateObject("Hit"):push()
    elseif bit.band(otherGroup, CollisionGroups.dog) ~= 0 then
    end
end

local near = function(self, otherNode)
    -- print(self:getNodeState():getName() .. " near for " .. self:getNodeObject():getNode():getName())
end

local touchDown = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchDown for " .. self:getNodeObject():getNode():getName())
end

local touchUp = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchUp for " .. self:getNodeObject():getNode():getName())
end

local touchMove = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchMove for " .. self:getNodeObject():getNode():getName())
end

local touchCancelled = function(self, rayContact)
    -- print(self:getNodeState():getName() .. " touchCancelled for " .. self:getNodeObject():getNode():getName())
end

local delete = function(self)
    njli.NodeState.destroy(self:getNodeState())
end

local methods = 
{
    
    --##############################################################

    getNodeState = getNodeState,
    getNodeObject = getNodeObject,
    push = push,
    isIn = isIn,
    actionUpdate = actionUpdate,
    actionComplete = actionComplete,
    enter = enter,
    update = update,
    exit = exit,
    onMessage = onMessage,
    render = render,
    collide = collide,
    near = near,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,
    __gc = delete
}

local new = function(name, nodeObject)

    local nodeState = njli.NodeState.create()
    nodeState:setName(name)

    local properties = 
    {
        nodeState = nodeState,

--shared

        nodeObject = nodeObject,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
