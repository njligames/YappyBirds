local arg={...}
local allStates = nil
local theNode = nil



function createPushDownAction()
    local action = njli.Action.create()
    action:setName('DownAction')
    action:setDuration(.1)
    action:setRepeat(0)
    return action
end

function createPushUpAction()
    local action = njli.Action.create()
    action:setName('UpAction')
    action:setDuration(.1)
    action:setRepeat(0)
    return action
end

function DownActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    -- print(action:getName() .. ' ' .. action:getClassName() .. ' - ' .. step .. ' / ' .. timeLeft .. ' Repeats: ' .. action:getRepeatCount())

    theNode:getStateMachine():pushState(allStates.on)
end

function UpActionUpdate(action, timeStep)
    local step = string.format("%.3f", timeStep)
    local timeLeft = string.format("%.3f", action:getTimeLeft())
    -- print(action:getName() .. ' ' .. action:getClassName() .. ' - ' .. step .. ' / ' .. timeLeft .. ' Repeats: ' .. action:getRepeatCount())

    theNode:getStateMachine():pushState(allStates.off)
end

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local toggle = function(self)
    if self:isOn() then
        self:off()
    else
        self:on()
    end
end

local isOn = function(self)
    return self.node:getStateMachine():getState():getName() == self.nodeStateNames.on
end

local on = function(self)
    if not self:isOn() then
        -- print("turn on")
        self.node:getStateMachine():pushState(self.nodeStates.on)
    end
end

local off = function(self)
    if self:isOn() then
        -- print("turn off")
        self.node:getStateMachine():pushState(self.nodeStates.off)
    end
end
----------------------------------------------

local enter = function(self)
	local nodeStateName = self.node:getStateMachine():getState():getName()
	self.node:getGeometry():setSpriteAtlasFrame(self.node, self.spriteAtlas, nodeStateName, true)
    local dimSprite = self.node:getGeometry():getDimensions(self.node)
	local d = njli.btVector2( (dimSprite:x() * self.menuScale), (dimSprite:y() * self.menuScale) )
	self.node:getGeometry():setDimensions(self.node, d)

    self.node:show(njli.World.getInstance():getScene():getRootNode():getCamera())

    self.physicsShape:setHalfExtends(njli.btVector3( (dimSprite:x() * self.menuScale), (dimSprite:y() * self.menuScale), 1 ))

    -- print(string.format("enter.. dimension %s", d))
    -- print(self.node:getStateMachine():getState():getName() .. " enter")
    -- print(nodeStateName)
end

local update = function(self, timeStep)
    local nodeStateName = self.node:getStateMachine():getState():getName()

    if self.toggler then
        if self.justSwitchedTouched then
            self:toggle()
            self.justSwitchedTouched = false
        end
    else
        if not self.node:isTouched() then
            self:off()
        elseif self.node:isTouched() then
            self:on()
        end
    end
    -- print(nodeStateName)
end

local exit = function(self)
    local nodeStateName = self.node:getStateMachine():getState():getName()
    -- print(nodeStateName)
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
end

local near = function(self, otherNode)
end

local touchDown = function(self, rayContact)
    self.justSwitchedTouched = true
    -- print("touchDown")
end

local touchUp = function(self, rayContact)
    self.fun()
    -- print("touchUp")
end

local touchMove = function(self, rayContact)
    -- local pos = rayContact:getTouchPosition()
    -- rayContact:getHitNode():setOrigin(pos)
    -- print("{ x = "..pos:x()..", y = "..pos:y().." }")
    -- print("touchMove")
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
    toggle = toggle,
    isOn = isOn,
    on = on,
    off = off,
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

local new = function(name, geometry, spriteAtlas, scale, fun, toggler)
	local node = njli.Node.create()
    node:setName(name)

    local names =
    {
    	off = "butn_" .. name .. "_off",
    	on = "butn_" .. name .. "_on"
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
    

    node:getStateMachine():pushState(nodeStates.off)

    local properties = 
    {
    	node = node,
    	nodeStates = nodeStates,
        nodeStateNames = names,
        rigidBody = rigidBody,
        physicsShape = physicsShape,
    	spriteAtlas = spriteAtlas,
    	menuScale = scale,
        fun = fun,
        toggler = toggler,
        isTouched = false,
        justSwitchedTouched = false,
    	-- pushDownAction = createPushDownAction(),
    	-- pushUpAction = createPushUpAction()



        -- ismoving = false,
        -- startposition = nil,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
