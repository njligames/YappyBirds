local SceneEntityState = {}
SceneEntityState.__index = SceneEntityState

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
    assert(init, "init variable is nil.")
    assert(init.entityOwner, "Init variable is expecting a entityOwner value")
    assert(init.nodes, "init.nodes variable is nil.")
    assert(type(init.nodes) == "table", "init.nodes variable is expecting a table")

    self._entityOwner = init.entityOwner

    self._sceneState = njli.SceneState.create()
    self:getSceneState():setName(self:hash())

    --Create the NodeEntities for this SceneEntityState
    --self:getSceneEntity():addNodeEntities(init.nodes, self)

    self._nodes = init.nodes
end

local __dtor = function(self)

    --self:getSceneState():removeNodeEntities()

    njli.SceneState.destroy(self:getSceneState())
    self._sceneState = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end


--#############################################################################
--General
--#############################################################################

function SceneEntityState:getSceneState()
  return self._sceneState
end

function SceneEntityState:getSceneEntity()
  return self._entityOwner
end

--#############################################################################
--Statemachine code...
--#############################################################################

function SceneEntityState:pushState(stateName)
  self:getSceneEntity():pushState(stateName)
end

function SceneEntityState:push()
    njli.World.getInstance():addScene(self:getSceneEntity():getScene())
  self:getSceneEntity():getScene():getStateMachine():pushState(self:getSceneState())
  self:getSceneEntity():startNodeEntities()
end

function SceneEntityState:isIn()
  return self:getSceneState():getName() == self:getSceneEntity():getScene():getStateMachine():getState():getName()
end

function SceneEntityState:enter()
  print(self:hash() .. " :enter()")
end

function SceneEntityState:update(timeStep)
  --print(self:hash() .. " :update(timeStep)")
end

function SceneEntityState:exit()
  print(self:hash() .. " :exit()")
end

function SceneEntityState:onMessage(message)
  print(self:hash() .. " :onMessage(message)")
end

function SceneEntityState:renderHUD()
  --print(self:hash() .. " :renderHUD()")
end

function SceneEntityState:touchDown(touches)
  print(self:hash() .. " :touchDown(touches)")
end

function SceneEntityState:touchUp(touches)
  print(self:hash() .. " :touchUp(touches)")
end

function SceneEntityState:touchMove(touches)
  print(self:hash() .. " :touchMove(touches)")
end

function SceneEntityState:touchCancelled(touches)
  print(self:hash() .. " :touchCancelled(touches)")
end

function SceneEntityState:pause()
  print(self:hash() .. " :pause()")
end

function SceneEntityState:unPause()
  print(self:hash() .. " :unPause()")
end

function SceneEntityState:keyboardShow()
  print(self:hash() .. " :keyboardShow()")
end

function SceneEntityState:keyboardCancel()
  print(self:hash() .. " :keyboardCancel()")
end

function SceneEntityState:keyboardReturn(text)
  print(self:hash() .. " :keyboardReturn(text)")
end

function SceneEntityState:willResignActive()
  print(self:hash() .. " :willResignActive()")
end

function SceneEntityState:didBecomeActive()
  print(self:hash() .. " :didBecomeActive()")
end

function SceneEntityState:didEnterBackground()
  print(self:hash() .. " :didEnterBackground()")
end

function SceneEntityState:willEnterForeground()
  print(self:hash() .. " :willEnterForeground()")
end

function SceneEntityState:willTerminate()
  print(self:hash() .. " :willTerminate()")
end

function SceneEntityState:interrupt()
  print(self:hash() .. " :interrupt()")
end

function SceneEntityState:resumeInterrupt()
  print(self:hash() .. " :resumeInterrupt()")
end

function SceneEntityState:receivedMemoryWarning()
  print(self:hash() .. " :receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(SceneEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function SceneEntityState:hash()
    return "NJLI.STATEMACHINE.SceneEntityState"
end

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

function SceneEntityState:__gc()
  SceneEntityState._destroy(self)
end

function SceneEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SceneEntityState:_destroy()
  assert(not self.__SceneEntityStateCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function SceneEntityState:_create(init)
  self.__SceneEntityStateCalledLoad = false

  __ctor(self, init)
end

function SceneEntityState:load()
  __load(self)

  self.__SceneEntityStateCalledLoad = true
end

function SceneEntityState:unLoad()
  assert(self.__SceneEntityStateCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__SceneEntityStateCalledLoad = false
end

return SceneEntityState
