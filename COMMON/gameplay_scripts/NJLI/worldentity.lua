local WorldEntity = {}
WorldEntity.__index = WorldEntity

local json = require('JSON')

setmetatable(WorldEntity, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function WorldEntity:className()
  return "WorldEntity"
end

function WorldEntity:class()
  return self
end

function WorldEntity:superClass()
  return nil
end

function WorldEntity:isa(theClass)
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

function WorldEntity:destroy()
  WorldEntity.__gc(self)
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

function WorldEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")

  self._init = init

  self:load()
end

function WorldEntity:__gc()
  self:unLoad()
end

function WorldEntity:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

function WorldEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function WorldEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function WorldEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function WorldEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function WorldEntity:getCurrentEntityState()
  assert(self:getWorld():getStateMachine(), "message")
  assert(self:getWorld():getStateMachine():getState(), "message")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getWorld():getStateMachine():getState():getName())
end

function WorldEntity:getWorld()
  return self._world
end

function WorldEntity:load()
  self:unLoad()
    
  self._stateEntityTable = {}
  if self._init then
    for k,v in pairs(self._init.states) do
      local m = require string(v.module)

      self:_addEntityState(v.name, m)
    end
  end

  self._world = njli.World.getInstance()
  self:getWorld():setName(self._init.name)
end

function WorldEntity:unLoad()
  self._world = nil

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end
end

function WorldEntity:initialize()            
end

function WorldEntity:enter()
  self:getCurrentEntityState():enter()
end

function WorldEntity:update(timeStep)
  self:getCurrentEntityState():update(timeStep)
end

function WorldEntity:exit()
  self:getCurrentEntityState():exit()
end

function WorldEntity:onMessage(message)
  self:getCurrentEntityState():onMessage(message)
end

function WorldEntity:touchDown(touches)
  self:getCurrentEntityState():touchDown(touches)
end

function WorldEntity:touchUp(touches)
  self:getCurrentEntityState():touchUp(touches)
end

function WorldEntity:touchMove(touches)
  self:getCurrentEntityState():touchMove(touches)
end

function WorldEntity:touchCancelled(touches)
  self:getCurrentEntityState():touchCancelled(touches)
end

function WorldEntity:renderHUD()
  self:getCurrentEntityState():renderHUD()
end

function WorldEntity:keyboardShow()
  self:getCurrentEntityState():keyboardShow()
end

function WorldEntity:keyboardCancel()
  self:getCurrentEntityState():keyboardCancel()
end

function WorldEntity:keyboardReturn(text)
  self:getCurrentEntityState():keyboardReturn(text)
end

function WorldEntity:receivedMemoryWarning()
  self:getCurrentEntityState():receivedMemoryWarning()
end

function WorldEntity:pause()
  self:getCurrentEntityState():pause()
end

function WorldEntity:unPause()
  self:getCurrentEntityState():unPause()
end

return WorldEntity
