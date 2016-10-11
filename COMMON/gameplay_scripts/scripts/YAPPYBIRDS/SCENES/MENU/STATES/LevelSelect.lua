local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local LevelSelect = {}
LevelSelect.__index = LevelSelect

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

function LevelSelect:enter()
  BaseClass.enter(self)
  print("LevelSelect:enter()")
end

function LevelSelect:update(timeStep)
  BaseClass.update(self, timeStep)
  print("LevelSelect:update(timeStep)")
end

function LevelSelect:exit()
  BaseClass.exit(self)
  print("LevelSelect:exit()")
end

function LevelSelect:onMessage(message)
  BaseClass.onMessage(self, message)
  print("LevelSelect:onMessage(message)")
end

function LevelSelect:renderHUD()
  BaseClass.renderHUD(self)
  print("LevelSelect:renderHUD()")
end

function LevelSelect:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("LevelSelect:touchDown(touches)")
end

function LevelSelect:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("LevelSelect:touchUp(touches)")
end

function LevelSelect:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("LevelSelect:touchMove(touches)")
end

function LevelSelect:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("LevelSelect:touchCancelled(touches)")
end

function LevelSelect:pause()
  BaseClass.pause(self)
  print("LevelSelect:pause()")
end

function LevelSelect:unPause()
  BaseClass.unPause(self)
  print("LevelSelect:unPause()")
end

function LevelSelect:keyboardShow()
  BaseClass.keyboardShow(self)
  print("LevelSelect:keyboardShow()")
end

function LevelSelect:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("LevelSelect:keyboardCancel()")
end

function LevelSelect:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("LevelSelect:keyboardReturn(text)")
end

function LevelSelect:willResignActive()
  BaseClass.willResignActive(self)
  print("LevelSelect:willResignActive()")
end

function LevelSelect:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("LevelSelect:didBecomeActive()")
end

function LevelSelect:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("LevelSelect:didEnterBackground()")
end

function LevelSelect:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("LevelSelect:willEnterForeground()")
end

function LevelSelect:willTerminate()
  BaseClass.willTerminate(self)
  print("LevelSelect:willTerminate()")
end

function LevelSelect:interrupt()
  BaseClass.interrupt(self)
  print("LevelSelect:interrupt()")
end

function LevelSelect:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("LevelSelect:resumeInterrupt()")
end

function LevelSelect:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("LevelSelect:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(LevelSelect, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function LevelSelect:hash()
    return "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect"
end

function LevelSelect:className()
  return "LevelSelect"
end

function LevelSelect:class()
  return self
end

function LevelSelect:superClass()
  return BaseClass
end

function LevelSelect:__gc()
  --Destroy derived class first
  LevelSelect._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function LevelSelect:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function LevelSelect:_destroy()
  assert(not self.__LevelSelectCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function LevelSelect:_create(init)
  self.__LevelSelectCalledLoad = false
  __ctor(self, init)
end

function LevelSelect:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LevelSelectCalledLoad = true
end

function LevelSelect:unLoad()
  assert(self.__LevelSelectCalledLoad, "Must load before unLevelSelect")

  --unload derived first...
  __unLoad(self)
  self.__LevelSelectCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return LevelSelect
