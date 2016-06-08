local NJLINodeEntityState = {}
NJLINodeEntityState.__index = NJLINodeEntityState

local json = require('JSON')

setmetatable(NJLINodeEntityState, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function NJLINodeEntityState:className()
 return "NJLINodeEntityState"
end

function NJLINodeEntityState:class()
 return self
end

function NJLINodeEntityState:superClass()
 return nil
end

function NJLINodeEntityState:isa(theClass)
 local b_isa = false
 local cur_class = theClass:class()
 while ( nil ~= cur_class ) and ( false == b_isa ) do
 if cur_class == theClass then
 b_isa = true
 else
 cur_class = cur_class:superClass()
 end
 end

 return b_isa
end

function NJLINodeEntityState:destroy()
 NJLINodeEntityState.__gc(self)
end


local init =
{
 name = "name",
 entityOwner = nil
}

function NJLINodeEntityState:create(init)
 
 assert(init, "init variable is nil.")
 assert(init.name, "Init variable is expecting a name")
 assert(init.entityOwner, "Init variable is expecting a entityOwner")

 self._init = init

 self:load()
end

function NJLINodeEntityState:__gc()
 
 self:unLoad()
end

function NJLINodeEntityState:__tostring()
 
 return json.encode(self)
end

function NJLINodeEntityState:getNodeState()
 return self._nodeState
end

function NJLINodeEntityState:getEntityOwner()
 return self._entityOwner
end

function NJLINodeEntityState:load()
 self:unLoad()

 self._entityOwner = self._init.entityOwner
 self._nodeState = njli.NodeState.create()

 self:getNodeState():setName(self._init.name)
end

function NJLINodeEntityState:unLoad()
 if self:getNodeState() then
 njli.NodeState.destroy(self:getNodeState())
 end
 self._nodeState = nil

 self._entityOwner = nil
end

function NJLINodeEntityState:push() 
 self:getEntityOwner():getNode():getStateMachine():pushState(self:getNodeState()) 
end

function NJLINodeEntityState:isIn()
 return self:getNodeState():getName() == self:getEntityOwner():getNode():getStateMachine():getState():getName()
end

function NJLINodeEntityState:enter() assert(false, "overwrite: NJLINodeEntityState:enter") end
function NJLINodeEntityState:update(timeStep) assert(false, "overwrite: NJLINodeEntityState:update") end
function NJLINodeEntityState:exit() assert(false, "overwrite: NJLINodeEntityState:exit") end
function NJLINodeEntityState:onMessage(message) assert(false, "overwrite: NJLINodeEntityState:onMessage") end
function NJLINodeEntityState:touchDown(touches) assert(false, "overwrite: NJLINodeEntityState:touchDown") end
function NJLINodeEntityState:touchUp(touches) assert(false, "overwrite: NJLINodeEntityState:touchUp") end
function NJLINodeEntityState:touchMove(touches) assert(false, "overwrite: NJLINodeEntityState:touchMove") end
function NJLINodeEntityState:touchCancelled(touches) assert(false, "overwrite: NJLINodeEntityState:touchCancelled") end
function NJLINodeEntityState:render() assert(false, "overwrite: NJLINodeEntityState:render") end
function NJLINodeEntityState:actionUpdate(action, timeStep) assert(false, "overwrite: NJLINodeEntityState:actionUpdate") end
function NJLINodeEntityState:actionComplete(action) assert(false, "overwrite: NJLINodeEntityState:actionComplete") end
function NJLINodeEntityState:collide(otherNode, collisionPoint) assert(false, "overwrite: NJLINodeEntityState:collide") end
function NJLINodeEntityState:near(otherNode) assert(false, "overwrite: NJLINodeEntityState:near") end
function NJLINodeEntityState:rayTouchDown(rayContact) assert(false, "overwrite: NJLINodeEntityState:rayTouchDown") end
function NJLINodeEntityState:rayTouchUp(rayContact) assert(false, "overwrite: NJLINodeEntityState:rayTouchUp") end
function NJLINodeEntityState:rayTouchMove(rayContact) assert(false, "overwrite: NJLINodeEntityState:rayTouchMove") end
function NJLINodeEntityState:rayTouchCancelled(rayContact) assert(false, "overwrite: NJLINodeEntityState:rayTouchCancelled") end
function NJLINodeEntityState:pause() assert(false, "overwrite: NJLINodeEntityState:pause") end
function NJLINodeEntityState:unPause() assert(false, "overwrite: NJLINodeEntityState:unPause") end

return NJLINodeEntityState
