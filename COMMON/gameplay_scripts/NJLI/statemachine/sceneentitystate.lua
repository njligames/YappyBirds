local SceneEntityState = {}
SceneEntityState.__index = SceneEntityState

local json = require('JSON')

setmetatable(SceneEntityState, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function SceneEntityState:className()
  return "SceneEntityState"
end

function SceneEntityState:class()
  return self
end

function SceneEntityState:superClass()
  return nil
end

function SceneEntityState:isa(theClass)
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

function SceneEntityState:destroy()
  SceneEntityState.__gc(self)
end

--[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]
function SceneEntityState:create(init)
  --TODO: Create and initialize properties...
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.entityOwner, "Init variable is expecting a entityOwner value")

  self._entityOwner = init.entityOwner
  self._sceneState = njli.SceneState.create()

  self:getSceneState():setName(init.name)
end

function SceneEntityState:__gc()
  self:unLoad()
end

function SceneEntityState:__tostring()
  --TODO: Represent the class as a string...
  -- return "SceneEntityState"
  return json.encode(self)
end

function SceneEntityState:getSceneState()
  return self._sceneState
end

function SceneEntityState:getEntityOwner()
  return self._entityOwner
end

function SceneEntityState:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function SceneEntityState:load()
  print("SceneEntityState:load()")

  self.loaded = true
end

function SceneEntityState:unLoad()
  print("SceneEntityState:unLoad()")
  
  if self:getSceneState() then
    njli.SceneState.destroy(self:getSceneState())
  end
  self._sceneState = nil

  self._entityOwner = nil

  self.loaded = false
end

function SceneEntityState:push()
  self:getEntityOwner():getScene():getStateMachine():pushState(self:getSceneState())
end

function SceneEntityState:isIn()
  return self:getSceneState():getName() == self:getEntityOwner():getScene():getStateMachine():getState():getName()
end

function SceneEntityState:enter()                 assert(false, "overwrite: SceneEntityState:enter") end
function SceneEntityState:update(timeStep)        assert(false, "overwrite: SceneEntityState:update") end
function SceneEntityState:exit()                  assert(false, "overwrite: SceneEntityState:exit") end
function SceneEntityState:onMessage(message)      assert(false, "overwrite: SceneEntityState:onMessage") end
function SceneEntityState:touchDown(touches)      assert(false, "overwrite: SceneEntityState:touchDown") end
function SceneEntityState:touchUp(touches)        assert(false, "overwrite: SceneEntityState:touchUp") end
function SceneEntityState:touchMove(touches)      assert(false, "overwrite: SceneEntityState:touchMove") end
function SceneEntityState:touchCancelled(touches) assert(false, "overwrite: SceneEntityState:touchCancelled") end
function SceneEntityState:renderHUD()             assert(false, "overwrite: SceneEntityState:renderHUD") end
function SceneEntityState:pause()                 assert(false, "overwrite: SceneEntityState:pause") end
function SceneEntityState:unPause()               assert(false, "overwrite: SceneEntityState:unPause") end

return SceneEntityState
