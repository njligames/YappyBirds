-- local function createAction()
--     local action = njli.Action.create()
--     action:setName('ForwardFly')
--     action:setRepeatForever()

--     local frameAction = "idle"
--     local frameNumber = 0
--     local frameIncrement = 1
--     local frameSide = "front"

--     return action, frameAction, frameSide, frameNumber, frameIncrement
-- end

local function getFrameName(rootName, frameAction, frameSide, frameNumber)
    local folderName = rootName .. "_" .. frameAction .. "_" .. frameSide
    local fileName = folderName .. "_" .. string.format("%.5d", frameNumber)

    return folderName .. "/" .. fileName
end

local setCurrentFrame = function(self, frameNumber)
    local frameName = getFrameName(self.rootName, self.frameAction, self.frameSide, frameNumber)
    setupSpriteFrame(frameName, self.node, self.characterSheetInfo, self.spriteAtlas, self.geometry)
    -- self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, frameName, false)
end

-- ######################################################################################################################

local actionUpdate = function(self, action, timeStep)
    local node = action:getParent()
    local nodeName = node:getName()
    local nodeStateName = node:getStateMachine():getState():getName()
end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()
    print("enter (" .. nodeName .. "->" .. nodeStateName .. ")")

end

local update = function(self, timeStep)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()
    -- print("update (" .. nodeName .. "->" .. nodeStateName .. ")")

end

local exit = function(self)
    local nodeName = self.node:getName()
    local nodeStateName = self.node:getStateMachine():getState():getName()
    print("exit (" .. nodeName .. "->" .. nodeStateName .. ")")

end

local onMessage = function(self, message)
end

local render = function(self)
end

local collide = function(self, otherNode, collisionPoint)
    local myGroup = self.node:getPhysicsBody():getCollisionGroup()
    local otherGroup = otherNode:getPhysicsBody():getCollisionGroup()
    local nodeStateName = self.node:getStateMachine():getState():getName()
    local otherStateName = otherNode:getStateMachine():getState():getName()
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

    -- njli.PhysicsShape.destroy(self.physicsShape)
    -- self.physicsShape = nil

    -- njli.PhysicsBody.destroy(self.physicsBody)
    -- self.physicsBody = nil

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

    print("delete (" .. nodeName .. ")")
end

local methods = 
{
    setCurrentFrame = setCurrentFrame,

-- #########################################    

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

local new = function(name, characterSheetInfo, spriteAtlas, geometry, type)
    print("new (" .. name .. ")")

    local node = njli.Node.create()
    node:setName(name)

    local rootName = string.sub(name, string.find(name, "/") + 1) 

    local names =
    {
        grab = rootName .. "_grab",
        hit = rootName .. "_hit",
        idle = rootName .. "_idle",
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
    node:getPhysicsBody():setCollisionMask(CollisionMasks.none)
    node:getPhysicsBody():enableHandleCollideCallback()
    -- node:getPhysicsBody():setDynamicPhysics()
    node:getPhysicsBody():setKinematicPhysics()





    local frameAction = "idle"
    local frameNumber = 0
    local frameIncrement = 1
    local frameSide = "front"
    
    -- local action, frameAction, frameSide, frameNumber, frameIncrement = createAction(rootName)
    local frameName = getFrameName(rootName, frameAction, frameSide, frameNumber)

-- print("$$$$$ frameName = " .. frameName)

    node:getStateMachine():pushState(nodeStates.idle)
    
    -- local frameAction = "idle"
    -- local frameNumber = 0
    -- local frameSide = "front"
    -- local type = type

    -- local frameName = getFrameName(type, frameAction, frameSide, frameNumber)

    -- node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, frameName, false)

    -- print_r(characterSheetInfo:getSheet())
    -- print("frameName = " .. frameName)
    -- local frameIndex = characterSheetInfo:getFrameIndex(frameName)
    -- print("frameIndex = " .. frameIndex)

    -- local width = characterSheetInfo:getSheet().frames[frameIndex].width - 2
    -- local height = characterSheetInfo:getSheet().frames[frameIndex].height - 2
    -- local divisor = getGameViewDivisor()
    -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- node:getGeometry():setDimensions(node, dimSprite)

    setupSpriteFrame(frameName, node, characterSheetInfo, spriteAtlas, geometry)

    node:show(getPerspectiveCamera())

    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        physicsBody = physicsBody,
        physicsShape = physicsShape,

        spriteAtlas = spriteAtlas,

        action = action,
        frameAction = frameAction,
        frameSide = frameSide,
        frameNumber = frameNumber,
        frameIncrement = frameIncrement,
        frameName = frameName,

        rootName = rootName,

        instanceName = name,

--Do not DELETE below this comment

        characterSheetInfo = characterSheetInfo,
        spriteAtlas = spriteAtlas,
        geometry = geometry,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
