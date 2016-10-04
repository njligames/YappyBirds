local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Loading = {}
Loading.__index = Loading

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

function Loading:enter()
  BaseClass.enter(self)
  print("Loading:enter()")
end

function Loading:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Loading:update(timeStep)")
end

function Loading:exit()
  BaseClass.exit(self)
  print("Loading:exit()")
end

function Loading:onMessage(message)
  BaseClass.onMessage(self, message)
  print("Loading:onMessage(message)")
end

function Loading:renderHUD()
  BaseClass.renderHUD(self)
  print("Loading:renderHUD()")
end

function Loading:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("Loading:touchDown(touches)")
end

function Loading:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("Loading:touchUp(touches)")
end

function Loading:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("Loading:touchMove(touches)")
end

function Loading:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("Loading:touchCancelled(touches)")
end

function Loading:pause()
  BaseClass.pause(self)
  print("Loading:pause()")
end

function Loading:unPause()
  BaseClass.unPause(self)
  print("Loading:unPause()")
end

function Loading:keyboardShow()
  BaseClass.keyboardShow(self)
  print("Loading:keyboardShow()")
end

function Loading:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("Loading:keyboardCancel()")
end

function Loading:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("Loading:keyboardReturn(text)")
end

function Loading:willResignActive()
  BaseClass.willResignActive(self)
  print("Loading:willResignActive()")
end

function Loading:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("Loading:didBecomeActive()")
end

function Loading:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("Loading:didEnterBackground()")
end

function Loading:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("Loading:willEnterForeground()")
end

function Loading:willTerminate()
  BaseClass.willTerminate(self)
  print("Loading:willTerminate()")
end

function Loading:interrupt()
  BaseClass.interrupt(self)
  print("Loading:interrupt()")
end

function Loading:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("Loading:resumeInterrupt()")
end

function Loading:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("Loading:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Loading, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Loading:className()
  return "Loading"
end

function Loading:class()
  return self
end

function Loading:superClass()
  return BaseClass
end

function Loading:__gc()
  --Destroy derived class first
  Loading._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Loading:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Loading:_destroy()
  assert(not self.__LoadingCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Loading:_create(init)
  self.__LoadingCalledLoad = false
  __ctor(self, init)
end

function Loading:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LoadingCalledLoad = true
end

function Loading:unLoad()
  assert(self.__LoadingCalledLoad, "Must load before unLoading")

  --unload derived first...
  __unLoad(self)
  self.__LoadingCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Loading
