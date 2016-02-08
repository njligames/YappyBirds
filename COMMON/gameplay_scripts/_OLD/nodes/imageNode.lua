local arg={...}

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local shouldScale = function(self)
    return self.toScale
end

local setScale = function(self, scale)
    self.menuScale = scale
end

local enter = function(self)
	local nodeStateName = self.node:getStateMachine():getState():getName()
	self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, true)
    self.dimSprite = self.node:getGeometry():getDimensions(self.node)
	local d = njli.btVector2( (self.dimSprite:x() * self.menuScale), (self.dimSprite:y() * self.menuScale) )
	self.node:getGeometry():setDimensions(self.node, d)
    self.node:show(njli.World.getInstance():getScene():getRootNode():getCamera())
end

local update = function(self, timeStep)
    local d = njli.btVector2( (self.dimSprite:x() * self.menuScale), (self.dimSprite:y() * self.menuScale) )
    self.node:getGeometry():setDimensions(self.node, d)
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
    -- local pos = rayContact:getTouchPosition()
    -- rayContact:getHitNode():setOrigin(pos)
    -- print("{ x = "..pos:x()..", y = "..pos:y().." }")
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
    shouldScale = shouldScale,
    setScale = setScale,
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

local new = function(name, geometry, spriteAtlas)
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
    
    local rigidBody = njli.PhysicsBodyRigid.create()
    rigidBody:setStaticPhysics()
    node:addPhysicsBody(rigidBody)

    -- local physicsShape = njli.PhysicsShapeBox2D.create()
    local physicsShape = njli.PhysicsShapeBox.create()
    rigidBody:addPhysicsShape(physicsShape)
    
    -- local scale = 1
    -- local dimScreen = njli.World.getInstance():getViewportDimensions()

    -- self.node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, name, true)
    -- local dimSprite = self.node:getGeometry():getDimensions(self.node)

    -- local xscale = dimScreen:x() / dimSprite:x()
    -- local yscale = dimScreen:y() / dimSprite:y()

    -- if xscale > yscale then
    --     scale = xscale
    -- else
    --     scale = yscale
    -- end

    local dimScreen = njli.World.getInstance():getViewportDimensions()

    node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas, name, true)
    local dimSprite = node:getGeometry():getDimensions(node)

    local scale = 1
    local xscale = dimScreen:x() / dimSprite:x()
    local yscale = dimScreen:y() / dimSprite:y()

    if xscale > yscale then
        scale = xscale
    else
        scale = yscale
    end

    -- print(node:getGeometry():getDimensions(node):x() .. ' ' .. node:getGeometry():getDimensions(node):y())

    node:getStateMachine():pushState(nodeStates.display)

    local properties = 
    {
    	node = node,
    	nodeStates = nodeStates,
        nodeStateNames = names,
        rigidBody = rigidBody,
        physicsShape = physicsShape,
    	spriteAtlas = spriteAtlas,
        menuScale = 1,
        dimSprite = nil,
        toScale = scale * 2.0,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
