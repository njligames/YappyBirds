local arg={...}

local createParticleEmitter = function(self)
    local cameraNode = njli.World.getInstance():getScene():getRootNode()

    -- local particleFile = "particles/particle_test.pex"
    local particleFile = "particles/Fire.pex"
    local node = njli.Node.create()
    node:getStateMachine():pushState(njli.NodeState.create())
    local particleEmitter = njli.ParticleEmitter.create()

    njli.World.getInstance():getWorldResourceLoader():load(particleFile, particleEmitter, cameraNode:getCamera())

    node:addParticleEmitter(particleEmitter)
    particleEmitter:addShaderProgram(self.shader)

    node:setOrigin(self.node:getOrigin())

    return node
end

function createAnimateAction()
    local action = njli.Action.create()
    action:setName('animateSprite')
    action:setRepeatForever()
    return action
end

-- local steering = (loadfile(njli.ASSET_PATH("scripts/steering.lua")))()

local actionUpdate = function(self, action, timeStep)
    -- if action:getName() == "animateSprite" then
    --     print("yes")
    -- else
    --     print("no")
    -- end

    -- if action:getName() == "animateSprite" then
        self.animationIndex = self.animationIndex + 1
        if self.animationIndex > 2 then
            self.animationIndex = 0
        end


        self.frameName = self.rootName .. "_0000" .. self.animationIndex

        self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, self.frameName, false)

    -- end
end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    
    if self.nodeStates.display:getName() == nodeStateName then
        self.frameName = self.rootName .. "_0000" .. self.animationIndex
        self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, self.frameName, false)
        self.node:runAction(self.animateAction)
    elseif self.nodeStates.pop:getName() == nodeStateName then
        -- self.particleEmitter = self:createParticleEmitter()
    end
end

local update = function(self, timeStep)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.nodeStates.display:getName() == nodeStateName then
    elseif self.nodeStates.pop:getName() == nodeStateName then
        self:__gc()
    end

    -- if self.shouldDelete then
    --     self:__gc()
    -- end
    -- local x = self.node:getWorldTransform():getOrigin():x()
    -- local y = self.node:getWorldTransform():getOrigin():y()
    -- local z = self.node:getWorldTransform():getOrigin():z()

    -- print(njli.btDegrees(math.atan(x, z)), njli.btDegrees(math.atan(y, z)))

-- btQuaternion



    -- print(self.node:getWorldTransform():getOrigin())
    -- print(self.node:getOrigin())
    -- print('end')
    -- local cameraOrigin = self.node:getParentNode():getOrigin()
    -- cameraOrigin:setZ(cameraOrigin:z() * -1)
    -- local pos = njli.btVector3(cameraOrigin:x(),cameraOrigin:y(),15)

    -- local seekVel = Arrive(self, pos)
    -- self.node:getPhysicsBody():applyForce(seekVel * 2, true)


    
end

local exit = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    if self.nodeStates.display:getName() == nodeStateName then
    elseif self.nodeStates.pop:getName() == nodeStateName then
    end
end

local onMessage = function(self, message)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    if self.nodeStates.display:getName() == nodeStateName then
    elseif self.nodeStates.pop:getName() == nodeStateName then
    end
end

local collide = function(self, otherNode, collisionPoint)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.nodeStates.display and self.nodeStates.display:getName() == nodeStateName then
        local cam = njli.World.getInstance():getScene():getRootNode():getCamera()
        self.node:hide(cam)
        -- self.shouldDelete = true
        
        self.node:getStateMachine():pushState(self.nodeStates.pop)

    elseif self.nodeStates.pop and self.nodeStates.pop:getName() == nodeStateName then
    end

-- print("$$$$$$$$$$$$$$$$$")
--     print_r(self.nodeStates.display)
--     print(self.nodeStates)
--     print("$$$$$$$$$$$$$$$$$")
--     self:__gc()


    

    
    -- print("balloonNode collide " .. otherNode:getName())
end

local near = function(self, otherNode)
    -- local nodeStateName = self.node:getStateMachine():getState():getName()

    -- if self.nodeStates.display:getName() == nodeStateName then
    -- elseif self.nodeStates.pop:getName() == nodeStateName then
    -- end
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
    if self.particleEmitter then
        destroyObject(self.particleEmitter:getParticleEmitter())
        destroyObject(self.particleEmitter)
    end

    

    destroyObject(self.animateAction)
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
    createParticleEmitter = createParticleEmitter,

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

local new = function(name, spriteAtlas, geometry, shader)

    local node = njli.Node.create()
    node:setName(name)

    local idx = string.find(name, "/")
    -- print(idx, name)
    -- name = string.sub(name, idx + 1)

    -- print("to " .. name)

--puffyBirdFront_00000
    -- local rootName = "puffyBird"
    local rootName = string.sub(name, idx + 1)

    -- print("The rootName = " .. rootName)

    local names =
    {
        -- display = string.sub(name, idx + 1),
        display = rootName,
        pop = rootName .. "_pop",
    }

    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    node:addGeometry(geometry)
    
    local rigidBody = njli.PhysicsBodyRigid.create()
    rigidBody:setDynamicPhysics()
    rigidBody:enableHandleCollideCallback()
    rigidBody:setCollisionGroup(CollisionGroups.projectile)
    rigidBody:setCollisionMask(CollisionMasks.projectile)

    local physicsShape = njli.PhysicsShapeCylinder.create()
    physicsShape:setHalfExtentsZ(njli.btVector3( 4.5, 3, 1 ))
    physicsShape:setMargin(1)

    rigidBody:addPhysicsShape(physicsShape)

    node:addPhysicsBody(rigidBody)

    

    node:getStateMachine():pushState(nodeStates.display)

    local animateAction = createAnimateAction()


    local properties = 
    {
        node = node,
        nodeStateNames = names,
        nodeStates = nodeStates,
        rigidBody = rigidBody,
        physicsShape = physicsShape,
        animateAction = animateAction,
        animationIndex = 0,

        frameName = rootName .. "_00000",

        rootName = rootName,
        -- shouldDelete = false,

        particleEmitter = nil,

        --do not delete
        geometry = geometry,
        spriteAtlas = spriteAtlas,
        shader = shader,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
