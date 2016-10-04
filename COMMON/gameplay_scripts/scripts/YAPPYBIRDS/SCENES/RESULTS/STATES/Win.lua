local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Win = {}
Win.__index = Win

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

function Win:enter()
  BaseClass.enter(self)
  print("Win:enter()")
end

function Win:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Win:update(timeStep)")
end

function Win:exit()
  BaseClass.exit(self)
  print("Win:exit()")
end

function Win:onMessage(message)
  BaseClass.onMessage(self, message)
  print("Win:onMessage(message)")
end

function Win:renderHUD()
  BaseClass.renderHUD(self)
  print("Win:renderHUD()")
end

function Win:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("Win:touchDown(touches)")
end

function Win:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("Win:touchUp(touches)")
end

function Win:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("Win:touchMove(touches)")
end

function Win:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("Win:touchCancelled(touches)")
end

function Win:pause()
  BaseClass.pause(self)
  print("Win:pause()")
end

function Win:unPause()
  BaseClass.unPause(self)
  print("Win:unPause()")
end

function Win:keyboardShow()
  BaseClass.keyboardShow(self)
  print("Win:keyboardShow()")
end

function Win:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("Win:keyboardCancel()")
end

function Win:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("Win:keyboardReturn(text)")
end

function Win:willResignActive()
  BaseClass.willResignActive(self)
  print("Win:willResignActive()")
end

function Win:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("Win:didBecomeActive()")
end

function Win:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("Win:didEnterBackground()")
end

function Win:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("Win:willEnterForeground()")
end

function Win:willTerminate()
  BaseClass.willTerminate(self)
  print("Win:willTerminate()")
end

function Win:interrupt()
  BaseClass.interrupt(self)
  print("Win:interrupt()")
end

function Win:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("Win:resumeInterrupt()")
end

function Win:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("Win:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Win, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Win:className()
  return "Win"
end

function Win:class()
  return self
end

function Win:superClass()
  return BaseClass
end

function Win:__gc()
  --Destroy derived class first
  Win._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Win:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Win:_destroy()
  assert(not self.__WinCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Win:_create(init)
  self.__WinCalledLoad = false
  __ctor(self, init)
end

function Win:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__WinCalledLoad = true
end

function Win:unLoad()
  assert(self.__WinCalledLoad, "Must load before unWin")

  --unload derived first...
  __unLoad(self)
  self.__WinCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Win
