 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local PauseSceneEntityState = {}
 PauseSceneEntityState.__index = PauseSceneEntityState
 
 local json = require('json')
 
 setmetatable(PauseSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function PauseSceneEntityState:className()
 return "PauseSceneEntityState"
 end
 
 function PauseSceneEntityState:class()
 return self
 end
 
 function PauseSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function PauseSceneEntityState:destroy()
 print(" PauseSceneEntityState:destroy()")
 
 PauseSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function PauseSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	PauseSceneEntityState:create(init)")
 end
 
 function PauseSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function PauseSceneEntityState:__tostring()
 
 return json:stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function PauseSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function PauseSceneEntityState:load()
 SceneEntityState.load(self)

 print(" PauseSceneEntityState:load()")
end

function PauseSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" PauseSceneEntityState:unLoad()")
end

function PauseSceneEntityState:enter()
 print("	PauseSceneEntityState:enter()")
end

function PauseSceneEntityState:update(timeStep)
 print("	PauseSceneEntityState:update("..timeStep..")")
end

function PauseSceneEntityState:exit()
 print("	PauseSceneEntityState:exit()")
end

function PauseSceneEntityState:onMessage(message)
 print("	PauseSceneEntityState:onMessage(message)")
end

function PauseSceneEntityState:touchDown(touches)
 print("	PauseSceneEntityState:touchDown(touches)")
end

function PauseSceneEntityState:touchUp(touches)
 print("	PauseSceneEntityState:touchUp(touches)")
end

function PauseSceneEntityState:touchMove(touches)
 print("	PauseSceneEntityState:touchMove(touches)")
end

function PauseSceneEntityState:touchCancelled(touches)
 print("	PauseSceneEntityState:touchCancelled(touches)")
end

function PauseSceneEntityState:renderHUD()
 print("	PauseSceneEntityState:renderHUD()")
end

function PauseSceneEntityState:pause()
 print("	PauseSceneEntityState:pause()")
end

function PauseSceneEntityState:unPause()
 print("	PauseSceneEntityState:unPause()")
end

return PauseSceneEntityState
