local SceneEntity = {}
SceneEntity.__index = SceneEntity

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
    assert(nil ~= init.states, "init variable is nil.")
    assert(type(init.states) == "table", "not a table")
    assert(nil ~= init.entityOwner, "entityOwner variable is nil.")
    assert(nil ~= init.nodes, "init variable is nil.")
    assert(type(init.nodes) == "table", "not a table")

    self._entityOwner = init.entityOwner

    self._scene = njli.Scene.create()
    self:getScene():setName(self:hash())

    self._rootNode = njli.Node.create()
    self:getScene():setRootNode(self._rootNode)

    local startState = nil

    self._stateEntityTable = {}
    for k,v in pairs(init.states) do
        assert(v.class ~= nil, "")
        assert(v.nodes ~= nil, "is nil")
        assert(type(v.nodes) == "table", "not a table")

        --create a SceneEntityState
        local stateEntity = v.class({
            entityOwner = self,
            nodes = v.nodes
          })

        if startState == nil then
          startState = stateEntity
        end

        self:_addEntityState(stateEntity)
    end

    assert(startState, "No start state was defined for " .. self:hash())

    self._startStateName = startState:hash()

    --Create the NodeEntities for this SceneEntity
    self.__nodeEntities = {}
    self:addNodeEntities(init.nodes, self)
end

local __dtor = function(self)
  self._stateEntityTable = nil

  njli.Scene.destroy(self:getScene())
  self._scene = nil

  njli.Node.destroy(self._rootNode)
  self._rootNode = nil
    
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

function SceneEntity:_addEntityState(entityState)
  local stateName = entityState:hash()
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

--#############################################################################
--Add/Remove NodeEntities
--#############################################################################

function SceneEntity:addNodeEntities(nodes, nodeEntitiyOwner)
  for k,v in pairs(nodes) do
    --Create a NodeEntity
    assert(v.class ~= nil, "init.class variable is expecting a class")
    assert(v.states ~= nil, "init.states variable is expecting a states table")
    assert(type(v.states) == "table", "init.states variable is expecting a states table")
    assert(v.nodes ~= nil, "init.nodes variable is expecting a nodes table")
    assert(type(v.nodes) == "table", "init.nodes variable is expecting a nodes table")

    local nodeEntity = v.class({
        states = v.states,
        entityOwner = nodeEntitiyOwner,
      })

    self:addNodeEntity(nodeEntity)

    self:addNodeEntities(v.nodes, nodeEntity)
  end
end

function SceneEntity:removeNodeEntities()
    for k, v in pairs(self.__nodeEntities) do
        self:removeNodeEntity(k)
    end
end

function SceneEntity:addNodeEntity(nodeEntity)

    assert(self.__nodeEntities ~= nil)
    assert(nodeEntity ~= nil)

    local name  = nodeEntity:getNode():getName()
    assert(name ~= nil)

    self.__nodeEntities[name]  = nodeEntity

    local nodeEntitiyOwner = nodeEntity:getOwner()

    if nodeEntitiyOwner:superClass():className() == SceneEntity.className() then
        self:getScene():getRootNode():addChildNode(nodeEntity:getNode())
    else
        nodeEntitiyOwner:getNode():addChildNode(nodeEntity:getNode())
    end

    Interface:getStateMachine():getEntityManager():addNodeEntity(nodeEntity)
end

function SceneEntity:removeNodeEntity(name)
    assert(name ~= nil)
    assert(self.__nodeEntities ~= nil)

    Interface:getStateMachine():getEntityManager():removeNodeEntity(name)

    self.__nodeEntities[name] = nil
end

function SceneEntity:getNodeEntity(name)
    assert(self._nodeEntityTable[name], "There must be a node entity with name: " .. name)

    return self._nodeEntityTable[name]
end

function SceneEntity:startNodeEntities()
   for k, v in pairs(self.__nodeEntities) do
       v:startStateMachine()
   end
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

function SceneEntity:getWorldEntityState()
  return self._entityOwner
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
    print(self:hash() .. " :startStateMachine()")

    --njli.World.getInstance():addScene(self:getScene())

    self:pushState(self._startStateName)

    --self:startNodeEntities()
--   for k, v in pairs(self.__nodeEntities) do
--       v:startStateMachine()
--   end
end

function SceneEntity:enter()
    print(self:hash() .. " :enter()")

    assert(self:hasState(), "SceneEntity must be in a state")

    self:_getCurrentEntityState():enter()
end

function SceneEntity:update(timeStep)
  --print(self:hash() .. " :update("..timeStep..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function SceneEntity:exit()
  print(self:hash() .. " :exit()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function SceneEntity:onMessage(message)
  print(self:hash() .. " :onMessage("..tostring(message)")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():onMessage(touches)
end

function SceneEntity:touchDown(touches)
  print(self:hash() .. " :touchDown("..tostring(touches) .. ")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchDown(touches)
end

function SceneEntity:touchUp(touches)
  print(self:hash() .. " :touchUp("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchUp(touches)
end

function SceneEntity:touchMove(touches)
  print(self:hash() .. " :touchMove("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchMove(touches)
end

function SceneEntity:touchCancelled(touches)
  print(self:hash() .. " :touchCancelled("..tostring(touches) ..")")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():touchCancelled(touches)
end

function SceneEntity:renderHUD()
  --print(self:hash() .. " :renderHUD()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():renderHUD()
end

function SceneEntity:pause()
  print(self:hash() .. " :pause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():pause()
end

function SceneEntity:unPause()
  print(self:hash() .. " :unPause()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():unPause()
end

function SceneEntity:willResignActive()
  print(self:hash() .. " :willResignActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willResignActive()
end

function SceneEntity:didBecomeActive()
  print(self:hash() .. " :didBecomeActive()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():didBecomeActive()
end

function SceneEntity:didEnterBackground()
  print(self:hash() .. " :didEnterBackground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():didEnterBackground()
end

function SceneEntity:willEnterForeground()
  print(self:hash() .. " :willEnterForeground()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willEnterForeground()
end

function SceneEntity:willTerminate()
  print(self:hash() .. " :willTerminate()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():willTerminate()
end

function SceneEntity:interrupt()
  print(self:hash() .. " :interrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():interrupt()
end

function SceneEntity:resumeInterrupt()
  print(self:hash() .. " :resumeInterrupt()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():resumeInterrupt()
end

function SceneEntity:receivedMemoryWarning()
  print(self:hash() .. " :receivedMemoryWarning()")
  assert(self:hasState(), "SceneEntity must be in a state")
  self:_getCurrentEntityState():receivedMemoryWarning()
end
--
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

function SceneEntity:hash()
    return "NJLI.STATEMACHINE.SceneEntity"
end

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
