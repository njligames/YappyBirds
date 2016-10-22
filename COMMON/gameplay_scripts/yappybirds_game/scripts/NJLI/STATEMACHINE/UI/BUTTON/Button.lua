local BaseClass = require "NJLI.STATEMACHINE.nodeEntity"

local Button = {}
Button.__index = Button

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
    assert(init.atlas ~= nil, "init.atlas variable is nil")
    assert(init.geometry ~= nil, "init.geometry variable is nil")

    self._scale = 1.0
    self._disabled = false

    local node = self:getNode()

    node:setGeometry(init.geometry)
    
    self._physicsShape = njli.PhysicsShapeBox.create()

    self._physicsBody = njli.PhysicsBodyRigid.create()
    self._physicsBody:setStaticPhysics()
    self._physicsBody:setPhysicsShape(self._physicsShape)

    node:setPhysicsBody(self._physicsBody)

    if nil ~= init.disabled then
        self._disabled = init.disabled
    end

    self._soundTouchDown = njli.Sound.create()
    self._soundTouchUp = njli.Sound.create()
    self._soundTouchDrag = njli.Sound.create()
    self._soundTouchCancel = njli.Sound.create()
end

local __dtor = function(self)
    njli.Sound.destroy(self._soundTouchCancel)
    self._soundTouchCancel = nil
    njli.Sound.destroy(self._soundTouchDrag)
    self._soundTouchDrag = nil
    njli.Sound.destroy(self._soundTouchUp)
    self._soundTouchUp = nil
    njli.Sound.destroy(self._soundTouchDown)
    self._soundTouchDown = nil

    njli.PhysicsBodyRigid.destroy(self._physicsBody)
    njli.PhysicsShapeBox.destroy(self._physicsShape)

    self._sound = nil
    self._physicsBody = nil
    self._physicsShape = nil
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################
--Button Specific
--#############################################################################

function Button:scale(s)
    if s ~= nil then
        self._scale = s
    end
    return self._scale
end

function Button:disabled(b)
    if b ~= nil then
        self._disabled = b
    end
    return self._disabled
end

function Button:touchUpInside(rayContact)
    print(self:getNode():getName() .. ":touchUpInside")
end

function Button:touchDownInside(rayContact)
    print(self:getNode():getName() .. ":touchDownInside")
end

function Button:touchDragInside(rayContact)
    print(self:getNode():getName() .. ":touchDragInside")
end

function Button:touchCancel(rayContact)
    print(self:getNode():getName() .. ":touchCancel")
end

--#############################################################################

function Button:enter()
  BaseClass.enter(self)
end

function Button:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Button:exit()
  BaseClass.exit(self)
end

function Button:onMessage()
  BaseClass.onMessage(self)
end

function Button:rayTouchDown(rayContact)
  BaseClass.rayTouchDown(self, rayContact)

  if not self:disabled() then
      self:touchDownInside(rayContact)
  end
end

function Button:rayTouchUp(rayContact)
  BaseClass.rayTouchUp(self, rayContact)

  if not self:disabled() then
      self:touchUpInside(rayContact)
  end
end

function Button:rayTouchMove(rayContact)
  BaseClass.rayTouchMove(self, rayContact)

  if not self:disabled() then
      self:touchDragInside(rayContact)
  end
end

function Button:rayTouchCancelled(rayContact)
  BaseClass.rayTouchCancelled(self, rayContact)

  if not self:disabled() then
      self:touchCancelled(rayContact)
  end
end

function Button:collide(otherNode, collisionPoint)
  BaseClass.collide(self, otherNode, collisionPoint)
end

function Button:near(otherNode)
  BaseClass.near(self, otherNode)
end

function Button:actionUpdate(action, timeStep)
  BaseClass.actionUpdate(self, action, timeStep)
end

function Button:actionComplete(action)
  BaseClass.actionComplete(self, action)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Button, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Button:className()
  return "Button"
end

function Button:class()
  return self
end

function Button:superClass()
  return BaseClass
end

function Button:__gc()
  --Destroy derived class first
  Button._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Button:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Button:_destroy()
  assert(not self.__ButtonCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Button:_create(init)
  self.__ButtonCalledLoad = false
  __ctor(self, init)
end

function Button:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__ButtonCalledLoad = true
end

function Button:unLoad()
  assert(self.__ButtonCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__ButtonCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Button
