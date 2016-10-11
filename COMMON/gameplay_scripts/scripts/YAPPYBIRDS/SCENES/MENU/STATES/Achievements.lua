local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Achievements = {}
Achievements.__index = Achievements

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

function Achievements:enter()
  BaseClass.enter(self)
  print("Achievements:enter()")
end

function Achievements:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Achievements:update(timeStep)")
end

function Achievements:exit()
  BaseClass.exit(self)
  print("Achievements:exit()")
end

function Achievements:onMessage(message)
  BaseClass.onMessage(self, message)
  print("Achievements:onMessage(message)")
end

function Achievements:renderHUD()
  BaseClass.renderHUD(self)
  print("Achievements:renderHUD()")
end

function Achievements:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("Achievements:touchDown(touches)")
end

function Achievements:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("Achievements:touchUp(touches)")
end

function Achievements:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("Achievements:touchMove(touches)")
end

function Achievements:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("Achievements:touchCancelled(touches)")
end

function Achievements:pause()
  BaseClass.pause(self)
  print("Achievements:pause()")
end

function Achievements:unPause()
  BaseClass.unPause(self)
  print("Achievements:unPause()")
end

function Achievements:keyboardShow()
  BaseClass.keyboardShow(self)
  print("Achievements:keyboardShow()")
end

function Achievements:keyboardCancel()
  BaseClass.keyboardCancel(self)
  print("Achievements:keyboardCancel()")
end

function Achievements:keyboardReturn(text)
  BaseClass.keyboardReturn(self, text)
  print("Achievements:keyboardReturn(text)")
end

function Achievements:willResignActive()
  BaseClass.willResignActive(self)
  print("Achievements:willResignActive()")
end

function Achievements:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("Achievements:didBecomeActive()")
end

function Achievements:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("Achievements:didEnterBackground()")
end

function Achievements:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("Achievements:willEnterForeground()")
end

function Achievements:willTerminate()
  BaseClass.willTerminate(self)
  print("Achievements:willTerminate()")
end

function Achievements:interrupt()
  BaseClass.interrupt(self)
  print("Achievements:interrupt()")
end

function Achievements:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("Achievements:resumeInterrupt()")
end

function Achievements:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("Achievements:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Achievements, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Achievements:hash()
    return "YAPPYBIRDS.SCENES.MENU.STATES.Achievements"
end

function Achievements:className()
  return "Achievements"
end

function Achievements:class()
  return self
end

function Achievements:superClass()
  return BaseClass
end

function Achievements:__gc()
  --Destroy derived class first
  Achievements._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Achievements:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Achievements:_destroy()
  assert(not self.__AchievementsCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Achievements:_create(init)
  self.__AchievementsCalledLoad = false
  __ctor(self, init)
end

function Achievements:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__AchievementsCalledLoad = true
end

function Achievements:unLoad()
  assert(self.__AchievementsCalledLoad, "Must load before unAchievements")

  --unload derived first...
  __unLoad(self)
  self.__AchievementsCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Achievements
