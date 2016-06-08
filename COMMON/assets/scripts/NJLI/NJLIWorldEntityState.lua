local NJLIWorldEntityState = {}
NJLIWorldEntityState.__index = NJLIWorldEntityState

local json = require('JSON')

setmetatable(NJLIWorldEntityState, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function NJLIWorldEntityState:className()
 return "NJLIWorldEntityState"
end

function NJLIWorldEntityState:class()
 return self
end

function NJLIWorldEntityState:superClass()
 return nil
end

function NJLIWorldEntityState:isa(theClass)
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

function NJLIWorldEntityState:destroy()
 NJLIWorldEntityState.__gc(self)
end


local init =
{
 name = "name",
 entityOwner = nil
}

function NJLIWorldEntityState:create(init)
 
 assert(init, "init variable is nil.")
 assert(init.name, "Init variable is expecting a name value")
 assert(init.entityOwner, "Init variable is expecting a entityOwner value")

 self._init = init

 self:load()
end

function NJLIWorldEntityState:__gc()
 self:unLoad()
end

function NJLIWorldEntityState:__tostring()
 
 return json.encode(self)
end

function NJLISceneEntityState:getWorldState()
 return self._worldState
end

function NJLISceneEntityState:getEntityOwner()
 return self._entityOwner
end

function NJLIWorldEntityState:load()
 self:unLoad()

 self._entityOwner = self._init.entityOwner
 self._worldState = njli.WorldState.create()

 self:getWorldState():setName(self._init.name)
end

function NJLIWorldEntityState:unLoad()
 if self:getWorldState() then
 njli.WorldState.destroy(self:getWorldState())
 end
 self._worldState = nil

 self._entityOwner = nil
end

function NJLIWorldEntityState:push()
 self:getEntityOwner():getNode():getStateMachine():pushState(self:getWorldState())
end

function NJLIWorldEntityState:isIn()
 return self:getWorldState():getName() == self:getEntityOwner():getNode():getStateMachine():getState():getName()
end

function NJLIWorldEntityState:enter() assert(false, "overwrite: NJLIWorldEntityState:enter") end
function NJLIWorldEntityState:update(timeStep) assert(false, "overwrite: NJLIWorldEntityState:update") end
function NJLIWorldEntityState:exit() assert(false, "overwrite: NJLIWorldEntityState:exit") end
function NJLIWorldEntityState:onMessage(message) assert(false, "overwrite: NJLIWorldEntityState:onMessage") end
function NJLIWorldEntityState:touchDown(touches) assert(false, "overwrite: NJLIWorldEntityState:touchDown") end
function NJLIWorldEntityState:touchUp(touches) assert(false, "overwrite: NJLIWorldEntityState:touchUp") end
function NJLIWorldEntityState:touchMove(touches) assert(false, "overwrite: NJLIWorldEntityState:touchMove") end
function NJLIWorldEntityState:touchCancelled(touches) assert(false, "overwrite: NJLIWorldEntityState:touchCancelled") end
function NJLIWorldEntityState:renderHUD() assert(false, "overwrite: NJLIWorldEntityState:renderHUD") end
function NJLIWorldEntityState:keyboardShow() assert(false, "overwrite: NJLIWorldEntityState:keyboardShow") end
function NJLIWorldEntityState:keyboardCancel() assert(false, "overwrite: NJLIWorldEntityState:keyboardCancel") end
function NJLIWorldEntityState:keyboardReturn(text) assert(false, "overwrite: NJLIWorldEntityState:keyboardReturn") end
function NJLIWorldEntityState:receivedMemoryWarning() assert(false, "overwrite: NJLIWorldEntityState:receivedMemoryWarning") end
function NJLIWorldEntityState:pause() assert(false, "overwrite: NJLIWorldEntityState:pause") end
function NJLIWorldEntityState:unPause() assert(false, "overwrite: NJLIWorldEntityState:unPause") end

return NJLIWorldEntityState
