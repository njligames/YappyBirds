 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LoseResultSceneEntityState = {}
 LoseResultSceneEntityState.__index = LoseResultSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LoseResultSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function LoseResultSceneEntityState:className()
 return "LoseResultSceneEntityState"
 end
 
 function LoseResultSceneEntityState:class()
 return self
 end
 
 function LoseResultSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function LoseResultSceneEntityState:destroy()
 print(" LoseResultSceneEntityState:destroy()")
 
 LoseResultSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function LoseResultSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	LoseResultSceneEntityState:create(init)")
 end
 
 function LoseResultSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function LoseResultSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function LoseResultSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function LoseResultSceneEntityState:load()
 SceneEntityState.load(self)

 print(" LoseResultSceneEntityState:load()")
end

function LoseResultSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" LoseResultSceneEntityState:unLoad()")
end

function LoseResultSceneEntityState:enter()
 print("	LoseResultSceneEntityState:enter()")
end

function LoseResultSceneEntityState:update(timeStep)
 print("	LoseResultSceneEntityState:update("..timeStep..")")
end

function LoseResultSceneEntityState:exit()
 print("	LoseResultSceneEntityState:exit()")
end

function LoseResultSceneEntityState:onMessage(message)
 print("	LoseResultSceneEntityState:onMessage(message)")
end

function LoseResultSceneEntityState:touchDown(touches)
 print("	LoseResultSceneEntityState:touchDown(touches)")
end

function LoseResultSceneEntityState:touchUp(touches)
 print("	LoseResultSceneEntityState:touchUp(touches)")
end

function LoseResultSceneEntityState:touchMove(touches)
 print("	LoseResultSceneEntityState:touchMove(touches)")
end

function LoseResultSceneEntityState:touchCancelled(touches)
 print("	LoseResultSceneEntityState:touchCancelled(touches)")
end

function LoseResultSceneEntityState:renderHUD()
 print("	LoseResultSceneEntityState:renderHUD()")
end

function LoseResultSceneEntityState:pause()
 print("	LoseResultSceneEntityState:pause()")
end

function LoseResultSceneEntityState:unPause()
 print("	LoseResultSceneEntityState:unPause()")
end

return LoseResultSceneEntityState
