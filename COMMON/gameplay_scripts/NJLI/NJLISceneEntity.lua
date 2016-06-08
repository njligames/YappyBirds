local NJLISceneEntity = {}
NJLISceneEntity.__index = NJLISceneEntity

local json = require('JSON')

setmetatable(NJLISceneEntity, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function NJLISceneEntity:className()
  return "NJLISceneEntity"
end

function NJLISceneEntity:class()
  return self
end

function NJLISceneEntity:superClass()
  return nil
end

function NJLISceneEntity:isa(theClass)
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

function NJLISceneEntity:destroy()
  NJLISceneEntity.__gc(self)
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
function NJLISceneEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")

  self._init = init

  self:load()
end

function NJLISceneEntity:__gc()
  self:unLoad()
end

function NJLISceneEntity:__tostring()
  --TODO: Represent the class as a string...
  -- return "NJLISceneEntity"
  return json.encode(self)
end

function NJLISceneEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function NJLISceneEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function NJLISceneEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function NJLISceneEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function NJLISceneEntity:getCurrentEntityState()
  assert(self:getScene():getStateMachine(), "message")
  assert(self:getScene():getStateMachine():getState(), "message")
  assert(self:getScene():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getScene():getStateMachine():getState():getName())
end

function NJLINodeEntity:getScene()
  return self._scene
end

function NJLISceneEntity:load()
  self:unLoad()
    
  self._stateEntityTable = {}
  for k,v in pairs(self._init.states) do
    local m = require v.module

    self:_addEntityState(v.name, m)
  end

  self._scene = njli.Scene.create()
  self:getScene():setName(self._init.name)
end

function NJLISceneEntity:unLoad()
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

function NJLISceneEntity:initialize()            
end

function NJLISceneEntity:enter()
  self:getCurrentEntityState():enter()
end

function NJLISceneEntity:update(timeStep)
  self:getCurrentEntityState():update(timeStep)
end

function NJLISceneEntity:exit()
  self:getCurrentEntityState():exit()
end

function NJLISceneEntity:onMessage(message)
  self:getCurrentEntityState():onMessage(touches)
end

function NJLISceneEntity:touchDown(touches)
  self:getCurrentEntityState():touchDown(touches)
end

function NJLISceneEntity:touchUp(touches)
  self:getCurrentEntityState():touchUp(touches)
end

function NJLISceneEntity:touchMove(touches)
  self:getCurrentEntityState():touchMove(touches)
end

function NJLISceneEntity:touchCancelled(touches)
  self:getCurrentEntityState():touchCancelled(touches)
end

function NJLISceneEntity:renderHUD()
  self:getCurrentEntityState():renderHUD()
end

function NJLISceneEntity:pause()
  self:getCurrentEntityState():pause()
end

function NJLISceneEntity:unPause()
  self:getCurrentEntityState():unPause()
end

return NJLISceneEntity
