 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local PlayingSceneEntityState = {}
 PlayingSceneEntityState.__index = PlayingSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(PlayingSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function PlayingSceneEntityState:className()
 return "PlayingSceneEntityState"
 end
 
 function PlayingSceneEntityState:class()
 return self
 end
 
 function PlayingSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function PlayingSceneEntityState:destroy()
 print(" PlayingSceneEntityState:destroy()")
 
 PlayingSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function PlayingSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	PlayingSceneEntityState:create(init)")
 end
 
 function PlayingSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function PlayingSceneEntityState:__tostring()
 
 return json.stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function PlayingSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function PlayingSceneEntityState:load()
 SceneEntityState.load(self)

 print(" PlayingSceneEntityState:load()")
end

function PlayingSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" PlayingSceneEntityState:unLoad()")
end

function PlayingSceneEntityState:enter()
 print("	PlayingSceneEntityState:enter()")
end

function PlayingSceneEntityState:update(timeStep)
 print("	PlayingSceneEntityState:update("..timeStep..")")
end

function PlayingSceneEntityState:exit()
 print("	PlayingSceneEntityState:exit()")
end

function PlayingSceneEntityState:onMessage(message)
 print("	PlayingSceneEntityState:onMessage(message)")
end

function PlayingSceneEntityState:touchDown(touches)
 print("	PlayingSceneEntityState:touchDown(touches)")
end

function PlayingSceneEntityState:touchUp(touches)
 print("	PlayingSceneEntityState:touchUp(touches)")
end

function PlayingSceneEntityState:touchMove(touches)
 print("	PlayingSceneEntityState:touchMove(touches)")
end

function PlayingSceneEntityState:touchCancelled(touches)
 print("	PlayingSceneEntityState:touchCancelled(touches)")
end

function PlayingSceneEntityState:renderHUD()
 print("	PlayingSceneEntityState:renderHUD()")
end

function PlayingSceneEntityState:pause()
 print("	PlayingSceneEntityState:pause()")
end

function PlayingSceneEntityState:unPause()
 print("	PlayingSceneEntityState:unPause()")
end

return PlayingSceneEntityState
