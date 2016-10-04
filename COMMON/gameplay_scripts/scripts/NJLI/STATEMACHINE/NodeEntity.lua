local NodeEntity = {}
NodeEntity.__index = NodeEntity

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
  assert(type(init) == "table", "Init variable is expecting a states table")
  assert(init.entityOwner ~= nil, "init.entityOwner is nil")
  assert(init.states ~= nil, "init.states variable is nil")
  assert(type(init.states) == "table", "init.states variable is expecting a states table")

  self._node = njli.Node.create()
  self:getNode():setName(self:className())

  local startState = nil

  self._stateEntityTable = {}
  for k,v in pairs(init.states) do

    --create a NodeEntityState
    local stateEntity = v({entityOwner = self})

    if nil == startState then
      startState = stateEntity
    end

    self:_addEntityState(stateEntity)
  end

  self._entityOwner = init.entityOwner

  assert(startState, "No start state was defined for " .. self:className())

  self._startStateName = startState:className()
end

local __dtor = function(self)

  self._stateEntityTable = nil

  njli.Node.destroy(self:getNode())
  self._node = nil

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

function NodeEntity:_addEntityState(entityState)
  local stateName = entityState:className()
  self._stateEntityTable[stateName] = entityState
end

function NodeEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function NodeEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function NodeEntity:_getCurrentEntityState()
  assert(self:getNode():getStateMachine(), "message")
  assert(self:getNode():getStateMachine():getState(), "message")
  assert(self:getNode():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getNode():getStateMachine():getState():getName())
end

--#############################################################################
--General
--#############################################################################

function NodeEntity:getNode()
  return self._node
end

function NodeEntity:hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function NodeEntity:hasState()
  return self:getNode():getStateMachine():getState() ~= nil
end

function NodeEntity:getOwner()
  return self._entityOwner
end

--#############################################################################
--Statemachine code...
--#############################################################################

function NodeEntity:pushState(stateName)
  self:_getEntityState(stateName):push()
end

function NodeEntity:getStartStateEntity()
  return self:_getEntityState(self._startStateName)
end

function NodeEntity:startStateMachine()
  print("NodeEntity:startStateMachine()")

  self:pushState(self._startStateName)
end

function NodeEntity:enter()
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:update(timeStep)
  print("NodeEntity:update()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():update(timeStep)
end

function NodeEntity:exit()
  print("NodeEntity:exit()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():exit()
end

function NodeEntity:onMessage()
  print("NodeEntity:onMessage()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():onMessage()
end

function NodeEntity:rayTouchDown(rayContact)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:rayTouchUp(rayContact)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:rayTouchMove(rayContact)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:rayTouchCancelled(rayContact)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:collide(otherNode, collisionPoint)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:near(otherNode)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:actionUpdate(action, timeStep)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

function NodeEntity:actionComplete(action)
  print("NodeEntity:enter()")
  assert(self:hasState(), "NodeEntity must be in a state")
  self:_getCurrentEntityState():enter()
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(NodeEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function NodeEntity:className()
  return "NodeEntity"
end

function NodeEntity:class()
  return self
end

function NodeEntity:superClass()
  return nil
end

function NodeEntity:isa(theClass)
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

function NodeEntity:__gc()
  NodeEntity._destroy(self)
end

function NodeEntity:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function NodeEntity:_destroy()
  assert(not self.__NodeEntityCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function NodeEntity:_create(init)
  self.__NodeEntityCalledLoad = false

  __ctor(self, init)
end

function NodeEntity:load()
  __load(self)

  self.__NodeEntityCalledLoad = true
end

function NodeEntity:unLoad()
  assert(self.__NodeEntityCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__NodeEntityCalledLoad = false
end

return NodeEntity
