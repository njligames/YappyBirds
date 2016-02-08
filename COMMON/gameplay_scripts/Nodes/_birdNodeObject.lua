local function createPointToPointConstraint(birdNode, dogNode)
    local constraint = njli.PhysicsConstraintPointToPoint.create()

    local birdNode_min, birdNode_max = birdNode:getAabb()
    local dogNode_min, dogNode_max = dogNode:getAabb()

    constraint:setNodes(birdNode, dogNode, 
        njli.btVector3(0,birdNode_min:y(),0), njli.btVector3(0,dogNode_max:y() - 3,1))

    return constraint
end

-- local function createBeakConstraint(birdNode, beakNode)
--     local constraint = njli.PhysicsConstraintFixed.create()

--     local contactPoint = birdNode:getOrigin()
--     contactPoint:setZ(contactPoint:z() - 0.1)

--     local globalFrame = njli.btTransform.getIdentity()
--     globalFrame:setOrigin(contactPoint)

--     local birdFrame = birdNode:getWorldTransform():inverse() * globalFrame
--     local beakFrame = beakNode:getWorldTransform():inverse() * globalFrame

--     constraint:setNodes(birdNode, beakNode, birdFrame, beakFrame)

--     return constraint
-- end

-- local function createBeakConstraint2(birdNode, beakNode)
--     local constraint = njli.PhysicsConstraintPointToPoint.create()

--     constraint:setNodes(birdNode, beakNode, 
--         njli.btVector3(0,0,-0.1), njli.btVector3(0, 0, 0))

--     return constraint
-- end

local function getFrameName(rootName, frameAction, frameSide, frameNumber)
    local folderName = rootName .. "_" .. frameAction .. "_" .. frameSide
    local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

    return folderName .. "/" .. fileName
end

local function createAction()
    local action = njli.Action.create()
    action:setName('ForwardFly')
    action:setRepeatForever()

    local frameAction = "idle"
    local frameNumber = 0
    local frameIncrement = 1
    local frameSide = "front"

    return action, frameAction, frameSide, frameNumber, frameIncrement
end

local function createMovingEntity(node, type)
    local assetPath = njli.ASSET_PATH("scripts/Params.lua")
    if njli.World.getInstance():isDebug() then
        assetPath = njli.DOCUMENT_PATH("scripts/Params.lua")
    end
    
    local Prm = loadfile(assetPath)()

    local maxSpeed = Prm.Bird[type].MaxSpeed
    local headingVector = njli.btVector3(0.0, 0.0, -1.0)
    local upVector = njli.btVector3(0.0, 1.0, 0.0)
    local turnRate = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber()
    local maxForce = Prm.Bird[type].MaxForce

    local me = require "steering.MovingEntity"
    local movingEntity = me.new(node, maxSpeed, headingVector, upVector, turnRate, maxForce)

    return movingEntity, Prm
end


local addOtherBird = function(self, bird)
    if bird == nil then
        stackTrace("bird == nil")
    elseif bird.movingEntity == nil then
        stackTrace("bird.movingEntity == nil")
    elseif self == nil then
        stackTrace("self == nil")
    elseif self.movingEntity == nil then
        stackTrace("self.movingEntity == nil")
    else

        bird.movingEntity:setTagged(true)
        self.movingEntity:getSteeringBehaviors():addSeparationEntity(bird)
    end
end

local removeOtherBird = function(self, bird)
    bird.movingEntity:setTagged(false)
    self.movingEntity:getSteeringBehaviors():removeSeparationEntity(bird)
end

-- local setType = function(self, type)
--     self.type = type
-- end


local pushFly = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.fly)
end

local pushPursue = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.pursue)
end

local pushHit = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.hit)
end

local pushGrabbing = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.grabbing)
end

local pushGrabbed = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.grabbed)
end

local pushYap = function(self)
    self.node:getStateMachine():pushState(self.nodeStates.yap)
end






