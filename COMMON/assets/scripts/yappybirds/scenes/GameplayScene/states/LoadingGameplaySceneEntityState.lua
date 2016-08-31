 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LoadingGameplaySceneEntityState = {}
 LoadingGameplaySceneEntityState.__index = LoadingGameplaySceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LoadingGameplaySceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function LoadingGameplaySceneEntityState:className()
 return "LoadingGameplaySceneEntityState"
 end
 
 function LoadingGameplaySceneEntityState:class()
 return self
 end
 
 function LoadingGameplaySceneEntityState:superClass()
 return SceneEntityState
 end
 
 function LoadingGameplaySceneEntityState:destroy()
 print(" LoadingGameplaySceneEntityState:destroy()")
 
 LoadingGameplaySceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function LoadingGameplaySceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	LoadingGameplaySceneEntityState:create(init)")
 end
 
 function LoadingGameplaySceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function LoadingGameplaySceneEntityState:__tostring()
 
 return json.stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function LoadingGameplaySceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function LoadingGameplaySceneEntityState:load()
 SceneEntityState.load(self)

 print(" LoadingGameplaySceneEntityState:load()")
end

function LoadingGameplaySceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" LoadingGameplaySceneEntityState:unLoad()")
end

function LoadingGameplaySceneEntityState:enter()
 print("	LoadingGameplaySceneEntityState:enter()")
end

function LoadingGameplaySceneEntityState:update(timeStep)
 print("	LoadingGameplaySceneEntityState:update("..timeStep..")")
end

function LoadingGameplaySceneEntityState:exit()
 print("	LoadingGameplaySceneEntityState:exit()")
end

function LoadingGameplaySceneEntityState:onMessage(message)
 print("	LoadingGameplaySceneEntityState:onMessage(message)")
end

function LoadingGameplaySceneEntityState:touchDown(touches)
 print("	LoadingGameplaySceneEntityState:touchDown(touches)")
end

function LoadingGameplaySceneEntityState:touchUp(touches)
 print("	LoadingGameplaySceneEntityState:touchUp(touches)")
end

function LoadingGameplaySceneEntityState:touchMove(touches)
 print("	LoadingGameplaySceneEntityState:touchMove(touches)")
end

function LoadingGameplaySceneEntityState:touchCancelled(touches)
 print("	LoadingGameplaySceneEntityState:touchCancelled(touches)")
end

function LoadingGameplaySceneEntityState:renderHUD()
 print("	LoadingGameplaySceneEntityState:renderHUD()")
end

function LoadingGameplaySceneEntityState:pause()
 print("	LoadingGameplaySceneEntityState:pause()")
end

function LoadingGameplaySceneEntityState:unPause()
 print("	LoadingGameplaySceneEntityState:unPause()")
end

return LoadingGameplaySceneEntityState
