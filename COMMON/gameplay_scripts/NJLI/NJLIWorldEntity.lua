local NJLIWorldEntity = {}
NJLIWorldEntity.__index = NJLIWorldEntity

local json = require('JSON')

setmetatable(NJLIWorldEntity, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function NJLIWorldEntity:className()
  return "NJLIWorldEntity"
end

function NJLIWorldEntity:class()
  return self
end

function NJLIWorldEntity:superClass()
  return nil
end

function NJLIWorldEntity:isa(theClass)
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

function NJLIWorldEntity:destroy()
  NJLIWorldEntity.__gc(self)
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

function NJLIWorldEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")

  self._init = init

  self:load()
end

function NJLIWorldEntity:__gc()
  self:unLoad()
end

function NJLIWorldEntity:__tostring()
  --TODO: Represent the class as a string...
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
  assert(self:getWorld():getStateMachine(), "message")
  assert(self:getWorld():getStateMachine():getState(), "message")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getWorld():getStateMachine():getState():getName())
end

function NJLINodeEntity:getWorld()
  return self._world
end

function NJLIWorldEntity:load()
  self:unLoad()
    
  self._stateEntityTable = {}
  for k,v in pairs(self._init.states) do
    local m = require v.module

    self:_addEntityState(v.name, m)
  end

  self._world = njli.World.getInstance()
  self:getWorld():setName(self._init.name)
end

function NJLIWorldEntity:unLoad()
  self._world = nil

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end
end

function NJLIWorldEntity:initialize()            
end

function NJLIWorldEntity:enter()
  self:getCurrentEntityState():enter()
end

function NJLIWorldEntity:update(timeStep)
  self:getCurrentEntityState():update(timeStep)
end

function NJLIWorldEntity:exit()
  self:getCurrentEntityState():exit()
end

function NJLIWorldEntity:onMessage(message)
  self:getCurrentEntityState():onMessage(message)
end

function NJLIWorldEntity:touchDown(touches)
  self:getCurrentEntityState():touchDown(touches)
end

function NJLIWorldEntity:touchUp(touches)
  self:getCurrentEntityState():touchUp(touches)
end

function NJLIWorldEntity:touchMove(touches)
  self:getCurrentEntityState():touchMove(touches)
end

function NJLIWorldEntity:touchCancelled(touches)
  self:getCurrentEntityState():touchCancelled(touches)
end

function NJLIWorldEntity:renderHUD()
  self:getCurrentEntityState():renderHUD()
end

function NJLIWorldEntity:keyboardShow()
  self:getCurrentEntityState():keyboardShow()
end

function NJLIWorldEntity:keyboardCancel()
  self:getCurrentEntityState():keyboardCancel()
end

function NJLIWorldEntity:keyboardReturn(text)
  self:getCurrentEntityState():keyboardReturn(text)
end

function NJLIWorldEntity:receivedMemoryWarning()
  self:getCurrentEntityState():receivedMemoryWarning()
end

function NJLIWorldEntity:pause()
  self:getCurrentEntityState():pause()
end

function NJLIWorldEntity:unPause()
  self:getCurrentEntityState():unPause()
end

return NJLIWorldEntity
