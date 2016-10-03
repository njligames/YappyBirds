local WorldEntityState = {}
WorldEntityState.__index = WorldEntityState

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
--  __ctor()
--  __dtor()
--  __load()
--  __unLoad()
--#############################################################################

local __ctor = function(self, init)
  assert(init, "init variable is nil.")
  assert(init.entityOwner, "Init variable is expecting a entityOwner value")
  assert(init.class, "Init variable is expecting a entityOwner value")
  assert(init.states, "Init variable is expecting a entityOwner value")
  assert(type(init.states) == "table", "not a table")
  assert(init.nodes, "Init variable is expecting a entityOwner value")
  assert(type(init.nodes) == "table", "not a table")

  self._entityOwner = init.entityOwner

  self._worldState = njli.WorldState.create()
  self:getWorldState():setName(self:className())

  --Create the Entity
  -- self._sceneEntity = init.class({
  --   states = init.states,
  --   nodes = init.nodes,
  --   entityOwner = self,
  -- })

  -- Interface:getStateMachine():getEntityManager():addSceneEntity(self:getSceneEntity())
end

local __dtor = function(self)
  self._sceneEntity = nil

  njli.WorldState.destroy(self:getWorldState())
  self._worldState = nil

  self._entityOwner = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--############################################################################# 

function WorldEntityState:getWorldState()
  return self._worldState
end

function WorldEntityState:getWorldEntity()
  return self._entityOwner
end

function WorldEntityState:getSceneEntity()
  return self._sceneEntity
end

--############################################################################# 
--Statemachine code...
--#############################################################################

function WorldEntityState:pushState(stateName)
  self:getWorldEntity():pushState(stateName)
end

function WorldEntityState:push()
  self:getWorldEntity():getWorld():getStateMachine():pushState(self:getWorldState())
end

function WorldEntityState:isIn()
  return self:getWorldState():getName() == self:getWorldEntity():getWorld():getStateMachine():getState():getName()
end

function WorldEntityState:enter()
    print("WorldEntityState:enter()")
end

function WorldEntityState:update(timeStep)
    print("WorldEntityState:update(timeStep)")
end

function WorldEntityState:exit()
    print("WorldEntityState:exit()")
end

function WorldEntityState:onMessage(message)
    print("WorldEntityState:onMessage(message)")
end

function WorldEntityState:renderHUD()
    print("WorldEntityState:renderHUD()")
end

function WorldEntityState:touchDown(touches)
    print("WorldEntityState:touchDown(touches)")
end

function WorldEntityState:touchUp(touches)
    print("WorldEntityState:touchUp(touches)")
end

function WorldEntityState:touchMove(touches)
    print("WorldEntityState:touchMove(touches)")
end

function WorldEntityState:touchCancelled(touches)
    print("WorldEntityState:touchCancelled(touches)")
end

function WorldEntityState:pause()
    print("WorldEntityState:pause()")
end

function WorldEntityState:unPause()
    print("WorldEntityState:unPause()")
end

function WorldEntityState:keyboardShow()
    print("WorldEntityState:keyboardShow()")
end

function WorldEntityState:keyboardCancel()
    print("WorldEntityState:keyboardCancel()")
end

function WorldEntityState:keyboardReturn(text)
    print("WorldEntityState:keyboardReturn(text)")
end

function WorldEntityState:willResignActive()
    print("WorldEntityState:willResignActive()")
end

function WorldEntityState:didBecomeActive()
    print("WorldEntityState:didBecomeActive()")
end

function WorldEntityState:didEnterBackground()
    print("WorldEntityState:didEnterBackground()")
end

function WorldEntityState:willEnterForeground()
    print("WorldEntityState:willEnterForeground()")
end

function WorldEntityState:willTerminate()
    print("WorldEntityState:willTerminate()")
end

function WorldEntityState:interrupt()
    print("WorldEntityState:interrupt()")
end

function WorldEntityState:resumeInterrupt()
    print("WorldEntityState:resumeInterrupt()")
end

function WorldEntityState:receivedMemoryWarning()
    print("WorldEntityState:receivedMemoryWarning()")
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(WorldEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function WorldEntityState:className()
  return "WorldEntityState"
end

function WorldEntityState:class()
  return self
end

function WorldEntityState:superClass()
  return nil
end

function WorldEntityState:isa(theClass)
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

function WorldEntityState:__gc()
  WorldEntityState._destroy(self)
end

function WorldEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function WorldEntityState:_destroy()
  assert(not self.__WorldEntityStateCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function WorldEntityState:_create(init)
  self.__WorldEntityStateCalledLoad = false
  
  __ctor(self, init)
end

function WorldEntityState:load()
  __load(self)
  
  self.__WorldEntityStateCalledLoad = true
end

function WorldEntityState:unLoad()
  assert(self.__WorldEntityStateCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__WorldEntityStateCalledLoad = false
end

return WorldEntityState
