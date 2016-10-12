local WorldEntity = {}
WorldEntity.__index = WorldEntity

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
-- __ctor()
-- __dtor()
-- __load()
-- __unLoad()
--#############################################################################

local __ctor = function(self, init)
  assert(nil ~= init, "init variable is nil.")
  assert(type(init) == "table", "not a table")
  assert(nil ~= init.states, "init.states variable is nil.")
  assert(type(init.states) == "table", "not a table")
  assert(nil ~= init.entityOwner, "entityOwner variable is nil.")

  self._entityOwner = init.entityOwner

  self._world = njli.World.getInstance()
  self:getWorld():setName(self:hash())

  local startState = nil

  self._stateEntityTable = {}
  for k,v in pairs(init.states) do
    assert(v.class ~= nil, "")
    assert(v.scene ~= nil, "is nil")
    assert(type(v.scene) == "table", "not a table")

    --Create a WorldEntityState...
    local stateEntity = v.class({
        entityOwner = self,
        scene = v.scene
      })

    if startState == nil then
      startState = stateEntity
    end

    self:_addEntityState(stateEntity)
  end

  assert(startState, "No start state was defined for " .. self:hash())

  self._startStateName = startState:hash()
end

local __dtor = function(self)
  self._stateEntityTable = nil

  self._world = nil
end

local __load = function(self)
  for k,v in pairs(self._stateEntityTable) do
    v:load()
  end
end

local __unLoad = function(self)
  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_getEntityState(v.name):unLoad()
    end
    self._stateEntityTable = nil
  end
end

--#############################################################################
--Private
--#############################################################################

function WorldEntity:_addEntityState(entityState)
  local stateName = entityState:hash()
  self._stateEntityTable[stateName] = entityState
end

function WorldEntity:_removeEntityState(stateName)
  self._stateEntityTable[stateName] = nil
end

function WorldEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: \"" .. stateName .. "\"")

  return self._stateEntityTable[stateName]
end

function WorldEntity:_getCurrentEntityState()
  assert(self:getWorld():getStateMachine(), "There is no state machine")
  assert(self:getWorld():getStateMachine():getState(), "There is no current World State")
  assert(self:getWorld():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getWorld():getStateMachine():getState():getName())
end

--#############################################################################
--General
--#############################################################################

function WorldEntity:getWorld()
  return self._world
end

function WorldEntity:hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function WorldEntity:hasState()
  return self:getWorld():getStateMachine():getState() ~= nil
end

function WorldEntity:getGameEntity()
  return self._entityOwner
end

--#############################################################################
--Statemachine code...
--#############################################################################

function WorldEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function WorldEntity:getStartStateEntity()
  return self:_getEntityState(self._startStateName)
end

function WorldEntity:startStateMachine()
  print(self:hash() .. " :startStateMachine()")

  self:pushState(self._startStateName)
end

function WorldEntity:enter()
  print(self:hash() .. " :enter()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function WorldEntity:update(timeStep)
  --print(self:hash() .. " :update()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function WorldEntity:exit()
  print(self:hash() .. " :exit()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function WorldEntity:onMessage()
  print(self:hash() .. " :onMessage()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():onMessage()
end

function WorldEntity:renderHUD()
  --print(self:hash() .. " :renderHUD()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function WorldEntity:touchDown(touches)
  print(self:hash() .. " :touchDown()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchDown()
end

function WorldEntity:touchUp(touches)
  print(self:hash() .. " :touchUp()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchUp()
end

function WorldEntity:touchMove(touches)
  print(self:hash() .. " :touchMove()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchMove()
end

function WorldEntity:touchCancelled(touches)
  print(self:hash() .. " :touchCancelled()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled()
end

function WorldEntity:pause()
  print(self:hash() .. " :pause()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():pause()
end

function WorldEntity:unPause()
  print(self:hash() .. " :unPause()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():unPause()
end

function WorldEntity:keyboardShow()
  print(self:hash() .. " :keyboardShow()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardShow()
end

function WorldEntity:keyboardCancel()
  print(self:hash() .. " :keyboardCancel()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardCancel()
end

function WorldEntity:keyboardReturn(text)
  print(self:hash() .. " :keyboardReturn()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():keyboardReturn(text)
end

function WorldEntity:willResignActive()
  print(self:hash() .. " :willResignActive()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willResignActive()
end

function WorldEntity:didBecomeActive()
  print(self:hash() .. " :didBecomeActive()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():didBecomeActive()
end

function WorldEntity:didEnterBackground()
  print(self:hash() .. " :didEnterBackground()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():didEnterBackground()
end

function WorldEntity:willEnterForeground()
  print(self:hash() .. " :willEnterForeground()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willEnterForeground()
end

function WorldEntity:willTerminate()
  print(self:hash() .. " :willTerminate()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():willTerminate()
end

function WorldEntity:interrupt()
  print(self:hash() .. " :interrupt()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():interrupt()
end

function WorldEntity:resumeInterrupt()
  print(self:hash() .. " :resumeInterrupt()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():resumeInterrupt()
end

function WorldEntity:receivedMemoryWarning()
  print(self:hash() .. " :receivedMemoryWarning()")
  assert(self:hasState(), "WorldEntity must be in a state")
  self:_getCurrentEntityState():receivedMemoryWarning()
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(WorldEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function WorldEntity:hash()
    return "NJLI.STATEMACHINE.WorldEntity"
end

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

function WorldEntity:__gc()
  WorldEntity._destroy(self)
end

function WorldEntity:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function WorldEntity:_destroy()
  assert(not self.__WorldEntityCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function WorldEntity:_create(init)
  self.__WorldEntityCalledLoad = false

  __ctor(self, init)
end

function WorldEntity:load()
  __load(self)

  self.__WorldEntityCalledLoad = true
end

function WorldEntity:unLoad()
  assert(self.__WorldEntityCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__WorldEntityCalledLoad = false
end

return WorldEntity
