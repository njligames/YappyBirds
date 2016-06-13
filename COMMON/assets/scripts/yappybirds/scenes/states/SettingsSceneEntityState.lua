 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local SettingsSceneEntityState = {}
 SettingsSceneEntityState.__index = SettingsSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(SettingsSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function SettingsSceneEntityState:className()
 return "SettingsSceneEntityState"
 end
 
 function SettingsSceneEntityState:class()
 return self
 end
 
 function SettingsSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function SettingsSceneEntityState:destroy()
 print(" SettingsSceneEntityState:destroy()")
 SettingsSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function SettingsSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	SettingsSceneEntityState:create(init)")
 end
 
 function SettingsSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function SettingsSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function SettingsSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function SettingsSceneEntityState:load()
 SceneEntityState.load(self)

 print(" SettingsSceneEntityState:load()")
end

function SettingsSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" SettingsSceneEntityState:unLoad()")
end

function SettingsSceneEntityState:enter()
 print("	SettingsSceneEntityState:enter()")
end

function SettingsSceneEntityState:update(timeStep)
 print("	SettingsSceneEntityState:update("..timeStep..")")
end

function SettingsSceneEntityState:exit()
 print("	SettingsSceneEntityState:exit()")
end

function SettingsSceneEntityState:onMessage(message)
 print("	SettingsSceneEntityState:onMessage(message)")
end

function SettingsSceneEntityState:touchDown(touches)
 print("	SettingsSceneEntityState:touchDown(touches)")
end

function SettingsSceneEntityState:touchUp(touches)
 print("	SettingsSceneEntityState:touchUp(touches)")
end

function SettingsSceneEntityState:touchMove(touches)
 print("	SettingsSceneEntityState:touchMove(touches)")
end

function SettingsSceneEntityState:touchCancelled(touches)
 print("	SettingsSceneEntityState:touchCancelled(touches)")
end

function SettingsSceneEntityState:renderHUD()
 print("	SettingsSceneEntityState:renderHUD()")
end

function SettingsSceneEntityState:pause()
 print("	SettingsSceneEntityState:pause()")
end

function SettingsSceneEntityState:unPause()
 print("	SettingsSceneEntityState:unPause()")
end

return SettingsSceneEntityState
