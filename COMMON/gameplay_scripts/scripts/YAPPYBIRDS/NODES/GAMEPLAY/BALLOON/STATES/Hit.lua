local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local Hit = {}
Hit.__index = Hit

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

function Hit:enter()
  BaseClass.enter(self)
  print("Hit:enter()")
end

function Hit:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Hit:update()")
end

function Hit:exit()
  BaseClass.exit(self)
  print("Hit:exit()")
end

function Hit:onMessage()
  BaseClass.onMessage(self)
  print("Hit:onMessage()")
end

function Hit:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
  print("Hit:enter()")
end

function Hit:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
  print("Hit:enter()")
end

function Hit:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
  print("Hit:enter()")
end

function Hit:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
  print("Hit:enter()")
end

function Hit:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
  print("Hit:enter()")
end

function Hit:near(otherNode)
  BaseClass.near(self, otherNode)
  print("Hit:enter()")
end

function Hit:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
  print("Hit:enter()")
end

function Hit:actionComplete(action)
  BaseClass.actionComplete(self, action)
  print("Hit:enter()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Hit, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Hit:className()
  return "Hit"
end

function Hit:class()
  return self
end

function Hit:superClass()
  return BaseClass
end

function Hit:__gc()
  --Destroy derived class first
  Hit._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Hit:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Hit:_destroy()
  assert(not self.__HitCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Hit:_create(init)
  self.__HitCalledLoad = false
  __ctor(self, init)
end

function Hit:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__HitCalledLoad = true
end

function Hit:unLoad()
  assert(self.__HitCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__HitCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Hit
