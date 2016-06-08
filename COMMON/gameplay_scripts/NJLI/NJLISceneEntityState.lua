local NJLISceneEntityState = {}
NJLISceneEntityState.__index = NJLISceneEntityState

local json = require('JSON')

setmetatable(NJLISceneEntityState, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function NJLISceneEntityState:className()
  return "NJLISceneEntityState"
end

function NJLISceneEntityState:class()
  return self
end

function NJLISceneEntityState:superClass()
  return nil
end

function NJLISceneEntityState:isa(theClass)
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

function NJLISceneEntityState:destroy()
  NJLISceneEntityState.__gc(self)
end

--[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]
function NJLISceneEntityState:create(init)
  --TODO: Create and initialize properties...
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.entityOwner, "Init variable is expecting a entityOwner value")

  self._init = init

  self:load()
end

function NJLISceneEntityState:__gc()
  self:unLoad()
end

function NJLISceneEntityState:__tostring()
  --TODO: Represent the class as a string...
  -- return "NJLISceneEntityState"
  return json.encode(self)
end

function NJLISceneEntityState:getSceneState()
  return self._sceneState
end

function NJLISceneEntityState:getEntityOwner()
  return self._entityOwner
end

function NJLISceneEntityState:load()
  self:unLoad()

  self._entityOwner = self._init.entityOwner
  self._sceneState = njli.SceneState.create()

  self:getSceneState():setName(self._init.name)
end

function NJLISceneEntityState:unLoad()
  if self:getSceneState() then
    njli.SceneState.destroy(self:getSceneState())
  end
  self._sceneState = nil

  self._entityOwner = nil
end

function NJLISceneEntityState:push()
  self:getEntityOwner():getNode():getStateMachine():pushState(self:getSceneState())
end

function NJLISceneEntityState:isIn()
  return self:getSceneState():getName() == self:getEntityOwner():getNode():getStateMachine():getState():getName()
end

function NJLISceneEntityState:enter()                 assert(false, "overwrite: NJLISceneEntityState:enter") end
function NJLISceneEntityState:update(timeStep)        assert(false, "overwrite: NJLISceneEntityState:update") end
function NJLISceneEntityState:exit()                  assert(false, "overwrite: NJLISceneEntityState:exit") end
function NJLISceneEntityState:onMessage(message)      assert(false, "overwrite: NJLISceneEntityState:onMessage") end
function NJLISceneEntityState:touchDown(touches)      assert(false, "overwrite: NJLISceneEntityState:touchDown") end
function NJLISceneEntityState:touchUp(touches)        assert(false, "overwrite: NJLISceneEntityState:touchUp") end
function NJLISceneEntityState:touchMove(touches)      assert(false, "overwrite: NJLISceneEntityState:touchMove") end
function NJLISceneEntityState:touchCancelled(touches) assert(false, "overwrite: NJLISceneEntityState:touchCancelled") end
function NJLISceneEntityState:renderHUD()             assert(false, "overwrite: NJLISceneEntityState:renderHUD") end
function NJLISceneEntityState:pause()                 assert(false, "overwrite: NJLISceneEntityState:pause") end
function NJLISceneEntityState:unPause()               assert(false, "overwrite: NJLISceneEntityState:unPause") end

return NJLISceneEntityState
