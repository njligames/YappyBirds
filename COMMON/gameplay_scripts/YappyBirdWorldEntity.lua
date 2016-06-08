local NJLIWorldEntity = require "NJLIWorldEntity"

local YappyBirdWorldEntity = {}
YappyBirdWorldEntity.__index = YappyBirdWorldEntity

local json = require('cjson')

setmetatable(YappyBirdWorldEntity, {
  __index = NJLIWorldEntity,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    NJLIWorldEntity.create(self, init)
    self:create(...)
    return self
  end,
})

function YappyBirdWorldEntity:className()
  return "YappyBirdWorldEntity"
end

function YappyBirdWorldEntity:class()
  return self
end

function YappyBirdWorldEntity:superClass()
  return NJLIWorldEntity
end

function YappyBirdWorldEntity:destroy()
  YappyBirdWorldEntity.__gc(self)
  NJLIWorldEntity.destroy(self)
end

function YappyBirdWorldEntity:create(init)
  --TODO: Create and initialize properties...
  ---[[
  --EXAMPLE:
  self._variable1 = nil
  self._variable2 = nil
  self._variable3 = nil
  self._variable4 = nil
  self._variable5 = nil
  self._variable6 = nil
  self._variable7 = nil
  --]]

  if init then
    --TODO: Initialize the properties...
  end
end

function YappyBirdWorldEntity:__gc()
  --TODO: Destroy properties
end

function YappyBirdWorldEntity:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

--TODO: List the Functions for YappyBirdWorldEntity

  ---[[
  --EXAMPLE:

function YappyBirdWorldEntity:set_variable1(newval)
  NJLIWorldEntity.set_variable1(self)
  self._variable1 = newval
end

function YappyBirdWorldEntity:get_variable1()
  local variable1 = NJLIWorldEntity.get_variable1(self)
  return self._variable1
end

function YappyBirdWorldEntity:set_variable2(newval)
  NJLIWorldEntity.set_variable2(self)
  self._variable2 = newval
end

function YappyBirdWorldEntity:get_variable2()
  local variable2 = NJLIWorldEntity.get_variable2(self)
  return self._variable2
end

function YappyBirdWorldEntity:set_variable3(newval)
  NJLIWorldEntity.set_variable3(self)
  self._variable3 = newval
end

function YappyBirdWorldEntity:get_variable3()
  local variable3 = NJLIWorldEntity.get_variable3(self)
  return self._variable3
end

function YappyBirdWorldEntity:set_variable4(newval)
  NJLIWorldEntity.set_variable4(self)
  self._variable4 = newval
end

function YappyBirdWorldEntity:get_variable4()
  local variable4 = NJLIWorldEntity.get_variable4(self)
  return self._variable4
end

function YappyBirdWorldEntity:set_variable5(newval)
  NJLIWorldEntity.set_variable5(self)
  self._variable5 = newval
end

function YappyBirdWorldEntity:get_variable5()
  local variable5 = NJLIWorldEntity.get_variable5(self)
  return self._variable5
end

function YappyBirdWorldEntity:set_variable6(newval)
  NJLIWorldEntity.set_variable6(self)
  self._variable6 = newval
end

function YappyBirdWorldEntity:get_variable6()
  local variable6 = NJLIWorldEntity.get_variable6(self)
  return self._variable6
end

function YappyBirdWorldEntity:set_variable7(newval)
  NJLIWorldEntity.set_variable7(self)
  self._variable7 = newval
end

function YappyBirdWorldEntity:get_variable7()
  local variable7 = NJLIWorldEntity.get_variable7(self)
  return self._variable7
end

  --]]

return YappyBirdWorldEntity