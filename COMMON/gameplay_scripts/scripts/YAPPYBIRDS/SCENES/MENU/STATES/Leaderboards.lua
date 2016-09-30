local BaseClass = require "NJLI.STATEMACHINE.SceneEntityState"

local Leaderboards = {}
Leaderboards.__index = Leaderboards

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

function Leaderboards:enter()
    BaseClass.enter(self)
    print("Leaderboards:enter()")
end

function Leaderboards:update(timeStep)
    BaseClass.update(self, timeStep)
    print("Leaderboards:update(timeStep)")
end

function Leaderboards:exit()
    BaseClass.exit(self)
    print("Leaderboards:exit()")
end

function Leaderboards:onMessage(message)
    BaseClass.onMessage(self, message)
    print("Leaderboards:onMessage(message)")
end

function Leaderboards:renderHUD()
    BaseClass.renderHUD(self)
    print("Leaderboards:renderHUD()")
end

function Leaderboards:touchDown(touches)
    BaseClass.touchDown(self, touches)
    print("Leaderboards:touchDown(touches)")
end

function Leaderboards:touchUp(touches)
    BaseClass.touchUp(self, touches)
    print("Leaderboards:touchUp(touches)")
end

function Leaderboards:touchMove(touches)
    BaseClass.touchMove(self, touches)
    print("Leaderboards:touchMove(touches)")
end

function Leaderboards:touchCancelled(touches)
    BaseClass.touchCancelled(self, touches)
    print("Leaderboards:touchCancelled(touches)")
end

function Leaderboards:pause()
    BaseClass.pause(self)
    print("Leaderboards:pause()")
end

function Leaderboards:unPause()
    BaseClass.unPause(self)
    print("Leaderboards:unPause()")
end

function Leaderboards:keyboardShow()
    BaseClass.keyboardShow(self)
    print("Leaderboards:keyboardShow()")
end

function Leaderboards:keyboardCancel()
    BaseClass.keyboardCancel(self)
    print("Leaderboards:keyboardCancel()")
end

function Leaderboards:keyboardReturn(text)
    BaseClass.keyboardReturn(self, text)
    print("Leaderboards:keyboardReturn(text)")
end

function Leaderboards:willResignActive()
    BaseClass.willResignActive(self)
    print("Leaderboards:willResignActive()")
end

function Leaderboards:didBecomeActive()
    BaseClass.didBecomeActive(self)
    print("Leaderboards:didBecomeActive()")
end

function Leaderboards:didEnterBackground()
    BaseClass.didEnterBackground(self)
    print("Leaderboards:didEnterBackground()")
end

function Leaderboards:willEnterForeground()
    BaseClass.willEnterForeground(self)
    print("Leaderboards:willEnterForeground()")
end

function Leaderboards:willTerminate()
    BaseClass.willTerminate(self)
    print("Leaderboards:willTerminate()")
end

function Leaderboards:interrupt()
    BaseClass.interrupt(self)
    print("Leaderboards:interrupt()")
end

function Leaderboards:resumeInterrupt()
    BaseClass.resumeInterrupt(self)
    print("Leaderboards:resumeInterrupt()")
end

function Leaderboards:receivedMemoryWarning()
    BaseClass.receivedMemoryWarning(self)
    print("Leaderboards:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Leaderboards, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Leaderboards:className()
  return "Leaderboards"
end

function Leaderboards:class()
  return self
end

function Leaderboards:superClass()
  return BaseClass
end

function Leaderboards:__gc()
  --Destroy derived class first
  Leaderboards._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Leaderboards:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Leaderboards:_destroy()
  assert(not self.__LeaderboardsCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Leaderboards:_create(init)
  self.__LeaderboardsCalledLoad = false
  __ctor(self, init)
end

function Leaderboards:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__LeaderboardsCalledLoad = true
end

function Leaderboards:unLoad()
  assert(self.__LeaderboardsCalledLoad, "Must load before unLeaderboards")

  --unload derived first...
  __unLoad(self)
  self.__LeaderboardsCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Leaderboards
