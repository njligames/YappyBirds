 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local WinResultSceneEntityState = {}
 WinResultSceneEntityState.__index = WinResultSceneEntityState
 
 local json = require('json')
 
 setmetatable(WinResultSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function WinResultSceneEntityState:className()
 return "WinResultSceneEntityState"
 end
 
 function WinResultSceneEntityState:class()
 return self
 end
 
 function WinResultSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function WinResultSceneEntityState:destroy()
 print(" WinResultSceneEntityState:destroy()")

 WinResultSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function WinResultSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	WinResultSceneEntityState:create(init)")
 end
 
 function WinResultSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function WinResultSceneEntityState:__tostring()
 
 return json:stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function WinResultSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function WinResultSceneEntityState:load()
 SceneEntityState.load(self)

 print(" WinResultSceneEntityState:load()")
end

function WinResultSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" WinResultSceneEntityState:unLoad()")
end

function WinResultSceneEntityState:enter()
 print("	WinResultSceneEntityState:enter()")
end

function WinResultSceneEntityState:update(timeStep)
 print("	WinResultSceneEntityState:update("..timeStep..")")
end

function WinResultSceneEntityState:exit()
 print("	WinResultSceneEntityState:exit()")
end

function WinResultSceneEntityState:onMessage(message)
 print("	WinResultSceneEntityState:onMessage(message)")
end

function WinResultSceneEntityState:touchDown(touches)
 print("	WinResultSceneEntityState:touchDown(touches)")
end

function WinResultSceneEntityState:touchUp(touches)
 print("	WinResultSceneEntityState:touchUp(touches)")
end

function WinResultSceneEntityState:touchMove(touches)
 print("	WinResultSceneEntityState:touchMove(touches)")
end

function WinResultSceneEntityState:touchCancelled(touches)
 print("	WinResultSceneEntityState:touchCancelled(touches)")
end

function WinResultSceneEntityState:renderHUD()
 print("	WinResultSceneEntityState:renderHUD()")
end

function WinResultSceneEntityState:pause()
 print("	WinResultSceneEntityState:pause()")
end

function WinResultSceneEntityState:unPause()
 print("	WinResultSceneEntityState:unPause()")
end

return WinResultSceneEntityState