local isFlyState = function(self)
    return self.nodeStates.fly:getName() == self.node:getStateMachine():getState():getName()
end

local isPursueState = function(self)
    return self.nodeStates.pursue:getName() == self.node:getStateMachine():getState():getName()
end

local isHitState = function(self)
    return self.nodeStates.hit:getName() == self.node:getStateMachine():getState():getName()
end

local isGrabbingState = function(self)
    return self.nodeStates.grabbing:getName() == self.node:getStateMachine():getState():getName()
end

local isGrabbedState = function(self)
    return self.nodeStates.grabbed:getName() == self.node:getStateMachine():getState():getName()
end

local isYapState = function(self)
    return self.nodeStates.yap:getName() == self.node:getStateMachine():getState():getName()
end

local resetAttackTime = function(self)
    self.currentAttackTime = self.params.Bird[self.type].AttackTime
end

local canAttack = function(self)
    local otherEntities = self.movingEntity:getSteeringBehaviors():getSeparationEntities()
    for k,v in pairs(otherEntities) do
        if not otherEntities[k]:isFlyState() then
            return false
        end
    end
    return true
end

local pause = function(self)
    self.paused = true
    self.pausedVelocity = njli.btVector3(self.physicsBody:getVelocity())
    self.physicsBody:setVelocity(njli.btVector3(0,0,0))
end

local unPause = function(self)
    self.paused = false
    self.physicsBody:applyForce(self.pausedVelocity, true)
end

--##############################################################

local actionUpdate = function(self, action, timeStep)
    local node = action:getParent()
    local nodeName = node:getName()
    local nodeStateName = node:getStateMachine():getState():getName()

    -- print("actionUpdate (" .. nodeName .. "->" .. nodeStateName .. ")")

    if (self.clock:getTimeMilliseconds() / 1000) > (1.0/30.0) then
        self.clock:reset()
        
        self.frameNumber = self.frameNumber + self.frameIncrement
        if self.frameNumber > 8 then
            self.frameNumber = 0
        end

        -- self.frameName = getFrameName(self.rootName, self.frameAction, self.frameSide, self.frameNumber)

        local frameName = getFrameName(self.rootName, self.frameAction, self.frameSide, self.frameNumber)
        setupSpriteFrame(frameName, self.node, self.characterSheetInfo, self.spriteAtlas, self.geometry)
        self.frameName = frameName

        -- self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, self.frameName, false)

        -- local frameIndex = self.characterSheetInfo:getFrameIndex(self.frameName)
        -- local width = self.characterSheetInfo:getSheet().frames[frameIndex].width - 2
        -- local height = self.characterSheetInfo:getSheet().frames[frameIndex].height - 2
        -- local divisor = getGameViewDivisor()
        -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
        -- self.node:getGeometry():setDimensions(self.node, dimSprite)



        local AabbMin, AabbMax = self.node:getGeometry():getAabb(self.node)

        AabbMax = AabbMax * self.node:getScale()
        AabbMax:setZ(1.0)
        self.physicsShape:setHalfExtentsZ(AabbMax)

        if self.currentTauntSound and self.currentTauntSound:isPlaying() then
            self.beakNode:setCurrentFrame(self.frameNumber)
        else
            self.beakNode:setCurrentFrame(1)
        end
    end



    if self.nodeStates.spawn:getName() == nodeStateName then
    elseif self.nodeStates.fly:getName() == nodeStateName then
    elseif self.nodeStates.pursue:getName() == nodeStateName then
    elseif self.nodeStates.hit:getName() == nodeStateName then
    elseif self.nodeStates.grabbing:getName() == nodeStateName then
    elseif self.nodeStates.grabbed:getName() == nodeStateName then
        assert(self.node:getPhysicsBody():isDynamicPhysics(), "must be in dynamic physics")
        assert(self.dog.node:getPhysicsBody():isDynamicPhysics(), "dog must be in dynamic physics")

        local direction = njli.btVector3(0, 1, 0)
        local StealSpeed = self.params.Bird[self.type].StealSpeed
        local magnitude = ((1 * self.frameNumber) * StealSpeed)

        self.node:getPhysicsBody():applyForce(direction * magnitude, true)

    elseif self.nodeStates.yap:getName() == nodeStateName then
    else
        assert(false, "unaccounted node state")
    end
