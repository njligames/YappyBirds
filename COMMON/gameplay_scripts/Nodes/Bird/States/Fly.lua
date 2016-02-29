local restartYapTimer = function(self)
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    local birdParams = nodeObject:getMovingEntityParams()

    math.randomseed( os.time() )
    local startTime = math.random(birdParams.YapTime.low, birdParams.YapTime.high)

    self:getYapTimer():start(startTime)
end

local restartPursueTimer = function(self)
    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    local birdParams = nodeObject:getMovingEntityParams()

    math.randomseed( os.time() )
    local startTime = math.random(birdParams.YapTime.low, birdParams.YapTime.high)

    self:getPursueTimer():start(birdParams.PursueTime)
end

local getYapTimer = function(self)
    assert(self.yapTimer, "yapTimer is nil.")
    
    return self.yapTimer
end

local getPursueTimer = function(self)
    assert(self.pursueTimer, "pursueTimer is nil.")

    return self.pursueTimer
end

--##############################################################

local getNodeState = function(self)
    assert(self.nodeState, "nodeState is nil.")
    
    return self.nodeState
end

local getNodeObject = function(self)
    assert(self.nodeObject, "nodeObject is nil.")
    
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

    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    node:getPhysicsBody():setCollisionGroup(CollisionGroups.bird)
    node:getPhysicsBody():setCollisionMask(CollisionMasks.bird)
    node:getPhysicsBody():enableHandleCollideCallback()
    node:getPhysicsBody():setKinematicPhysics()

    nodeObject:setFrameActionName("idle")
    nodeObject:setFrameIncrement(1)
    -- nodeObject:setFrameNumber(0)
    -- self.frameAction = "idle"
    -- self.frameIncrement = 1

    math.randomseed( os.time() )
    local x = math.random(-5, 5)
    local y = math.random(20.0, 21.0)
    local z = math.random(-5, 5)
    local offsetFromDog = bullet.btVector3(x, y, z)
    local dogMovingEntity = nodeObject:getDog().movingEntity

    nodeObject:getMovingEntity():getSteeringBehaviors():setOffsetPursuitOn(dogMovingEntity, offsetFromDog)
    nodeObject:getMovingEntity():getSteeringBehaviors():setSeparationOn()
    nodeObject:getMovingEntity():getSteeringBehaviors():setEvadeOn(dogMovingEntity)

    self:restartPursueTimer()
    self:restartYapTimer()
end

local update = function(self, timeStep)
    -- print(self:getNodeState():getName() .. " update for " .. self:getNodeObject():getNode():getName())

    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    math.randomseed( os.time() )
    local x = math.random(-1, 1)
    local y = math.random(20.0, 21.0)
    local z = math.random(-1, 1)
    local offsetFromDog = bullet.btVector3(x, y, z)
    local dogMovingEntity = nodeObject:getDog().movingEntity
    nodeObject:getMovingEntity():getSteeringBehaviors():setOffsetPursuitOn(dogMovingEntity, offsetFromDog)

    if self:getYapTimer():isFinished() then
        self:getNodeObject():getBeakNodeObject():getStateObject("Yap"):push()
        self:restartYapTimer()
    end

    if self:getPursueTimer():isFinished() then
        if not nodeObject:pursue() then
            -- print(self:getNodeState():getName() .. " tried to pursue, but couldn't")
        end
        self:restartPursueTimer()
    end

    self:getPursueTimer():tick()
    self:getYapTimer():tick()
end

local exit = function(self)
    -- print(self:getNodeState():getName() .. " exit for " .. self:getNodeObject():getNode():getName())

    local nodeObject = self:getNodeObject()
    local node = nodeObject:getNode()

    nodeObject:getMovingEntity():getSteeringBehaviors():setOffsetPursuitOff()
    nodeObject:getMovingEntity():getSteeringBehaviors():setSeparationOff()
    nodeObject:getMovingEntity():getSteeringBehaviors():setEvadeOff()
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
        self:getNodeObject():getStateObject("Hit"):push()
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
    njli.Timer.destroy(self:getPursueTimer())
    njli.Timer.destroy(self:getYapTimer())
    njli.NodeState.destroy(self:getNodeState())
end

local methods = 
{
    restartYapTimer = restartYapTimer,
    restartPursueTimer = restartPursueTimer,
    getYapTimer = getYapTimer,
    getPursueTimer = getPursueTimer,

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

    local yapTimer = njli.Timer.create()
    local pursueTimer = njli.Timer.create()

    local properties = 
    {
        nodeState = nodeState,

        yapTimer = yapTimer,
        pursueTimer = pursueTimer,
--shared

        nodeObject = nodeObject,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
