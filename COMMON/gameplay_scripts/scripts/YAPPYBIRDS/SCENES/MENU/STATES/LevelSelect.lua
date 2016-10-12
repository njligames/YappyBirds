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
  print(self:hash() .. " :enter()")
end

function LevelSelect:update(timeStep)
  BaseClass.update(self, timeStep)
  print(self:hash() .. " :update(timeStep)")
end

function LevelSelect:exit()
  BaseClass.exit(self)
  print(self:hash() .. " :exit()")
end

function LevelSelect:onMessage(message)
  BaseClass.onMessage(self, message)
  print(self:hash() .. " :onMessage(message)")
end

function LevelSelect:renderHUD()
  BaseClass.renderHUD(self)
  print(self:hash() .. " :renderHUD()")
end

function LevelSelect:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print(self:hash() .. " :touchDown(touches)")
end

function LevelSelect:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print(self:hash() .. " :touchUp(touches)")
end

function LevelSelect:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print(self:hash() .. " :touchMove(touches)")
end

function LevelSelect:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print(self:hash() .. " :touchCancelled(touches)")
end

function LevelSelect:pause()
  BaseClass.pause(self)
  print(self:hash() .. " :pause()")
end

function LevelSelect:unPause()
  BaseClass.unPause(self)
  print(self:hash() .. " :unPause()")
end

function LevelSelect:keyboardShow()
  BaseClass.keyboardShow(self)
  print(self:hash() .. " :keyboardShow()")
end

function LevelSelect:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print(self:hash() .. " :keyboardCancel()")
end

function LevelSelect:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print(self:hash() .. " :keyboardReturn(text)")
end

function LevelSelect:willResignActive()
  BaseClass.willResignActive(self)
  print(self:hash() .. " :willResignActive()")
end

function LevelSelect:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print(self:hash() .. " :didBecomeActive()")
end

function LevelSelect:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print(self:hash() .. " :didEnterBackground()")
end

function LevelSelect:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print(self:hash() .. " :willEnterForeground()")
end

function LevelSelect:willTerminate()
  BaseClass.willTerminate(self)
  print(self:hash() .. " :willTerminate()")
end

function LevelSelect:interrupt()
  BaseClass.interrupt(self)
  print(self:hash() .. " :interrupt()")
end

function LevelSelect:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print(self:hash() .. " :resumeInterrupt()")
end

function LevelSelect:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print(self:hash() .. " :receivedMemoryWarning()")
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
