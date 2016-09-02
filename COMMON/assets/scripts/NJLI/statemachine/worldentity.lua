local WorldEntity = {}
WorldEntity.__index = WorldEntity

local json = require('json')

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

--local init =
--{
-- name = "name",
-- states =
-- {
-- {
-- name = "Spawn",
-- module = "nodes.bird.states.spawn"
-- },
-- {
-- name = "Fly",
-- module = "nodes.bird.states.fly"
-- },
-- {
-- name = "Pursue",
-- module = "nodes.bird.states.pursue"
-- },
-- {
-- name = "Hit",
-- module = "nodes.bird.states.hit"
-- },
-- {
-- name = "Grabbing",
-- module = "nodes.bird.states.grabbing"
-- },
-- {
-- name = "Grabbed",
-- module = "nodes.bird.states.grabbed"
-- },
-- },
-- startStateName = "",
-- gameInstance = nil,
--}

function WorldEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")
  assert(init.startStateName, "Init variable is expecting a startStateName value")
  assert(init.gameInstance, "Init variable is expecting a gameInstance value")

  self._gameInstance = init.gameInstance
  self._startStateName = init.startStateName

  self._world = njli.World.getInstance()

  self:getWorld():setName(init.name)

  self._stateEntityTable = {}
  if init then
    for k,v in pairs(init.states) do
      self:_addEntityState(v.name, v.module)
    end
  end

end

function WorldEntity:__gc()
  self:unLoad()
end

function WorldEntity:__tostring()

  return json:stringify(self)
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
  assert(self._stateEntityTable[stateName], "There must be a state with name: \"" .. stateName .. "\"")

  return self._stateEntityTable[stateName]
end

function WorldEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function WorldEntity:hasState()
  return self:getWorld():getStateMachine():getState() ~= nil
end

function WorldEntity:getCurrentEntityState()
  assert(self:getWorld():getStateMachine(), "message")
  assert(self:getWorld():getStateMachine():getState(), "There is no current World State")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getWorld():getStateMachine():getState():getName())
end

function WorldEntity:getGameInstance()
  return self._gameInstance
end

function WorldEntity:getStartSceneName()
  return self._startStateName
end

function WorldEntity:getWorld()
  return self._world
end

function WorldEntity:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function WorldEntity:load()
  -- print("WorldEntity:load()")
  for k,v in pairs(self._stateEntityTable) do
    v:load()
  end
  self.loaded = true
end

function WorldEntity:unLoad()
  self._world = nil

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_getEntityState(v.name):unLoad()
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

  self.loaded = false
end

function WorldEntity:startStateMachine()
  if self:_getEntityState(self:getStartSceneName()) then
    self:_getEntityState(self:getStartSceneName()):push()
  else
    print("self:getStartSceneName() is not found.")
  end
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
  if self:hasState() then
    self:getCurrentEntityState():touchDown(touches)
  end
end

function WorldEntity:touchUp(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchUp(touches)
  end
end

function WorldEntity:touchMove(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchMove(touches)
  end
end

function WorldEntity:touchCancelled(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchCancelled(touches)
  end
end

function WorldEntity:renderHUD()
  if self:hasState() then
    self:getCurrentEntityState():renderHUD()
  end
end

function WorldEntity:keyboardShow()
  if self:hasState() then
    self:getCurrentEntityState():keyboardShow()
  end
end

function WorldEntity:keyboardCancel()
  if self:hasState() then
    self:getCurrentEntityState():keyboardCancel()
  end
end

function WorldEntity:keyboardReturn(text)
  if self:hasState() then
    self:getCurrentEntityState():keyboardReturn(text)
  end
end

function WorldEntity:receivedMemoryWarning()
  if self:hasState() then
    self:getCurrentEntityState():receivedMemoryWarning()
  end
end

function WorldEntity:pause()
  if self:hasState() then
    self:getCurrentEntityState():pause()
  end
end

function WorldEntity:unPause()
  if self:hasState() then
    self:getCurrentEntityState():unPause()
  end
end

return WorldEntity
