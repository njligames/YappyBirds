local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Grabbed = {}
Grabbed.__index = Grabbed

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

function Grabbed:enter()
  BaseClass.enter(self)
  print("Grabbed:enter()")
end

function Grabbed:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Grabbed:update(timeStep)")
end

function Grabbed:exit()
  BaseClass.exit(self)
  print("Grabbed:exit()")
end

function Grabbed:onMessage()
  BaseClass.onMessage(self)
  print("Grabbed:onMessage()")
end

function Grabbed:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
  print("Grabbed:touchDown(rayContact)")
end

function Grabbed:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
  print("Grabbed:touchUp(rayContact)")
end

function Grabbed:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
  print("Grabbed:touchMove(rayContact)")
end

function Grabbed:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
  print("Grabbed:touchCancelled(rayContact)")
end

function Grabbed:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
  print("Grabbed:collide(otherNode, collisionPoint)")
end

function Grabbed:near(otherNode)
  BaseClass.near(self, otherNode)
  print("Grabbed:near(otherNode)")
end

function Grabbed:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
  print("Grabbed:actionUpdate(action, timeStep)")
end

function Grabbed:actionComplete(action)
  BaseClass.actionComplete(self, action)
  print("Grabbed:actionComplete(action)")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Grabbed, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Grabbed:className()
  return "Grabbed"
end

function Grabbed:class()
  return self
end

function Grabbed:superClass()
  return BaseClass
end

function Grabbed:__gc()
  --Destroy derived class first
  Grabbed._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Grabbed:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Grabbed:_destroy()
  assert(not self.__GrabbedCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Grabbed:_create(init)
  self.__GrabbedCalledLoad = false
  __ctor(self, init)
end

function Grabbed:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__GrabbedCalledLoad = true
end

function Grabbed:unLoad()
  assert(self.__GrabbedCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__GrabbedCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Grabbed
