local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Pause = {}
Pause.__index = Pause

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

function Pause:enter()
  BaseClass.enter(self)
  print("Pause:enter()")
end

function Pause:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Pause:update(timeStep)")
end

function Pause:exit()
  BaseClass.exit(self)
  print("Pause:exit()")
end

function Pause:onMessage(message)
  BaseClass.onMessage(self, message)
  print("Pause:onMessage(message)")
end

function Pause:renderHUD()
  BaseClass.renderHUD(self)
  print("Pause:renderHUD()")
end

function Pause:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("Pause:touchDown(touches)")
end

function Pause:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("Pause:touchUp(touches)")
end

function Pause:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("Pause:touchMove(touches)")
end

function Pause:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("Pause:touchCancelled(touches)")
end

function Pause:pause()
  BaseClass.pause(self)
  print("Pause:pause()")
end

function Pause:unPause()
  BaseClass.unPause(self)
  print("Pause:unPause()")
end

function Pause:keyboardShow()
  BaseClass.keyboardShow(self)
  print("Pause:keyboardShow()")
end

function Pause:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("Pause:keyboardCancel()")
end

function Pause:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("Pause:keyboardReturn(text)")
end

function Pause:willResignActive()
  BaseClass.willResignActive(self)
  print("Pause:willResignActive()")
end

function Pause:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("Pause:didBecomeActive()")
end

function Pause:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("Pause:didEnterBackground()")
end

function Pause:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("Pause:willEnterForeground()")
end

function Pause:willTerminate()
  BaseClass.willTerminate(self)
  print("Pause:willTerminate()")
end

function Pause:interrupt()
  BaseClass.interrupt(self)
  print("Pause:interrupt()")
end

function Pause:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("Pause:resumeInterrupt()")
end

function Pause:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("Pause:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Pause, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Pause:hash()
    return "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Pause"
end

function Pause:className()
  return "Pause"
end

function Pause:class()
  return self
end

function Pause:superClass()
  return BaseClass
end

function Pause:__gc()
  --Destroy derived class first
  Pause._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Pause:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Pause:_destroy()
  assert(not self.__PauseCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Pause:_create(init)
  self.__PauseCalledLoad = false
  __ctor(self, init)
end

function Pause:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__PauseCalledLoad = true
end

function Pause:unLoad()
  assert(self.__PauseCalledLoad, "Must load before unPause")

  --unload derived first...
  __unLoad(self)
  self.__PauseCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Pause
