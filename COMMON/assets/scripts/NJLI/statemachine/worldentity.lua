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

function WorldEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function WorldEntity:getStartSceneName()
  return self._startStateName
end

function WorldEntity:getWorld()
  return self._world
end

function WorldEntity:getGameInstance()
  return self._gameInstance
end

function WorldEntity:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function WorldEntity:load()
  print("WorldEntity:load()")
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
  
  print("WorldEntity:unLoad()")
end

function WorldEntity:startStateMachine()
  print("WorldEntity:startStateMachine()")
  if self:_getEntityState(self:getStartSceneName()) then
    self:_getEntityState(self:getStartSceneName()):push()
  else
    print("self:getStartSceneName() is not found.")
  end
end

function WorldEntity:enter()
  print("WorldEntity:enter()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():enter()
end

function WorldEntity:update(timeStep)
--  print("WorldEntity:update("..timeStep..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  if self:hasState() then
    if not self:getCurrentEntityState():getSceneEntity():hasState() then
      self:getCurrentEntityState():getSceneEntity():startStateMachine()
    end
  end
  self:getCurrentEntityState():update(timeStep)
end

function WorldEntity:exit()
  print("WorldEntity:exit()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():exit()
end

function WorldEntity:onMessage(message)
  print("WorldEntity:onMessage("..tostring(message)..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():onMessage(message)
end

function WorldEntity:touchDown(touches)
--  print("WorldEntity:touchDown("..tostring(touches)..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():touchDown(touches)
end

function WorldEntity:touchUp(touches)
--  print("WorldEntity:touchUp("..tostring(touches)..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():touchUp(touches)
end

function WorldEntity:touchMove(touches)
--  print("WorldEntity:touchMove("..tostring(touches)..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():touchMove(touches)
end

function WorldEntity:touchCancelled(touches)
  print("WorldEntity:touchCancelled("..tostring(touches)..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():touchCancelled(touches)
end

function WorldEntity:renderHUD()
--  print("WorldEntity:renderHUD()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():renderHUD()
end

function WorldEntity:keyboardShow()
  print("WorldEntity:keyboardShow()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():keyboardShow()
end

function WorldEntity:keyboardCancel()
  print("WorldEntity:keyboardCancel()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():keyboardCancel()
end

function WorldEntity:keyboardReturn(text)
  print("WorldEntity:keyboardReturn("..tostring(text)..")")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():keyboardReturn(text)
end

function WorldEntity:receivedMemoryWarning()
  print("WorldEntity:receivedMemoryWarning()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():receivedMemoryWarning()
end

function WorldEntity:pause()
  print("WorldEntity:pause()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():pause()
end

function WorldEntity:unPause()
  print("WorldEntity:unPause()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:getCurrentEntityState():unPause()
end

return WorldEntity
