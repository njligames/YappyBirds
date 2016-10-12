local BaseClass = require "NJLI.STATEMACHINE.SceneEntity"

local Menu = {}
Menu.__index = Menu

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

function Menu:enter()
  BaseClass.enter(self)
  print(self:hash() .. " :enter()")
end

function Menu:update(timeStep)
  BaseClass.update(self, timeStep)
  print(self:hash() .. " :update("..timeStep..")")
end

function Menu:exit()
  BaseClass.exit(self)
  print(self:hash() .. " :exit()")
end

function Menu:onMessage(message)
  BaseClass.onMessage(self, message)
  print(self:hash() .. " :onMessage("..tostring(message)")")
end

function Menu:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print(self:hash() .. " :touchDown("..tostring(touches) .. ")")
end

function Menu:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print(self:hash() .. " :touchUp("..tostring(touches) ..")")
end

function Menu:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print(self:hash() .. " :touchMove("..tostring(touches) ..")")
end

function Menu:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print(self:hash() .. " :touchCancelled("..tostring(touches) ..")")
end

function Menu:renderHUD()
  BaseClass.renderHUD(self)
  --print(self:hash() .. " :renderHUD()")
end

function Menu:pause()
  BaseClass.pause(self)
  print(self:hash() .. " :pause()")
end

function Menu:unPause()
  BaseClass.unPause(self)
  print(self:hash() .. " :unPause()")
end

function Menu:willResignActive()
  BaseClass.willResignActive(self)
  print(self:hash() .. " :willResignActive()")
end

function Menu:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print(self:hash() .. " :didBecomeActive()")
end

function Menu:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print(self:hash() .. " :didEnterBackground()")
end

function Menu:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print(self:hash() .. " :willEnterForeground()")
end

function Menu:willTerminate()
  BaseClass.willTerminate(self)
  print(self:hash() .. " :willTerminate()")
end

function Menu:interrupt()
  BaseClass.interrupt(self)
  print(self:hash() .. " :interrupt()")
end

function Menu:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print(self:hash() .. " :resumeInterrupt()")
end

function Menu:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print(self:hash() .. " :receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Menu, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Menu:hash()
    return "YAPPYBIRDS.SCENES.MENU.Menu"
end

function Menu:className()
  return "Menu"
end

function Menu:class()
  return self
end

function Menu:superClass()
  return BaseClass
end

function Menu:__gc()
  --Destroy derived class first
  Menu._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Menu:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Menu:_destroy()
  assert(not self.__MenuCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Menu:_create(init)
  self.__MenuCalledLoad = false
  __ctor(self, init)
end

function Menu:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__MenuCalledLoad = true
end

function Menu:unLoad()
  assert(self.__MenuCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__MenuCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Menu
