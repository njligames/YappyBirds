local BaseClass = require "NJLI.STATEMACHINE.NodeEntityState"

local Fly = {}
Fly.__index = Fly

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

function Fly:enter()
  BaseClass.enter(self)
  print(self:hash() .. " :enter()")
end

function Fly:update(timeStep)
  BaseClass.update(self, timeStep)
  print(self:hash() .. " :update(timeStep)")
end

function Fly:exit()
  BaseClass.exit(self)
  print(self:hash() .. " :exit()")
end

function Fly:onMessage()
  BaseClass.onMessage(self)
  print(self:hash() .. " :onMessage()")
end

function Fly:touchDown(rayContact)
  BaseClass.touchDown(self, rayContact)
  print(self:hash() .. " :touchDown(rayContact)")
end

function Fly:touchUp(rayContact)
  BaseClass.touchUp(self, rayContact)
  print(self:hash() .. " :touchUp(rayContact)")
end

function Fly:touchMove(rayContact)
  BaseClass.touchMove(self, rayContact)
  print(self:hash() .. " :touchMove(rayContact)")
end

function Fly:touchCancelled(rayContact)
  BaseClass.touchCancelled(self, rayContact)
  print(self:hash() .. " :touchCancelled(rayContact)")
end

function Fly:collide(otherNode, collisionPoint)
  BaseClass.collide(self, collisionPoint)
  print(self:hash() .. " :collide(otherNode, collisionPoint)")
end

function Fly:near(otherNode)
  BaseClass.near(self, otherNode)
  print(self:hash() .. " :near(otherNode)")
end

function Fly:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, timeStep)
  print(self:hash() .. " :actionUpdate(action, timeStep)")
end

function Fly:actionComplete(action)
  BaseClass.actionComplete(self, action)
  print(self:hash() .. " :actionComplete(action)")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Fly, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Fly:hash()
    return "YAPPYBIRDS.NODES.BIRD.STATES.Fly"
end

function Fly:className()
  return "Fly"
end

function Fly:class()
  return self
end

function Fly:superClass()
  return BaseClass
end

function Fly:__gc()
  --Destroy derived class first
  Fly._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Fly:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Fly:_destroy()
  assert(not self.__FlyCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Fly:_create(init)
  self.__FlyCalledLoad = false
  __ctor(self, init)
end

function Fly:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__FlyCalledLoad = true
end

function Fly:unLoad()
  assert(self.__FlyCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__FlyCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Fly
