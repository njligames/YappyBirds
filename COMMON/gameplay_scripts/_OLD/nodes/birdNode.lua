local arg={...}

function createPointToPointConstraint(nodeA, nodeB)
    local constraint = njli.PhysicsConstraintPointToPoint.create()

    local nodeAMin, nodeAMax = nodeA:getAabb()
    local nodBMin, nodeBMax = nodeB:getAabb()

    constraint:setNodes(nodeA, nodeB)
    constraint:setPivotInA(njli.btVector3(0,nodeAMin:y(),0))
    constraint:setPivotInB(njli.btVector3(0,0,0))

    return constraint
end

function createFrontFlyAction()
    local action = njli.Action.create()
    action:setName('ForwardFly')
    action:setRepeatForever()
    return action
end

-- local steering = (loadfile(njli.ASSET_PATH("scripts/steering.lua")))()

-- local number = 1
local actionUpdate = function(self, action, timeStep)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    local fps = 30.0
    local total = 1.0/fps

    self.frameTime = self.frameTime + self.clock:getTimeMilliseconds()
    if self.frameTime > total then
        self.frameTime = self.frameTime - total
        
        self.frameNumer = self.frameNumer + 1
        if self.frameNumer > 8 then
            self.frameNumer = 0
        end

        nodeStateName = nodeStateName .. "_0000" .. self.frameNumer
        self.frameName = nodeStateName
        
        self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, false)

        print("self.frameNumer = " .. self.frameNumer)
    end
end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    nodeStateName = nodeStateName .. "_00000"
    self.frameName = nodeStateName

    self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, false)
    self.node:runAction(self.frontFlyAction)


    local assetPath = njli.ASSET_PATH("scripts/Params.lua")
    local Prm = loadfile(assetPath)()


    -- print("The type.. " .. self.type)

    local maxSpeed = Prm.Bird[self.type].MaxSpeed
    local headingVector = njli.btVector3(0.0, 0.0, -1.0)
    local upVector = njli.btVector3(0.0, 1.0, 0.0)
    local turnRate = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber()
    local maxForce = Prm.Bird[self.type].MaxForce

    local me = require "MovingEntity"
    self.movingEntity = me.new(self.node, maxSpeed, headingVector, upVector, turnRate, maxForce)

    -- local cameraOrigin = self.node:getParentNode():getOrigin()
    -- local pos = njli.btVector3(cameraOrigin:x(),cameraOrigin:y(), 15)
    -- self.movingEntity:getSteeringBehaviors():setArriveOn(pos)
    -- self.movingEntity:getSteeringBehaviors():setPursuitOn(self.theDog.movingEntity)
    self.movingEntity:getSteeringBehaviors():setOffsetPursuitOn(self.theDog.movingEntity, njli.btVector3(0, 5, -1))
    



    -- local Path = require("Path")
    -- local path = Path.new()
    -- path:loopOn()
    -- path:addWayPoint(njli.btVector3(0,0,0))
    -- self.movingEntity:getSteeringBehaviors():setFollowPathOn(path)
end

local update = function(self, timeStep)
    -- if self.shouldDelete then
    --     self:__gc()
    --     self.level.spawnMachine:killBird()
    -- else
        self.movingEntity:update(timeStep)
    -- end
end

local exit = function(self)
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
    -- print("bird collide " .. otherNode:getName())
    local myGroup = self.node:getPhysicsBody():getCollisionGroup()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()

    -- if bit.band(otherGroup, CollisionGroups.dog) ~= 0 then
    --     print("Bird Collide with Dog")
    --     movingEntity:getSteeringBehaviors():setFollowPathOff()
    -- end

    if bit.band(otherGroup, CollisionGroups.projectile) ~= 0 then
        -- print("Bird Collide with Projectile")
        local cam = njli.World.getInstance():getScene():getRootNode():getCamera()
        self.node:hide(cam)

        -- self.shouldDelete = true
        self:__gc()
        self.level.spawnMachine:killBird()
        
    end

    if bit.band(otherGroup, CollisionGroups.dog) ~= 0 then
        if self.movingEntity:getVelocity():length() < 1 then
            self.movingEntity:getSteeringBehaviors():setOffsetPursuitOff()
            self.movingEntity:setVelocity(njli.btVector3(0, 0, 0))
            if self.constraint ~= nil then
                destroyObject(self.constraint)
            end
            self.constraint = createPointToPointConstraint(self.node, otherNode)

            otherNode:getPhysicsBody():setDynamicPhysics()
            self.node:getPhysicsBody():setDynamicPhysics()
            local direction = njli.btVector3(0, 1, 0)
            local magnitude = 100
            self.node:getPhysicsBody():applyForce(direction * magnitude, true)

        end
    end

    -- print(self.node:getPhysicsBody():getVelocity())
    

    -- print(myGroup)
end

local near = function(self, otherNode)
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

local setType = function(self, type)
    self.type = type
end

local delete = function(self)
    if self.constraint ~= nil then
        destroyObject(self.constraint)
    end

    destroyObject(self.frontFlyAction)

    
    destroyObject(self.rigidBody)
    destroyObject(self.physicsShape)
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

    setType = setType,

    __gc = delete
}

local new = function(name, spriteAtlas, geometry, dog, level)

    local node = njli.Node.create()
    node:setName(name)

    local idx = string.find(name, "/")
    -- print(idx, name)
    -- name = string.sub(name, idx + 1)

    -- print("to " .. name)

--puffyBirdFront_00000
    -- local rootName = "puffyBird"
    local rootName = string.sub(name, idx + 1)

    -- print("The name is: " .. rootName)

    local names =
    {
        -- display = string.sub(name, idx + 1),
        display = rootName,
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
    rigidBody:setCollisionGroup(CollisionGroups.bird)
    rigidBody:setCollisionMask(CollisionMasks.bird)
    rigidBody:enableHandleCollideCallback()

    local physicsShape = njli.PhysicsShapeCylinder.create()
    physicsShape:setHalfExtentsZ(njli.btVector3( 4, 3, 1 ))
    physicsShape:setMargin(1)
    rigidBody:addPhysicsShape(physicsShape)

    node:getStateMachine():pushState(nodeStates.display)

    local frontFlyAction = createFrontFlyAction()

    local frameName = rootName .. "_00000"

    local clock = njli.Clock.create()


    local properties = 
    {
        node = node,
        nodeStateNames = names,
        nodeStates = nodeStates,
        rigidBody = rigidBody,
        physicsShape = physicsShape,
        frontFlyAction = frontFlyAction,

        frameName = frameName,

        movingEntity = nil,

        frameNumer = 0,
        frameTime = 0,

        constraint = nil,

        shouldDelete = false,

        clock = clock,

        --do not delete
        geometry = geometry,
        spriteAtlas = spriteAtlas,
        theDog = dog,
        type = PuffyBird,
        level = level,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
