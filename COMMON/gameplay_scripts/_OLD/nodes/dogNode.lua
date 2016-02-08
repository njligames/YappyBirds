local arg={...}



function createRunAction()
    local action = njli.Action.create()
    action:setName('ForwardFly')
    action:setRepeatForever()
    return action
end

local steering = (loadfile(njli.ASSET_PATH("scripts/steering.lua")))()

local isCaptured = function(self)
    local currentY = self.node:getOrigin():y()
    return currentY > self.Prm.Dog.CapturedHeight
end

local actionUpdate = function(self, action, timeStep)
    -- local nodeStateName = self.rootName--self.node:getStateMachine():getState():getName()
    self.frameName = self.rootName .. "_0000" .. self.frameNumber

    -- print(self.frameName)

    self.frameNumber = self.frameNumber + 1
    if self.frameNumber > 8 then
        self.frameNumber = 0
    end
    
    self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, self.frameName, false)
    -- print('bird actionUpdate')
end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if nodeStateName == self.nodeStates.display:getName() then
        self.movingEntity:getSteeringBehaviors():setFollowPathOn(self.path, self.movingEntity:getSteeringBehaviors().Deceleration.slow)

        
    elseif nodeStateName == self.nodeStates.idle:getName() then
        -- print("enter idle")
    end
end

local update = function(self, timeStep)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if nodeStateName == self.nodeStates.display:getName() then
        self.movingEntity:update(timeStep)
    elseif nodeStateName == self.nodeStates.idle:getName() then
        -- print("update idle " .. timeStep)
        self.totalIdleTime = self.totalIdleTime + timeStep

        if self.totalIdleTime > self.Prm.Dog.IdleTime then
            self.node:getStateMachine():pushState(self.nodeStates.display)
        end
    end

    
end

local exit = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if nodeStateName == self.nodeStates.display:getName() then
        self.movingEntity:getSteeringBehaviors():setFollowPathOff()
        self.movingEntity:setVelocity(njli.btVector3(0,0,0))
    elseif nodeStateName == self.nodeStates.idle:getName() then
        -- print("exit idle")
    end
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()

    if nodeStateName == self.nodeStates.display:getName() then
        if bit.band(otherGroup, CollisionGroups.bird) ~= 0 then
            self.node:getStateMachine():pushState(self.nodeStates.idle)
        end
    elseif nodeStateName == self.nodeStates.idle:getName() then
        -- print("collide idle")
    end
end

local near = function(self, otherNode)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()

    if nodeStateName == self.nodeStates.display:getName() then

    elseif nodeStateName == self.nodeStates.idle:getName() then
        -- print("near idle")
    end
end

local touchDown = function(self, rayContact)
    
end

local touchUp = function(self, rayContact)
end

local touchMove = function(self, rayContact)
print('touched bird')
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
    isCaptured = isCaptured,

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

local new = function(name, spriteAtlas, geometry, wayPoints)

    local node = njli.Node.create()
    node:setName(name)

    local idx = string.find(name, "/")
    -- print(idx, name)
    -- name = string.sub(name, idx + 1)

    -- print("to " .. name)

--puffyBirdFront_00000
    -- local rootName = "puffyBird"
    local rootName = string.sub(name, idx + 1)

    local names =
    {
        -- display = string.sub(name, idx + 1),
        display = rootName,
        idle = rootName .. "_idle"
    }
    -- print("start jimbo")
    -- print(names.display)
    -- print(name)
    -- print("end jimbo")
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    node:addGeometry(geometry)
    
    local rigidBody = njli.PhysicsBodyRigid.create()
    rigidBody:setKinematicPhysics()
    node:addPhysicsBody(rigidBody)
    rigidBody:setCollisionGroup(CollisionGroups.dog)
    rigidBody:setCollisionMask(CollisionMasks.dog)
    rigidBody:enableHandleCollideCallback()

    -- local physicsShape = njli.PhysicsShapeBox.create()
    -- local physicsShape = njli.PhysicsShapeSphere.create()
    local physicsShape = njli.PhysicsShapeCylinder.create()
    physicsShape:setHalfExtentsZ(njli.btVector3( 4, 3, 1 ))
    physicsShape:setMargin(1)
    -- physicsShape:setRadius(3)
    rigidBody:addPhysicsShape(physicsShape)

    node:getStateMachine():pushState(nodeStates.display)

    local runAction = createRunAction()

    local Path = require("Path")
    local path = Path.new(wayPoints)
    path:loopOn()


    local assetPath = njli.ASSET_PATH("scripts/Params.lua")
    local Prm = loadfile(assetPath)()



    local maxSpeed = Prm.Dog.MaxSpeed
    local headingVector = njli.btVector3(0.0, 0.0, -1.0)
    local upVector = njli.btVector3(0.0, 1.0, 0.0)
    local turnRate = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber()
    local maxForce = Prm.Dog.MaxForce
    local me = require "MovingEntity"
    local movingEntity = me.new(node, maxSpeed, headingVector, upVector, turnRate, maxForce)

    
    path:loopOn()
    


    -- local nodeStateName = self.node:getStateMachine():getState():getName()
    -- nodeStateName = nodeStateName .. "_00000"
    local frameName = rootName .. "_00000"
    
    node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, frameName, false)
    node:runAction(runAction)
    

    local properties = 
    {
        node = node,
        nodeStateNames = names,
        nodeStates = nodeStates,
        rigidBody = rigidBody,
        physicsShape = physicsShape,
        runAction = runAction,

        frameName = frameName,

        rootName = rootName,

        movingEntity = movingEntity,
        path = path,
        frameNumber = 0,

        totalIdleTime = 0,

        Prm = Prm,

        --do not delete
        geometry = geometry,
        spriteAtlas = spriteAtlas,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
