 local WorldEntityState = require "njli.statemachine.worldentitystate"
 
 local GameplayWorldEntityState = {}
 GameplayWorldEntityState.__index = GameplayWorldEntityState
 
 local json = require('JSON')
 
 setmetatable(GameplayWorldEntityState, {
 __index = WorldEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 WorldEntityState.create(self, ...)
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
 GameplayWorldEntityState.__gc(self)
 WorldEntityState.destroy(self)
 end
 
 function GameplayWorldEntityState:create(init)
 WorldEntityState.create(self, init)
 
 end
 
 function GameplayWorldEntityState:__gc()
 
 end
 
 function GameplayWorldEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}

function GameplayWorldEntityState:create(init)
 WorldEntityState.create(self, init)
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
 print("GameplayWorldEntityState:load()")
 WorldEntityState.load(self)
end

function GameplayWorldEntityState:unLoad()
 print("GameplayWorldEntityState:unLoad()")
 WorldEntityState.unLoad(self)
end

function GameplayWorldEntityState:enter()
end

function GameplayWorldEntityState:update(timeStep)
end

function GameplayWorldEntityState:exit() 
end

function GameplayWorldEntityState:onMessage(message) 
end

function GameplayWorldEntityState:touchDown(touches) 
end

function GameplayWorldEntityState:touchUp(touches) 
end

function GameplayWorldEntityState:touchMove(touches) 
end

function GameplayWorldEntityState:touchCancelled(touches) 
end

function GameplayWorldEntityState:renderHUD() 
end

function GameplayWorldEntityState:keyboardShow() 
end

function GameplayWorldEntityState:keyboardCancel() 
end

function GameplayWorldEntityState:keyboardReturn(text) 
end

function GameplayWorldEntityState:receivedMemoryWarning() 
end

function GameplayWorldEntityState:pause() 
end

function GameplayWorldEntityState:unPause() 
end

return GameplayWorldEntityState
