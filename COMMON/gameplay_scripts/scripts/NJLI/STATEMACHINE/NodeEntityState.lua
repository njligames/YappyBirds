local NodeEntityState = {}
NodeEntityState.__index = NodeEntityState

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
  assert(init.entityOwner, "Init variable is expecting a entityOwner")

  self._entityOwner = init.entityOwner
  self._nodeState = njli.NodeState.create()

  self:getNodeState():setName(self:hash())
end

local __dtor = function(self)
  --TODO: destruct this Entity
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

function NodeEntityState:getNodeState()
  return self._nodeState
end

function NodeEntityState:getNodeEntity()
  return self._entityOwner
end

function NodeEntityState:pushState(stateName)
  self:getNodeEntity():pushState(stateName)
end

--#############################################################################
--Statemachine code...
--#############################################################################

--function NodeEntityState:pushState(stateName)
  --self:getNodeEntity():pushState(stateName)
--end

function NodeEntityState:push()
    print("calling push")
  self:getNodeEntity():getNode():getStateMachine():pushState(self:getNodeState())
end

function NodeEntityState:isIn()
  return self:getNodeState():getName() == self:getNodeEntity():getNode():getStateMachine():getState():getName()
end

function NodeEntityState:enter()
  print("NodeEntityState:enter()")
end

function NodeEntityState:update(timeStep)
  print("NodeEntityState:update(timeStep)")
end

function NodeEntityState:exit()
  print("NodeEntityState:exit()")
end

function NodeEntityState:onMessage()
  print("NodeEntityState:onMessage()")
end

function NodeEntityState:touchDown(rayContact)
  print("NodeEntityState:touchDown(rayContact)")
end

function NodeEntityState:touchUp(rayContact)
  print("NodeEntityState:touchUp(rayContact)")
end

function NodeEntityState:touchMove(rayContact)
  print("NodeEntityState:touchMove(rayContact)")
end

function NodeEntityState:touchCancelled(rayContact)
  print("NodeEntityState:touchCancelled(rayContact)")
end

function NodeEntityState:collide(otherNode, collisionPoint)
  print("NodeEntityState:collide(otherNode, collisionPoint)")
end

function NodeEntityState:near(otherNode)
  print("NodeEntityState:near(otherNode)")
end

function NodeEntityState:actionUpdate(action, timeStep)
  print("NodeEntityState:actionUpdate(action, timeStep)")
end

function NodeEntityState:actionComplete(action)
  print("NodeEntityState:actionComplete(action)")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(NodeEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function NodeEntityState:hash()
    return "NJLI.STATEMACHINE.NodeEntityState"
end

function NodeEntityState:className()
  return "NodeEntityState"
end

function NodeEntityState:class()
  return self
end

function NodeEntityState:superClass()
  return nil
end

function NodeEntityState:isa(theClass)
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

function NodeEntityState:__gc()
  NodeEntityState._destroy(self)
end

function NodeEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function NodeEntityState:_destroy()
  assert(not self.__NodeEntityStateCalledLoad, "Must unload before you destroy")

  __dtor(self)
end

function NodeEntityState:_create(init)
  self.__NodeEntityStateCalledLoad = false

  __ctor(self, init)
end

function NodeEntityState:load()
  __load(self)

  self.__NodeEntityStateCalledLoad = true
end

function NodeEntityState:unLoad()
  assert(self.__NodeEntityStateCalledLoad, "Must load before unloading")

  __unLoad(self)
  self.__NodeEntityStateCalledLoad = false
end

return NodeEntityState
