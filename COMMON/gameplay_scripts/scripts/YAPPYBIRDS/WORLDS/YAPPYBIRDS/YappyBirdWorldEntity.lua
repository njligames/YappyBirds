local BaseClass = require "NJLI.STATEMACHINE.WorldEntity"

local YappyBirdWorldEntity = {}
YappyBirdWorldEntity.__index = YappyBirdWorldEntity

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

function YappyBirdWorldEntity:enter()
  BaseClass.enter(self)
  print("YappyBirdWorldEntity:enter()")
end

function YappyBirdWorldEntity:update(timeStep)
  BaseClass.update(self, timeStep)
  print("YappyBirdWorldEntity:update(timeStep)")
end

function YappyBirdWorldEntity:exit()
  BaseClass.exit(self)
  print("YappyBirdWorldEntity:exit()")
end

function YappyBirdWorldEntity:onMessage()
  BaseClass.onMessage(self)
  print("YappyBirdWorldEntity:onMessage()")
end

function YappyBirdWorldEntity:renderHUD()
  BaseClass.renderHUD(self)
  print("YappyBirdWorldEntity:renderHUD()")
end

function YappyBirdWorldEntity:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("YappyBirdWorldEntity:touchDown(touches)")
end

function YappyBirdWorldEntity:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("YappyBirdWorldEntity:touchUp(touches)")
end

function YappyBirdWorldEntity:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("YappyBirdWorldEntity:touchMove(touches)")
end

function YappyBirdWorldEntity:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("YappyBirdWorldEntity:touchCancelled(touches)")
end

function YappyBirdWorldEntity:pause()
  BaseClass.pause(self)
  print("YappyBirdWorldEntity:pause()")
end

function YappyBirdWorldEntity:unPause()
  BaseClass.unPause(self)
  print("YappyBirdWorldEntity:unPause()")
end

function YappyBirdWorldEntity:keyboardShow()
  BaseClass.keyboardShow(self)
  print("YappyBirdWorldEntity:keyboardShow()")
end

function YappyBirdWorldEntity:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("YappyBirdWorldEntity:keyboardCancel()")
end

function YappyBirdWorldEntity:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("YappyBirdWorldEntity:keyboardReturn(text)")
end

function YappyBirdWorldEntity:willResignActive()
  BaseClass.willResignActive(self)
  print("YappyBirdWorldEntity:willResignActive()")
end

function YappyBirdWorldEntity:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("YappyBirdWorldEntity:didBecomeActive()")
end

function YappyBirdWorldEntity:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("YappyBirdWorldEntity:didEnterBackground()")
end

function YappyBirdWorldEntity:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("YappyBirdWorldEntity:willEnterForeground()")
end

function YappyBirdWorldEntity:willTerminate()
  BaseClass.willTerminate(self)
  print("YappyBirdWorldEntity:willTerminate()")
end

function YappyBirdWorldEntity:interrupt()
  BaseClass.interrupt(self)
  print("YappyBirdWorldEntity:interrupt()")
end

function YappyBirdWorldEntity:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("YappyBirdWorldEntity:resumeInterrupt()")
end

function YappyBirdWorldEntity:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("YappyBirdWorldEntity:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(YappyBirdWorldEntity, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
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
  return BaseClass
end

function YappyBirdWorldEntity:__gc()
  --Destroy derived class first
  YappyBirdWorldEntity._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function YappyBirdWorldEntity:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function YappyBirdWorldEntity:_destroy()
  assert(not self.__YappyBirdWorldEntityCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function YappyBirdWorldEntity:_create(init)
  self.__YappyBirdWorldEntityCalledLoad = false
  __ctor(self, init)
end

function YappyBirdWorldEntity:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__YappyBirdWorldEntityCalledLoad = true
end

function YappyBirdWorldEntity:unLoad()
  assert(self.__YappyBirdWorldEntityCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__YappyBirdWorldEntityCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return YappyBirdWorldEntity
