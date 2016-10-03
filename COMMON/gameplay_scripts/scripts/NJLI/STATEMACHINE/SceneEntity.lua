local SceneEntity = {}
SceneEntity.__index = SceneEntity

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
  assert(nil ~= init, "init variable is nil.")
  assert(type(init) == "table", "not a table")
  assert(nil ~= init.states, "init variable is nil.")
  assert(type(init.states) == "table", "not a table")
  -- assert(nil == init.nodes, "init variable is nil.")
  -- assert(type(init.nodes) == "table", "not a table")
  assert(nil ~= entityOwner, "entityOwner variable is nil.")

  self._scene = njli.Scene.create()
  self:getScene():setName(self:className())

  self._entityOwner = init.entityOwner

  self._nodeEntityTable {}
  if init.nodes then
    for k,v in pairs(init.nodes) do
      --Create a NodeEntity
      local nodeEntity = v.class(v.states)
      self:_addNodeEntity(nodeEntity)
    end
  end
  
  local startState = nil
  local startStateName = ""
  self._stateEntityTable = {}
  for k,v in pairs(init.states) do

    --create a SceneEntityState
    local stateEntity = v({
      entityOwner = self,
      nodes = self._nodeEntityTable
    })

    if startState == nil then
      startState = stateEntity
      startStateName = stateEntity:className()
    end

    self:_addEntityState(sceneStateEntity)
  end

  assert(startState, "No start state was defined for " .. self:className())
  
  self._startStateName = startStateName
end

local __dtor = function(self)
  njli.Scene.destroy(self:getScene())
  self._scene = nil
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

-- function SceneEntity:_addEntityState(stateName, entityStateModule)
--   local init =
--   {
--     name = stateName,
--     entityOwner = self
--   }
--   self._stateEntityTable[stateName] = entityStateModule(init)
-- end
function SceneEntity:_addEntityState(entityState)
  local stateName = entityState:className()
  self._stateEntityTable[stateName] = entityState
end

function SceneEntity:_removeEntityState(stateName)
  self._stateEntityTable[stateName] = nil
end

function SceneEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function SceneEntity:_getCurrentEntityState()
  assert(self:getScene():getStateMachine(), "message")
  assert(self:getScene():getStateMachine():getState(), "message")
  assert(self:getScene():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getScene():getStateMachine():getState():getName())
end








function SceneEntity:_addNodeEntity(node)
  local stateName = node:className()
  self._nodeEntityTable[stateName] = entityState
end

function SceneEntity:_removeNodeEntity(stateName)
  self._nodeEntityTable[stateName] = nil
end

function SceneEntity:_getNodeEntity(nodeName)
  assert(self._nodeEntityTable[nodeName], "There must be a node entity with name: " .. stateName)

  return self._nodeEntityTable[nodeName]
end







--############################################################################# 
--General
--#############################################################################

function SceneEntity:getScene()
  return self._scene
end

function SceneEntity:hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function SceneEntity:hasState()
  return self:getScene():getStateMachine():getState() ~= nil
end

--############################################################################# 
--Statemachine code...
--#############################################################################

function SceneEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function SceneEntity:getStartStateEntity()
  return self:_getEntityState(self._startStateName)
end

function SceneEntity:startStateMachine()
  print("SceneEntity:startStateMachine()")

  njli.World.getInstance():addScene(self:getScene())

  self:pushState(self._startStateName)
end

function SceneEntity:enter()
  print("SceneEntity:enter()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function SceneEntity:update(timeStep)
 print("SceneEntity:update("..timeStep..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function SceneEntity:exit()
  print("SceneEntity:exit()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function SceneEntity:onMessage(message)
  print("SceneEntity:onMessage("..tostring(message)")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():onMessage(touches)
end

function SceneEntity:touchDown(touches)
 print("SceneEntity:touchDown("..tostring(touches) .. ")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchDown(touches)
end

function SceneEntity:touchUp(touches)
 print("SceneEntity:touchUp("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchUp(touches)
end

function SceneEntity:touchMove(touches)
 print("SceneEntity:touchMove("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchMove(touches)
end

function SceneEntity:touchCancelled(touches)
 print("SceneEntity:touchCancelled("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled(touches)
end

function SceneEntity:renderHUD()
 print("SceneEntity:renderHUD()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function SceneEntity:pause()
  print("SceneEntity:pause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():pause()
end

function SceneEntity:unPause()
  print("SceneEntity:unPause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():unPause()
end

function SceneEntity:willResignActive()
 print("SceneEntity:willResignActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willResignActive()
end

function SceneEntity:didBecomeActive()
 print("SceneEntity:didBecomeActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():didBecomeActive()
end

function SceneEntity:didEnterBackground()
 print("SceneEntity:didEnterBackground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():didEnterBackground()
end

function SceneEntity:willEnterForeground()
 print("SceneEntity:willEnterForeground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willEnterForeground()
end

function SceneEntity:willTerminate()
 print("SceneEntity:willTerminate()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willTerminate()
end

function SceneEntity:interrupt()
 print("SceneEntity:interrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():interrupt()
end

function SceneEntity:resumeInterrupt()
 print("SceneEntity:resumeInterrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():resumeInterrupt()
end

function SceneEntity:receivedMemoryWarning()
 print("SceneEntity:receivedMemoryWarning()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():receivedMemoryWarning()
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(SceneEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
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

function SceneEntity:__gc()
  SceneEntity._destroy(self)
end

function SceneEntity:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SceneEntity:_destroy()
  assert(not self.__SceneEntityCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function SceneEntity:_create(init)
  self.__SceneEntityCalledLoad = false
  
  __ctor(self, init)
end

function SceneEntity:load()
  __load(self)
  
  self.__SceneEntityCalledLoad = true
end

function SceneEntity:unLoad()
  assert(self.__SceneEntityCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__SceneEntityCalledLoad = false
end

return SceneEntity
