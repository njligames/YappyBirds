local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local MainMenu = {}
MainMenu.__index = MainMenu

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

function MainMenu:enter()
  BaseClass.enter(self)
  print("MainMenu:enter()")
end

function MainMenu:update(timeStep)
  BaseClass.update(self, timeStep)
  print("MainMenu:update(timeStep)")
end

function MainMenu:exit()
  BaseClass.exit(self)
  print("MainMenu:exit()")
end

function MainMenu:onMessage(message)
  BaseClass.onMessage(self, message)
  print("MainMenu:onMessage(message)")
end

function MainMenu:renderHUD()
  BaseClass.renderHUD(self)
  print("MainMenu:renderHUD()")
end

function MainMenu:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("MainMenu:touchDown(touches)")
end

function MainMenu:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("MainMenu:touchUp(touches)")
end

function MainMenu:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("MainMenu:touchMove(touches)")
end

function MainMenu:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("MainMenu:touchCancelled(touches)")
end

function MainMenu:pause()
  BaseClass.pause(self)
  print("MainMenu:pause()")
end

function MainMenu:unPause()
  BaseClass.unPause(self)
  print("MainMenu:unPause()")
end

function MainMenu:keyboardShow()
  BaseClass.keyboardShow(self)
  print("MainMenu:keyboardShow()")
end

function MainMenu:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("MainMenu:keyboardCancel()")
end

function MainMenu:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("MainMenu:keyboardReturn(text)")
end

function MainMenu:willResignActive()
  BaseClass.willResignActive(self)
  print("MainMenu:willResignActive()")
end

function MainMenu:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("MainMenu:didBecomeActive()")
end

function MainMenu:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("MainMenu:didEnterBackground()")
end

function MainMenu:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("MainMenu:willEnterForeground()")
end

function MainMenu:willTerminate()
  BaseClass.willTerminate(self)
  print("MainMenu:willTerminate()")
end

function MainMenu:interrupt()
  BaseClass.interrupt(self)
  print("MainMenu:interrupt()")
end

function MainMenu:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("MainMenu:resumeInterrupt()")
end

function MainMenu:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("MainMenu:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(MainMenu, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function MainMenu:hash()
    return "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu"
end

function MainMenu:className()
  return "MainMenu"
end

function MainMenu:class()
  return self
end

function MainMenu:superClass()
  return BaseClass
end

function MainMenu:__gc()
  --Destroy derived class first
  MainMenu._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function MainMenu:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function MainMenu:_destroy()
  assert(not self.__MainMenuCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function MainMenu:_create(init)
  self.__MainMenuCalledLoad = false
  __ctor(self, init)
end

function MainMenu:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__MainMenuCalledLoad = true
end

function MainMenu:unLoad()
  assert(self.__MainMenuCalledLoad, "Must load before unMainMenu")

  --unload derived first...
  __unLoad(self)
  self.__MainMenuCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return MainMenu
