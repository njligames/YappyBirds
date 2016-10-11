local BaseClass = require "NJLI.STATEMACHINE.NodeEntity"

local BirdBeak = {}
BirdBeak.__index = BirdBeak

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

function BirdBeak:enter()
  BaseClass.enter(self)
  print("BirdBeak:enter()")
end

function BirdBeak:update(timeStep)
  BaseClass.update(self, timeStep)
  print("BirdBeak:update()")
end

function BirdBeak:exit()
  BaseClass.exit(self)
  print("BirdBeak:exit()")
end

function BirdBeak:onMessage()
  BaseClass.onMessage(self)
  print("BirdBeak:onMessage()")
end

function BirdBeak:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)
  print("BirdBeak:enter()")
end

function BirdBeak:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)
  print("BirdBeak:enter()")
end

function BirdBeak:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)
  print("BirdBeak:enter()")
end

function BirdBeak:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)
  print("BirdBeak:enter()")
end

function BirdBeak:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
  print("BirdBeak:enter()")
end

function BirdBeak:near(otherNode)
  BaseClass.near(self, otherNode)
  print("BirdBeak:enter()")
end

function BirdBeak:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
  print("BirdBeak:enter()")
end

function BirdBeak:actionComplete(action)
  BaseClass.actionComplete(self, action)
  print("BirdBeak:enter()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(BirdBeak, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function BirdBeak:hash()
    return "YAPPYBIRDS.NODES.BIRDBEAK.BirdBeak"
end

function BirdBeak:className()
  return "BirdBeak"
end

function BirdBeak:class()
  return self
end

function BirdBeak:superClass()
  return BaseClass
end

function BirdBeak:__gc()
  --Destroy derived class first
  BirdBeak._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function BirdBeak:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function BirdBeak:_destroy()
  assert(not self.__BirdBeakCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function BirdBeak:_create(init)
  self.__BirdBeakCalledLoad = false
  __ctor(self, init)
end

function BirdBeak:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__BirdBeakCalledLoad = true
end

function BirdBeak:unLoad()
  assert(self.__BirdBeakCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__BirdBeakCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return BirdBeak
