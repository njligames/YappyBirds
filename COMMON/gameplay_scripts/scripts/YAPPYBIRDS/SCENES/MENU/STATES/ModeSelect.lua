local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local ModeSelect = {}
ModeSelect.__index = ModeSelect

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

function ModeSelect:enter()
  BaseClass.enter(self)
  print("ModeSelect:enter()")
end

function ModeSelect:update(timeStep)
  BaseClass.update(self, timeStep)
  print("ModeSelect:update(timeStep)")
end

function ModeSelect:exit()
  BaseClass.exit(self)
  print("ModeSelect:exit()")
end

function ModeSelect:onMessage(message)
  BaseClass.onMessage(self, message)
  print("ModeSelect:onMessage(message)")
end

function ModeSelect:renderHUD()
  BaseClass.renderHUD(self)
  print("ModeSelect:renderHUD()")
end

function ModeSelect:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("ModeSelect:touchDown(touches)")
end

function ModeSelect:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("ModeSelect:touchUp(touches)")
end

function ModeSelect:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("ModeSelect:touchMove(touches)")
end

function ModeSelect:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("ModeSelect:touchCancelled(touches)")
end

function ModeSelect:pause()
  BaseClass.pause(self)
  print("ModeSelect:pause()")
end

function ModeSelect:unPause()
  BaseClass.unPause(self)
  print("ModeSelect:unPause()")
end

function ModeSelect:keyboardShow()
  BaseClass.keyboardShow(self)
  print("ModeSelect:keyboardShow()")
end

function ModeSelect:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("ModeSelect:keyboardCancel()")
end

function ModeSelect:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("ModeSelect:keyboardReturn(text)")
end

function ModeSelect:willResignActive()
  BaseClass.willResignActive(self)
  print("ModeSelect:willResignActive()")
end

function ModeSelect:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("ModeSelect:didBecomeActive()")
end

function ModeSelect:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("ModeSelect:didEnterBackground()")
end

function ModeSelect:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("ModeSelect:willEnterForeground()")
end

function ModeSelect:willTerminate()
  BaseClass.willTerminate(self)
  print("ModeSelect:willTerminate()")
end

function ModeSelect:interrupt()
  BaseClass.interrupt(self)
  print("ModeSelect:interrupt()")
end

function ModeSelect:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("ModeSelect:resumeInterrupt()")
end

function ModeSelect:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("ModeSelect:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(ModeSelect, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function ModeSelect:hash()
    return "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect"
end

function ModeSelect:className()
  return "ModeSelect"
end

function ModeSelect:class()
  return self
end

function ModeSelect:superClass()
  return BaseClass
end

function ModeSelect:__gc()
  --Destroy derived class first
  ModeSelect._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function ModeSelect:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function ModeSelect:_destroy()
  assert(not self.__ModeSelectCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function ModeSelect:_create(init)
  self.__ModeSelectCalledLoad = false
  __ctor(self, init)
end

function ModeSelect:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__ModeSelectCalledLoad = true
end

function ModeSelect:unLoad()
  assert(self.__ModeSelectCalledLoad, "Must load before unModeSelect")

  --unload derived first...
  __unLoad(self)
  self.__ModeSelectCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return ModeSelect
