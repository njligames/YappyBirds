local BaseClass = require "NJLI.STATEMACHINE.nodeEntityState"

local Selected = {}
Selected.__index = Selected

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

function Selected:enter()
	BaseClass.enter(self)
end

function Selected:update(timeStep)
	BaseClass.update(self, timeStep)
end

function Selected:exit()
	BaseClass.exit(self)
end

function Selected:onMessage()
	BaseClass.onMessage(self)
end

function Selected:touchDown(rayContact)
	BaseClass.touchDown(self, rayContact)
end

function Selected:touchUp(rayContact)
	BaseClass.touchUp(self, rayContact)
end

function Selected:touchMove(rayContact)
	BaseClass.touchMove(self, rayContact)
end

function Selected:touchCancelled(rayContact)
	BaseClass.touchCancelled(self, rayContact)
end

function Selected:collide(otherNode, collisionPoint)
	BaseClass.collide(self, collisionPoint)
end

function Selected:near(otherNode)
	BaseClass.near(self, otherNode)
end

function Selected:actionUpdate(action, timeStep)
	BaseClass.actionUpdate(self, timeStep)
end

function Selected:actionComplete(action)
	BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Selected, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Selected:className()
  return "Selected"
end

function Selected:class()
  return self
end

function Selected:superClass()
  return BaseClass
end

function Selected:__gc()
  --Destroy derived class first
  Selected._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Selected:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Selected:_destroy()
  assert(not self.__SelectedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Selected:_create(init)
  self.__SelectedCalledLoad = false
  __ctor(self, init)
end

function Selected:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__SelectedCalledLoad = true
end

function Selected:unLoad()
  assert(self.__SelectedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__SelectedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Selected
