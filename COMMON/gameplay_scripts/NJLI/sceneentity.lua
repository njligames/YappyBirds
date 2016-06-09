local SceneEntity = {}
SceneEntity.__index = SceneEntity

local json = require('JSON')

setmetatable(SceneEntity, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function SceneEntity:className()
  return "SceneEntity"
end

function SceneEntity:class()
  return self
end

function SceneEntity:superClass()
  return nil
end

function SceneEntity:isa(theClass)
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

function SceneEntity:destroy()
  SceneEntity.__gc(self)
end

--[[
    local init = 
    {
      name = "name",
      states =
      {
        {
            name = "Spawn", 
            module = "nodes.bird.states.spawn"
        },
        {
            name = "Fly", 
            module = "nodes.bird.states.fly"
        },
        {
            name = "Pursue", 
            module = "nodes.bird.states.pursue"
        },
        {
            name = "Hit", 
            module = "nodes.bird.states.hit"
        },
        {
            name = "Grabbing", 
            module = "nodes.bird.states.grabbing"
        },
        {
            name = "Grabbed", 
            module = "nodes.bird.states.grabbed"
        },
      },--end states
    }
  --]]
function SceneEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")

  self._init = init

  self:load()
end

function SceneEntity:__gc()
  self:unLoad()
end

function SceneEntity:__tostring()
  --TODO: Represent the class as a string...
  -- return "SceneEntity"
  return json.encode(self)
end

function SceneEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function SceneEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function SceneEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function SceneEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function SceneEntity:getCurrentEntityState()
  assert(self:getScene():getStateMachine(), "message")
  assert(self:getScene():getStateMachine():getState(), "message")
  assert(self:getScene():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getScene():getStateMachine():getState():getName())
end

function NJLINodeEntity:getScene()
  return self._scene
end

function SceneEntity:load()
  self:unLoad()
    
  self._stateEntityTable = {}
  for k,v in pairs(self._init.states) do
    local m = require v.module

    self:_addEntityState(v.name, m)
  end

  self._scene = njli.Scene.create()
  self:getScene():setName(self._init.name)
end

function SceneEntity:unLoad()
  if self:getScene() then
    njli.Scene.destroy(self:getScene())
    self._scene = nil
  end

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end
end

function SceneEntity:initialize()            
end

function SceneEntity:enter()
  self:getCurrentEntityState():enter()
end

function SceneEntity:update(timeStep)
  self:getCurrentEntityState():update(timeStep)
end

function SceneEntity:exit()
  self:getCurrentEntityState():exit()
end

function SceneEntity:onMessage(message)
  self:getCurrentEntityState():onMessage(touches)
end

function SceneEntity:touchDown(touches)
  self:getCurrentEntityState():touchDown(touches)
end

function SceneEntity:touchUp(touches)
  self:getCurrentEntityState():touchUp(touches)
end

function SceneEntity:touchMove(touches)
  self:getCurrentEntityState():touchMove(touches)
end

function SceneEntity:touchCancelled(touches)
  self:getCurrentEntityState():touchCancelled(touches)
end

function SceneEntity:renderHUD()
  self:getCurrentEntityState():renderHUD()
end

function SceneEntity:pause()
  self:getCurrentEntityState():pause()
end

function SceneEntity:unPause()
  self:getCurrentEntityState():unPause()
end

return SceneEntity