end

local actionComplete = function(action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()

    print("enter (" .. nodeName .. "->" .. nodeStateName .. ")")

    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.nodeStates.spawn:getName() == nodeStateName then
        self.node:runAction(self.action)
        self:pushFly()
    elseif self.nodeStates.fly:getName() == nodeStateName then

        self.node:getPhysicsBody():setCollisionGroup(CollisionGroups.bird)
        self.node:getPhysicsBody():setCollisionMask(CollisionMasks.bird)
        self.node:getPhysicsBody():enableHandleCollideCallback()
        self.node:getPhysicsBody():setKinematicPhysics()

        self.frameAction = "idle"
        self.frameIncrement = 1


        -- local AabbMin, AabbMax = self.node:getGeometry():getAabb(self.node)

        -- AabbMax = AabbMax * self.node:getScale()
        -- AabbMax:setX(0)
        -- AabbMax:setY(AabbMax:y() * 2)
        -- AabbMax:setZ(-1.0)

        local offset = njli.btVector3(0, 20, -1.0)


        self.movingEntity:getSteeringBehaviors():setOffsetPursuitOn(self.dog.movingEntity, offset)
        self.movingEntity:getSteeringBehaviors():setSeparationOn()
        self.movingEntity:getSteeringBehaviors():setEvadeOn(self.dog.movingEntity)

        self:resetAttackTime()

        
        local startTime = math.random(1000 * 1, 1000 * 3)
        self.tauntTimer:start(startTime)

    elseif self.nodeStates.pursue:getName() == nodeStateName then

        self.node:getPhysicsBody():setCollisionGroup(CollisionGroups.bird)
        self.node:getPhysicsBody():setCollisionMask(CollisionMasks.bird)
        self.node:getPhysicsBody():enableHandleCollideCallback()
        self.node:getPhysicsBody():setKinematicPhysics()

        self.frameAction = "idle"
        self.frameIncrement = 1


        local AabbMin, AabbMax = self.node:getGeometry():getAabb(self.node)

        AabbMax = AabbMax * self.node:getScale()
        AabbMax:setX(0)
        -- AabbMax:setY(AabbMax:y() * 2)
        AabbMax:setZ(-1.0)


        self.movingEntity:getSteeringBehaviors():setOffsetPursuitOn(self.dog.movingEntity, AabbMax)

    elseif self.nodeStates.hit:getName() == nodeStateName then

        self.currentDieSound = self.dieSounds[math.random(1, #self.dieSounds)]
        if not self.currentDieSound:isPlaying() then
            self.currentDieSound:play()
        end
        




        self.frameAction = "hit"
        self.frameIncrement = 0


        if self.constraint ~= nil then
            njli.PhysicsConstraintPointToPoint.destroy(self.constraint)
            self.constraint = nil

            self.dog:pushReleased()
        end

        self.movingEntity:setVelocity(njli.btVector3(0,0,0))
        self.node:getPhysicsBody():setVelocity(njli.btVector3(0,0,0))
        
        self.node:getPhysicsBody():setDynamicPhysics()

        self.node:getPhysicsBody():setCollisionMask(CollisionMasks.birdDead)

        local direction = njli.btVector3(0, -1, 0)
        local magnitude = 10

        self.node:getPhysicsBody():applyForce(direction * magnitude, true)

    elseif self.nodeStates.grabbing:getName() == nodeStateName then
        self.frameAction = "grab"

        self.movingEntity:setVelocity(njli.btVector3(0,0,0))
        self.node:getPhysicsBody():setVelocity(njli.btVector3(0,0,0))

        self.node:getPhysicsBody():setCollisionMask(CollisionMasks.birdGrabbing)
        self.node:getPhysicsBody():setDynamicPhysics()

    elseif self.nodeStates.grabbed:getName() == nodeStateName then

        if not self.dog:isCaughtState() then
            self.dog:pushCaught()
        end

        self.constraint = createPointToPointConstraint(self.node, self.dog.node)

        


    elseif self.nodeStates.yap:getName() == nodeStateName then
    else
        assert(false, "unaccounted node state")
    end
end

local update = function(self, timeStep)

    if self.paused then
        return
    end

    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()


    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.node:getPhysicsBody():isKinematicPhysics() then
        self.movingEntity:update(timeStep)
    end
    
    if self.nodeStates.spawn:getName() == nodeStateName then
    elseif self.nodeStates.fly:getName() == nodeStateName then

        local shouldPlay = false
        if self.tauntTimer:isFinished() then

            self.currentTauntSound = self.tauntSounds[math.random(1, #self.tauntSounds)]
            
            if not self.currentTauntSound:isPlaying() then
                shouldPlay = true
            end

        end

        if shouldPlay then
            -- self.currentTauntSound:play()

            local startTime = math.random(1000 * 8, 1000 * 10)
            self.tauntTimer:start(startTime)
        end

        

        self.currentAttackTime = self.currentAttackTime - timeStep
        if self.currentAttackTime <= 0 then
            if self:canAttack() then
                local otherEntities = self.movingEntity:getSteeringBehaviors():getSeparationEntities()
                for k,v in pairs(otherEntities) do
                    otherEntities[k]:resetAttackTime()
                end

                
                -- self:pushPursue()
                print(self.node:getName() .. " should pursue")
            end
            -- print(self.node:getName() .. " should attack")
            self:resetAttackTime()
        end

        self.tauntTimer:tick()

    elseif self.nodeStates.pursue:getName() == nodeStateName then
        
    elseif self.nodeStates.hit:getName() == nodeStateName then
        if self.node:getOrigin():y() < self.params.Bird.DieY then
            self.owner:destroyBirdNode(self)
        end
    elseif self.nodeStates.grabbing:getName() == nodeStateName then

        self:pushGrabbed()

    elseif self.nodeStates.grabbed:getName() == nodeStateName then
    elseif self.nodeStates.yap:getName() == nodeStateName then
    else
        assert(false, "unaccounted node state")
    end

    
    -- self.beakNode.node:setTransform(self.node:getWorldTransform())
    -- local origin = self.beakNode.node:getOrigin()
    -- origin:setZ(origin:z() - 0.1)
    -- self.beakNode.node:setOrigin(origin)
    
end

local exit = function(self)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()

    -- print("exit (" .. nodeName .. "->" .. nodeStateName .. ")")

    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.nodeStates.spawn:getName() == nodeStateName then
    elseif self.nodeStates.fly:getName() == nodeStateName then
        self.movingEntity:getSteeringBehaviors():setOffsetPursuitOff()
        self.movingEntity:getSteeringBehaviors():setSeparationOff()
        self.movingEntity:getSteeringBehaviors():setEvadeOff()
    elseif self.nodeStates.pursue:getName() == nodeStateName then
        self.movingEntity:getSteeringBehaviors():setOffsetPursuitOff()
        self.movingEntity:getSteeringBehaviors():setSeparationOff()
    elseif self.nodeStates.hit:getName() == nodeStateName then
    elseif self.nodeStates.grabbing:getName() == nodeStateName then
    elseif self.nodeStates.grabbed:getName() == nodeStateName then
    elseif self.nodeStates.yap:getName() == nodeStateName then
    else
        assert(false, "unaccounted node state")
    end
end

local onMessage = function(self, message)
end

local render = function(self)
    -- self.beakNode.node:setTransform(self.node:getWorldTransform())
    -- local origin = self.beakNode.node:getOrigin()
    -- origin:setZ(origin:z() + -0.1)
    -- self.beakNode.node:setOrigin(origin)
end

local collide = function(self, otherNode, collisionPoint)
    local myGroup = self.node:getPhysicsBody():getCollisionGroup()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()
    local nodeStateName = self.node:getStateMachine():getState():getName()
    local otherStateName = otherNode:getStateMachine():getState():getName()

    if bit.band(otherGroup, CollisionGroups.projectile) ~= 0 then
        self:pushHit()
    elseif bit.band(otherGroup, CollisionGroups.dog) ~= 0 then

        if self.nodeStates.spawn:getName() == nodeStateName then
        elseif self.nodeStates.fly:getName() == nodeStateName then
            
        elseif self.nodeStates.pursue:getName() == nodeStateName then
            local distanceFromTarget = self.movingEntity:getSteeringBehaviors():getOffsetPursueDistance()
            local birdSpeed = self.movingEntity:getSpeed()

            if distanceFromTarget <= 1 and birdSpeed < 1 then
                self:pushGrabbing()
            end
        elseif self.nodeStates.hit:getName() == nodeStateName then
        elseif self.nodeStates.grabbing:getName() == nodeStateName then
        elseif self.nodeStates.grabbed:getName() == nodeStateName then
        elseif self.nodeStates.yap:getName() == nodeStateName then
        else
            assert(false, "unaccounted node state")
        end
    end
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

    -- njli.PhysicsConstraint.destroy(self.beakConstraint)

    self.node:getStateMachine():pushState(nil)

    if self.constraint ~= nil then
        njli.PhysicsConstraintPointToPoint.destroy(self.constraint)
        self.constraint = nil
    end

    njli.Clock.destroy(self.clock)
    self.clock = nil

    njli.Action.destroy(self.action)
    self.action = nil

    njli.PhysicsShapeCylinder.destroy(self.physicsShape)
    self.physicsShape = nil

    njli.PhysicsBody.destroy(self.rigidBody)
    self.rigidBody = nil

    njli.Node.destroy(self.node)
    self.node = nil

    for k,v in pairs(self.nodeStates) do
        njli.NodeState.destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    for k,v in pairs(self.dieSounds) do
        njli.Sound.destroy(v)
    end

    for k,v in pairs(self.tauntSounds) do
        njli.Sound.destroy(v)
    end

    njli.Timer.destroy(self.tauntTimer)

    removeNodeObject(self.beakNode)

    print("delete (" .. nodeName .. ")")
end

local methods = 
{
    addOtherBird = addOtherBird,
    removeOtherBird = removeOtherBird,
    -- setType = setType,


    pushFly = pushFly,
    pushPursue = pushPursue,
    pushHit = pushHit,
    pushGrabbing = pushGrabbing,
    pushGrabbed = pushGrabbed,
    pushYap = pushYap,








    isFlyState = isFlyState,
    isPursueState = isPursueState,
    isHitState = isHitState,
    isGrabbingState = isGrabbingState,
    isGrabbedState = isGrabbedState,
    isYapState = isYapState,



    resetAttackTime = resetAttackTime,

    canAttack = canAttack,


    pause = pause,
    unPause = unPause,

--##############################################################

    actionUpdate = actionUpdate,
    actionComplete = actionComplete,
    hide = hide,
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

local new = function(owner, name, characterSheetInfo, spriteAtlas, geometry, dog, level, type)
    print("new (" .. name .. ")")

    print("**************************************************************")
    
    print("**************************************************************")

    -- local type = "puffyBird"

    local node = njli.Node.create()
    node:setName(name)

    local rootName = string.sub(name, string.find(name, "/") + 1)

    local names =
    {
        spawn = rootName .. "_spawn",
        fly = rootName .. "_fly",
        pursue = rootName .. "_pursue",
        hit = rootName .. "_hit",
        grabbing = rootName .. "_grabbing",
        grabbed = rootName .. "_grabbed",
        yap = rootName .. "_yap"
    }
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    -- node:addGeometry(geometry)

    local physicsBody = njli.PhysicsBodyRigid.create()
    local physicsShape = njli.PhysicsShapeCylinder.create()
    
    physicsShape:setMargin(1)
    physicsBody:addPhysicsShape(physicsShape)

    

    node:addPhysicsBody(physicsBody)

    physicsBody:setLinearFactor(njli.btVector3(1,1,0))
    physicsBody:setAngularFactor(njli.btVector3(0,0,1))

    node:getPhysicsBody():setCollisionGroup(CollisionGroups.bird)
    node:getPhysicsBody():setCollisionMask(CollisionMasks.bird)
    node:getPhysicsBody():enableHandleCollideCallback()
    node:getPhysicsBody():setKinematicPhysics()


    local action, frameAction, frameSide, frameNumber, frameIncrement = createAction(rootName)

    local movingEntity, params = createMovingEntity(node, type)

    node:getStateMachine():pushState(nodeStates.spawn)

    njli.World.getInstance():getScene():getRootNode():addChildNode(node)
    
    local frameName = getFrameName(rootName, frameAction, frameSide, frameNumber)

    -- node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, frameName, false)



    -- local frameIndex = characterSheetInfo:getFrameIndex(frameName)
    -- local width = characterSheetInfo:getSheet().frames[frameIndex].width - 2
    -- local height = characterSheetInfo:getSheet().frames[frameIndex].height - 2
    -- local divisor = getGameViewDivisor()
    -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- node:getGeometry():setDimensions(node, dimSprite)




    -- node:runAction(action)

    local currentAttackTime = params.Bird[type].AttackTime

    local birdMouthNodeObject = require "nodes.birdMouthNodeObject"
    beakNode = birdMouthNodeObject.new(name .. "_mouth", characterSheetInfo, spriteAtlas, geometry, type)

    
    node:addChildNode(beakNode.node)
    beakNode.node:setOrigin(njli.btVector3(0,0,-.1))
    insertNodeObject(beakNode, beakNode.instanceName)

    


    setupSpriteFrame(frameName, node, characterSheetInfo, spriteAtlas, geometry)

    local dieSounds = {}
    local tauntSounds = {}

    for k,v in pairs(_SOUNDPATHS.gameplay.effects.bird[type].die) do

        local sound = njli.Sound.create()
        njli.World.getInstance():getWorldResourceLoader():load(v, sound)
        table.insert(dieSounds, sound)

    end

    for k,v in pairs(_SOUNDPATHS.gameplay.effects.bird[type].taunt) do

        local sound = njli.Sound.create()
        njli.World.getInstance():getWorldResourceLoader():load(v, sound)
        table.insert(tauntSounds, sound)

    end

    

    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        physicsBody = physicsBody,
        physicsShape = physicsShape,

        action = action,
        frameAction = frameAction,
        frameSide = frameSide,
        frameNumber = frameNumber,
        frameIncrement = frameIncrement,
        frameName = frameName,

        movingEntity = movingEntity,
        params = params,

        clock = njli.Clock.create(),

        instanceName = name,
        owner = owner,
        rootName = rootName,

        currentAttackTime = currentAttackTime,

        type = type,

        beakNode = beakNode,

        -- beakConstraint = beakConstraint,

--Do not DELETE below this comment

        characterSheetInfo = characterSheetInfo,
        spriteAtlas = spriteAtlas,
        geometry = geometry,
        dog = dog,

        paused = false,
        pausedVelocity = njli.btVector3(0,0,0),

        dieSounds = dieSounds,

        tauntSounds = tauntSounds,

        tauntTimer = njli.Timer.create(),

        currentTauntSound = nil,
        currentDieSound = nil,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
