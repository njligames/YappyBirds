local BaseClass = require "NJLI.STATEMACHINE.SceneEntity"

local Results = {}
Results.__index = Results

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

function Results:enter()
  BaseClass.enter(self)
  print("Results:enter()")
end

function Results:update(timeStep)
  BaseClass.update(self, timeStep)
  print("Results:update("..timeStep..")")
end

function Results:exit()
  BaseClass.exit(self)
  print("Results:exit()")
end

function Results:onMessage(message)
  BaseClass.onMessage(self, message)
  print("Results:onMessage("..tostring(message)")")
end

function Results:touchDown(touches)
  BaseClass.touchDown(self, touches)
  print("Results:touchDown("..tostring(touches) .. ")")
end

function Results:touchUp(touches)
  BaseClass.touchUp(self, touches)
  print("Results:touchUp("..tostring(touches) ..")")
end

function Results:touchMove(touches)
  BaseClass.touchMove(self, touches)
  print("Results:touchMove("..tostring(touches) ..")")
end

function Results:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
  print("Results:touchCancelled("..tostring(touches) ..")")
end

function Results:renderHUD()
  BaseClass.renderHUD(self)
  print("Results:renderHUD()")
end

function Results:pause()
  BaseClass.pause(self)
  print("Results:pause()")
end

function Results:unPause()
  BaseClass.unPause(self)
  print("Results:unPause()")
end

function Results:willResignActive()
  BaseClass.willResignActive(self)
  print("Results:willResignActive()")
end

function Results:didBecomeActive()
  BaseClass.didBecomeActive(self)
  print("Results:didBecomeActive()")
end

function Results:didEnterBackground()
  BaseClass.didEnterBackground(self)
  print("Results:didEnterBackground()")
end

function Results:willEnterForeground()
  BaseClass.willEnterForeground(self)
  print("Results:willEnterForeground()")
end

function Results:willTerminate()
  BaseClass.willTerminate(self)
  print("Results:willTerminate()")
end

function Results:interrupt()
  BaseClass.interrupt(self)
  print("Results:interrupt()")
end

function Results:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
  print("Results:resumeInterrupt()")
end

function Results:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
  print("Results:receivedMemoryWarning()")
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Results, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Results:className()
  return "Results"
end

function Results:class()
  return self
end

function Results:superClass()
  return BaseClass
end

function Results:__gc()
  --Destroy derived class first
  Results._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Results:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Results:_destroy()
  assert(not self.__ResultsCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Results:_create(init)
  self.__ResultsCalledLoad = false
  __ctor(self, init)
end

function Results:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__ResultsCalledLoad = true
end

function Results:unLoad()
  assert(self.__ResultsCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__ResultsCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Results
