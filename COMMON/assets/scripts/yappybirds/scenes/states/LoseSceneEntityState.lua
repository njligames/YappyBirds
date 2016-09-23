 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LoseSceneEntityState = {}
 LoseSceneEntityState.__index = LoseSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LoseSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function LoseSceneEntityState:className()
 return "LoseSceneEntityState"
 end
 
 function LoseSceneEntityState:class()
 return self
 end
 
 function LoseSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function LoseSceneEntityState:destroy()
 print(" LoseSceneEntityState:destroy()")
 
 LoseSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function LoseSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	LoseSceneEntityState:create(init)")
 end
 
 function LoseSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function LoseSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function LoseSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function LoseSceneEntityState:load()
 SceneEntityState.load(self)

 print(" LoseSceneEntityState:load()")
end

function LoseSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" LoseSceneEntityState:unLoad()")
end

function LoseSceneEntityState:enter()
 print("	LoseSceneEntityState:enter()")
end

function LoseSceneEntityState:update(timeStep)
 print("	LoseSceneEntityState:update("..timeStep..")")
end

function LoseSceneEntityState:exit()
 print("	LoseSceneEntityState:exit()")
end

function LoseSceneEntityState:onMessage(message)
 print("	LoseSceneEntityState:onMessage(message)")
end

function LoseSceneEntityState:touchDown(touches)
 print("	LoseSceneEntityState:touchDown(touches)")
end

function LoseSceneEntityState:touchUp(touches)
 print("	LoseSceneEntityState:touchUp(touches)")
end

function LoseSceneEntityState:touchMove(touches)
 print("	LoseSceneEntityState:touchMove(touches)")
end

function LoseSceneEntityState:touchCancelled(touches)
 print("	LoseSceneEntityState:touchCancelled(touches)")
end

function LoseSceneEntityState:renderHUD()
 print("	LoseSceneEntityState:renderHUD()")
end

function LoseSceneEntityState:pause()
 print("	LoseSceneEntityState:pause()")
end

function LoseSceneEntityState:unPause()
 print("	LoseSceneEntityState:unPause()")
end

return LoseSceneEntityState
