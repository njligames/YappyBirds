local NodeEntityState = {}
NodeEntityState.__index = NodeEntityState

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
  --TODO: construct this Entity
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

--TODO: write function here for NodeEntityState
--function NodeEntityState:somefunction()
--end

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

-- local NodeEntityState = {}
-- NodeEntityState.__index = NodeEntityState

-- local json = require('json')

-- setmetatable(NodeEntityState, {
--  __call = function (cls, ...)
--  local self = setmetatable({}, cls)
--  self:create(...)
--  return self
--  end,
-- })

-- function NodeEntityState:className()
--  return "NodeEntityState"
-- end

-- function NodeEntityState:class()
--  return self
-- end

-- function NodeEntityState:superClass()
--  return nil
-- end

-- function NodeEntityState:isa(theClass)
--  local b_isa = false
--  local cur_class = theClass:class()
--  while ( nil ~= cur_class ) and ( false == b_isa ) do
--  if cur_class == theClass then
--  b_isa = true
--  else
--  cur_class = cur_class:superClass()
--  end
--  end

--  return b_isa
-- end

-- function NodeEntityState:destroy()
--  NodeEntityState.__gc(self)
-- end


-- local init =
-- {
--  name = "name",
--  entityOwner = nil
-- }

-- function NodeEntityState:create(init)
 
--  assert(init, "init variable is nil.")
--  assert(init.name, "Init variable is expecting a name")
--  assert(init.entityOwner, "Init variable is expecting a entityOwner")

--  self._init = init

--  self:load()
-- end

-- function NodeEntityState:__gc()
 
--  self:unLoad()
-- end

-- function NodeEntityState:__tostring()
 
--  return json:stringify(self)
-- end

-- function NodeEntityState:getNodeState()
--  return self._nodeState
-- end

-- function NodeEntityState:getEntityOwner()
--  return self._entityOwner
-- end

-- function NodeEntity:isLoaded()
--  if self.loaded then
--  return self.loaded
--  end
--  return false
-- end

-- function NodeEntityState:load()
--  self:unLoad()

--  self._entityOwner = self._init.entityOwner
--  self._nodeState = njli.NodeState.create()

--  self:getNodeState():setName(self._init.name)

--  self.loaded = true
-- end

-- function NodeEntityState:unLoad()
--  if self:getNodeState() then
--  njli.NodeState.destroy(self:getNodeState())
--  end
--  self._nodeState = nil

--  self._entityOwner = nil

--  self.loaded = false
-- end

-- function NodeEntityState:pushState(stateName)
--   self:getEntityOwner():pushState(stateName)
-- end

-- function NodeEntityState:push() 
--  self:getEntityOwner():getNode():getStateMachine():pushState(self:getNodeState()) 
-- end

-- function NodeEntityState:isIn()
--  return self:getNodeState():getName() == self:getEntityOwner():getNode():getStateMachine():getState():getName()
-- end

-- function NodeEntityState:enter() print("NodeEntityState:enter") end
-- function NodeEntityState:update(timeStep) print("NodeEntityState:update") end
-- function NodeEntityState:exit() print("NodeEntityState:exit") end
-- function NodeEntityState:onMessage(message) print("NodeEntityState:onMessage") end
-- function NodeEntityState:touchDown(touches) print("NodeEntityState:touchDown") end
-- function NodeEntityState:touchUp(touches) print("NodeEntityState:touchUp") end
-- function NodeEntityState:touchMove(touches) print("NodeEntityState:touchMove") end
-- function NodeEntityState:touchCancelled(touches) print("NodeEntityState:touchCancelled") end
-- function NodeEntityState:render() print("NodeEntityState:render") end
-- function NodeEntityState:actionUpdate(action, timeStep) print("NodeEntityState:actionUpdate") end
-- function NodeEntityState:actionComplete(action) print("NodeEntityState:actionComplete") end
-- function NodeEntityState:collide(otherNode, collisionPoint) print("NodeEntityState:collide") end
-- function NodeEntityState:near(otherNode) print("NodeEntityState:near") end
-- function NodeEntityState:rayTouchDown(rayContact) print("NodeEntityState:rayTouchDown") end
-- function NodeEntityState:rayTouchUp(rayContact) print("NodeEntityState:rayTouchUp") end
-- function NodeEntityState:rayTouchMove(rayContact) print("NodeEntityState:rayTouchMove") end
-- function NodeEntityState:rayTouchCancelled(rayContact) print("NodeEntityState:rayTouchCancelled") end
-- function NodeEntityState:pause() print("NodeEntityState:pause") end
-- function NodeEntityState:unPause() print("NodeEntityState:unPause") end

-- return NodeEntityState
