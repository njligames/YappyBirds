local WorldEntityState = require "njli.statemachine.worldentitystate"

local GameplayWorldEntityState = {}
GameplayWorldEntityState.__index = GameplayWorldEntityState

local json = require('JSON')

setmetatable(GameplayWorldEntityState, {
    __index = WorldEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function GameplayWorldEntityState:className()
  return "GameplayWorldEntityState"
end

function GameplayWorldEntityState:class()
  return self
end

function GameplayWorldEntityState:superClass()
  return WorldEntityState
end

function GameplayWorldEntityState:destroy()
--  print(" GameplayWorldEntityState:destroy()")

  GameplayWorldEntityState.__gc(self)
  WorldEntityState.destroy(self)
end

local init =
{
  name = "name",
  entityOwner = nil
}

function GameplayWorldEntityState:create(init)
  WorldEntityState.create(self, init)

--  print(" GameplayWorldEntityState:create(init)")
end

function GameplayWorldEntityState:__gc()
  self:unLoad()

end

function GameplayWorldEntityState:__tostring()

  return json.encode(self)
end

function GameplayWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function GameplayWorldEntityState:load()
  WorldEntityState.load(self)

--  print(" GameplayWorldEntityState:load()")
end

function GameplayWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)

--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:enter()
--  print(" GameplayWorldEntityState:enter()")
end

function GameplayWorldEntityState:update(timeStep)
--  print(" GameplayWorldEntityState:update()")
end

function GameplayWorldEntityState:exit()
--  print(" GameplayWorldEntityState:exit()")
end

function GameplayWorldEntityState:onMessage(message)
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:touchDown(touches)
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:touchUp(touches)
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:touchMove(touches)
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:touchCancelled(touches)
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:renderHUD()
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:keyboardShow()
--  print(" GameplayWorldEntityState:unLoad()")
end

function GameplayWorldEntityState:keyboardCancel()
--  print(" GameplayWorldEntityState:keyboardCancel()")
end

function GameplayWorldEntityState:keyboardReturn(text)
--  print(" GameplayWorldEntityState:keyboardReturn(text)")
end

function GameplayWorldEntityState:receivedMemoryWarning()
--  print(" GameplayWorldEntityState:receivedMemoryWarning()")
end

function GameplayWorldEntityState:pause()
--  print(" GameplayWorldEntityState:pause()")
end

function GameplayWorldEntityState:unPause()
--  print(" GameplayWorldEntityState:unPause()")
end

return GameplayWorldEntityState
