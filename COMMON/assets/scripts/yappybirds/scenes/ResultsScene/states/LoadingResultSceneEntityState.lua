 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LoadingResultSceneEntityState = {}
 LoadingResultSceneEntityState.__index = LoadingResultSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LoadingResultSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function LoadingResultSceneEntityState:className()
 return "LoadingResultSceneEntityState"
 end
 
 function LoadingResultSceneEntityState:class()
 return self
 end
 
 function LoadingResultSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function LoadingResultSceneEntityState:destroy()
 print(" LoadingResultSceneEntityState:destroy()")
 
 LoadingResultSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function LoadingResultSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	LoadingResultSceneEntityState:create(init)")
 end
 
 function LoadingResultSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function LoadingResultSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function LoadingResultSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function LoadingResultSceneEntityState:load()
 SceneEntityState.load(self)

 print(" LoadingResultSceneEntityState:load()")
end

function LoadingResultSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" LoadingResultSceneEntityState:unLoad()")
end

function LoadingResultSceneEntityState:enter()
 print("	LoadingResultSceneEntityState:enter()")
end

function LoadingResultSceneEntityState:update(timeStep)
 print("	LoadingResultSceneEntityState:update("..timeStep..")")
end

function LoadingResultSceneEntityState:exit()
 print("	LoadingResultSceneEntityState:exit()")
end

function LoadingResultSceneEntityState:onMessage(message)
 print("	LoadingResultSceneEntityState:onMessage(message)")
end

function LoadingResultSceneEntityState:touchDown(touches)
 print("	LoadingResultSceneEntityState:touchDown(touches)")
end

function LoadingResultSceneEntityState:touchUp(touches)
 print("	LoadingResultSceneEntityState:touchUp(touches)")
end

function LoadingResultSceneEntityState:touchMove(touches)
 print("	LoadingResultSceneEntityState:touchMove(touches)")
end

function LoadingResultSceneEntityState:touchCancelled(touches)
 print("	LoadingResultSceneEntityState:touchCancelled(touches)")
end

function LoadingResultSceneEntityState:renderHUD()
 print("	LoadingResultSceneEntityState:renderHUD()")
end

function LoadingResultSceneEntityState:pause()
 print("	LoadingResultSceneEntityState:pause()")
end

function LoadingResultSceneEntityState:unPause()
 print("	LoadingResultSceneEntityState:unPause()")
end

return LoadingResultSceneEntityState
