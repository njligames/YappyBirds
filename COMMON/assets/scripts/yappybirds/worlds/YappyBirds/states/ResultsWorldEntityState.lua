local WorldEntityState = require "njli.statemachine.worldentitystate"

local ResultsWorldEntityState = {}
ResultsWorldEntityState.__index = ResultsWorldEntityState

local json = require('json')

setmetatable(ResultsWorldEntityState, {
    __index = WorldEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function ResultsWorldEntityState:className()
  return "ResultsWorldEntityState"
end

function ResultsWorldEntityState:class()
  return self
end

function ResultsWorldEntityState:superClass()
  return WorldEntityState
end

function ResultsWorldEntityState:destroy()
--  print(" ResultsWorldEntityState:destroy()")

  ResultsWorldEntityState.__gc(self)
  WorldEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function ResultsWorldEntityState:create(init)
  WorldEntityState.create(self, init)

--  print(" ResultsWorldEntityState:create(init)")
end

function ResultsWorldEntityState:__gc()
  self:unLoad()
end

function ResultsWorldEntityState:__tostring()

  return json:stringify(self)
end

function ResultsWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function ResultsWorldEntityState:load()
  WorldEntityState.load(self)

--  print(" ResultsWorldEntityState:load()")
end

function ResultsWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)

--  print(" ResultsWorldEntityState:unLoad()")
end

function ResultsWorldEntityState:enter()
--  print(" ResultsWorldEntityState:enter()")
end

function ResultsWorldEntityState:update(timeStep)
--  print(" ResultsWorldEntityState:update("..timeStep..")")
end

function ResultsWorldEntityState:exit()
--  print(" ResultsWorldEntityState:exit()")
end

function ResultsWorldEntityState:onMessage(message)
--  print(" ResultsWorldEntityState:onMessage()")
end

function ResultsWorldEntityState:touchDown(touches)
--  print(" ResultsWorldEntityState:touchDown()")
end

function ResultsWorldEntityState:touchUp(touches)
--  print(" ResultsWorldEntityState:touchUp()")
end

function ResultsWorldEntityState:touchMove(touches)
--  print(" ResultsWorldEntityState:touchMove()")
end

function ResultsWorldEntityState:touchCancelled(touches)
--  print(" ResultsWorldEntityState:touchCancelled()")
end

function ResultsWorldEntityState:renderHUD()
--  print(" ResultsWorldEntityState:renderHUD()")
end

function ResultsWorldEntityState:keyboardShow()
--  print(" ResultsWorldEntityState:keyboardShow()")
end

function ResultsWorldEntityState:keyboardCancel()
--  print(" ResultsWorldEntityState:keyboardCancel()")
end

function ResultsWorldEntityState:keyboardReturn(text)
--  print(" ResultsWorldEntityState:keyboardReturn()")
end

function ResultsWorldEntityState:receivedMemoryWarning()
--  print(" ResultsWorldEntityState:receivedMemoryWarning()")
end

function ResultsWorldEntityState:pause()
--  print(" ResultsWorldEntityState:pause()")
end

function ResultsWorldEntityState:unPause()
--  print(" ResultsWorldEntityState:unPause()")
end

return ResultsWorldEntityState
