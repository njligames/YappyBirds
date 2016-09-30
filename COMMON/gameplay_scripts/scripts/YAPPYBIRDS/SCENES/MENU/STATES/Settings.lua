local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Settings = {}
Settings.__index = Settings

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

function Settings:enter()
    BaseClass.enter(self)
    print("Settings:enter()")
end

function Settings:update(timeStep)
    BaseClass.update(self, timeStep)
    print("Settings:update(timeStep)")
end

function Settings:exit()
    BaseClass.exit(self)
    print("Settings:exit()")
end

function Settings:onMessage(message)
    BaseClass.onMessage(self, message)
    print("Settings:onMessage(message)")
end

function Settings:renderHUD()
    BaseClass.renderHUD(self)
    print("Settings:renderHUD()")
end

function Settings:touchDown(touches)
    BaseClass.touchDown(self, touches)
    print("Settings:touchDown(touches)")
end

function Settings:touchUp(touches)
    BaseClass.touchUp(self, touches)
    print("Settings:touchUp(touches)")
end

function Settings:touchMove(touches)
    BaseClass.touchMove(self, touches)
    print("Settings:touchMove(touches)")
end

function Settings:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
    print("Settings:touchCancelled(touches)")
end

function Settings:pause()
    BaseClass.pause(self)
    print("Settings:pause()")
end

function Settings:unPause()
    BaseClass.unPause(self)
    print("Settings:unPause()")
end

function Settings:keyboardShow()
    BaseClass.keyboardShow(self)
    print("Settings:keyboardShow()")
end

function Settings:keyboardCancel()
    BaseClass.keyboardCancel(self)
    print("Settings:keyboardCancel()")
end

function Settings:keyboardReturn(text)
    BaseClass.keyboardReturn(self, text)
    print("Settings:keyboardReturn(text)")
end

function Settings:willResignActive()
    BaseClass.willResignActive(self)
    print("Settings:willResignActive()")
end

function Settings:didBecomeActive()
    BaseClass.didBecomeActive(self)
    print("Settings:didBecomeActive()")
end

function Settings:didEnterBackground()
    BaseClass.didEnterBackground(self)
    print("Settings:didEnterBackground()")
end

function Settings:willEnterForeground()
    BaseClass.willEnterForeground(self)
    print("Settings:willEnterForeground()")
end

function Settings:willTerminate()
    BaseClass.willTerminate(self)
    print("Settings:willTerminate()")
end

function Settings:interrupt()
    BaseClass.interrupt(self)
    print("Settings:interrupt()")
end

function Settings:resumeInterrupt()
    BaseClass.resumeInterrupt(self)
    print("Settings:resumeInterrupt()")
end

function Settings:receivedMemoryWarning()
    BaseClass.receivedMemoryWarning(self)
    print("Settings:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Settings, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Settings:className()
  return "Settings"
end

function Settings:class()
  return self
end

function Settings:superClass()
  return BaseClass
end

function Settings:__gc()
  --Destroy derived class first
  Settings._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Settings:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Settings:_destroy()
  assert(not self.__SettingsCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Settings:_create(init)
  self.__SettingsCalledLoad = false
  __ctor(self, init)
end

function Settings:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__SettingsCalledLoad = true
end

function Settings:unLoad()
  assert(self.__SettingsCalledLoad, "Must load before unSettings")

  --unload derived first...
  __unLoad(self)
  self.__SettingsCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Settings
