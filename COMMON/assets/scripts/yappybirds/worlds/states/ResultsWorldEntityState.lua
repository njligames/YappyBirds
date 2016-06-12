 local WorldEntityState = require "njli.statemachine.worldentitystate"
 
 local ResultsWorldEntityState = {}
 ResultsWorldEntityState.__index = ResultsWorldEntityState
 
 local json = require('JSON')
 
 setmetatable(ResultsWorldEntityState, {
 __index = WorldEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 WorldEntityState.create(self, ...)
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
 ResultsWorldEntityState.__gc(self)
 WorldEntityState.destroy(self)
 end
 
 function ResultsWorldEntityState:create(init)
 WorldEntityState.create(self, init)
 
 end
 
 function ResultsWorldEntityState:__gc()
 
 end
 
 function ResultsWorldEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}

function ResultsWorldEntityState:create(init)
 WorldEntityState.create(self, init)
end

function ResultsWorldEntityState:__gc()
 self:unLoad()
end

function ResultsWorldEntityState:__tostring()
 
 return json.encode(self)
end

function ResultsWorldEntityState:isLoaded()
 return WorldEntityState.isLoaded(self)
end

function ResultsWorldEntityState:load()
 print("ResultsWorldEntityState:load()")
 WorldEntityState.load(self)
end

function ResultsWorldEntityState:unLoad()
 print("ResultsWorldEntityState:unLoad()")
 WorldEntityState.unLoad(self)
end

function ResultsWorldEntityState:enter()
end

function ResultsWorldEntityState:update(timeStep)
end

function ResultsWorldEntityState:exit() 
end

function ResultsWorldEntityState:onMessage(message) 
end

function ResultsWorldEntityState:touchDown(touches) 
end

function ResultsWorldEntityState:touchUp(touches) 
end

function ResultsWorldEntityState:touchMove(touches) 
end

function ResultsWorldEntityState:touchCancelled(touches) 
end

function ResultsWorldEntityState:renderHUD() 
end

function ResultsWorldEntityState:keyboardShow() 
end

function ResultsWorldEntityState:keyboardCancel() 
end

function ResultsWorldEntityState:keyboardReturn(text) 
end

function ResultsWorldEntityState:receivedMemoryWarning() 
end

function ResultsWorldEntityState:pause() 
end

function ResultsWorldEntityState:unPause() 
end

return ResultsWorldEntityState
