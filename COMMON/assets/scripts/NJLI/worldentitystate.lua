local WorldEntityState = {}
WorldEntityState.__index = WorldEntityState

local json = require('JSON')

setmetatable(WorldEntityState, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function WorldEntityState:className()
 return "WorldEntityState"
end

function WorldEntityState:class()
 return self
end

function WorldEntityState:superClass()
 return nil
end

function WorldEntityState:isa(theClass)
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

function WorldEntityState:destroy()
 WorldEntityState.__gc(self)
end


local init =
{
 name = "name",
 entityOwner = nil
}

function WorldEntityState:create(init)
 
 assert(init, "init variable is nil.")
 assert(init.name, "Init variable is expecting a name value")
 assert(init.entityOwner, "Init variable is expecting a entityOwner value")

 self._init = init

 self._worldState = nil
 self._entityOwner = nil

 self:load()
end

function WorldEntityState:__gc()
 self:unLoad()
end

function WorldEntityState:__tostring()
 
 return json.encode(self)
end

function WorldEntityState:getWorldState()
 return self._worldState
end

function WorldEntityState:getEntityOwner()
 return self._entityOwner
end

function WorldEntityState:load()
 
 assert(not self._worldState, "message")
 assert(not self._entityOwner, "message")

 self._entityOwner = self._init.entityOwner
 self._worldState = njli.WorldState.create()

 self:getWorldState():setName(self._init.name)
end

function WorldEntityState:unLoad()
 if self:getWorldState() then
 njli.WorldState.destroy(self:getWorldState())
 end
 self._worldState = nil

 self._entityOwner = nil
end

function WorldEntityState:push()
 self:getEntityOwner():getWorld():getStateMachine():pushState(self:getWorldState())
end

function WorldEntityState:isIn()
 return self:getWorldState():getName() == self:getEntityOwner():getWorld():getStateMachine():getState():getName()
end

function WorldEntityState:enter() assert(false, "overwrite: WorldEntityState:enter") end
function WorldEntityState:update(timeStep) assert(false, "overwrite: WorldEntityState:update") end
function WorldEntityState:exit() assert(false, "overwrite: WorldEntityState:exit") end
function WorldEntityState:onMessage(message) assert(false, "overwrite: WorldEntityState:onMessage") end
function WorldEntityState:touchDown(touches) assert(false, "overwrite: WorldEntityState:touchDown") end
function WorldEntityState:touchUp(touches) assert(false, "overwrite: WorldEntityState:touchUp") end
function WorldEntityState:touchMove(touches) assert(false, "overwrite: WorldEntityState:touchMove") end
function WorldEntityState:touchCancelled(touches) assert(false, "overwrite: WorldEntityState:touchCancelled") end
function WorldEntityState:renderHUD() assert(false, "overwrite: WorldEntityState:renderHUD") end
function WorldEntityState:keyboardShow() assert(false, "overwrite: WorldEntityState:keyboardShow") end
function WorldEntityState:keyboardCancel() assert(false, "overwrite: WorldEntityState:keyboardCancel") end
function WorldEntityState:keyboardReturn(text) assert(false, "overwrite: WorldEntityState:keyboardReturn") end
function WorldEntityState:receivedMemoryWarning() assert(false, "overwrite: WorldEntityState:receivedMemoryWarning") end
function WorldEntityState:pause() assert(false, "overwrite: WorldEntityState:pause") end
function WorldEntityState:unPause() assert(false, "overwrite: WorldEntityState:unPause") end

return WorldEntityState
