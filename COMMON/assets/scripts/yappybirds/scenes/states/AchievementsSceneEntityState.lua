 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local AchievementsSceneEntityState = {}
 AchievementsSceneEntityState.__index = AchievementsSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(AchievementsSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function AchievementsSceneEntityState:className()
 return "AchievementsSceneEntityState"
 end
 
 function AchievementsSceneEntityState:class()
 return self
 end
 
 function AchievementsSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function AchievementsSceneEntityState:destroy()
 print(" AchievementsSceneEntityState:destroy()")
 
 AchievementsSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function AchievementsSceneEntityState:create(init)
 SceneEntityState.create(self, init)

 
 print("	AchievementsSceneEntityState:create(init)")
 end
 
 function AchievementsSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function AchievementsSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function AchievementsSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function AchievementsSceneEntityState:load()
 SceneEntityState.load(self)

 print(" AchievementsSceneEntityState:load()")
end

function AchievementsSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" AchievementsSceneEntityState:unLoad()")
end

function AchievementsSceneEntityState:enter()
 print("	AchievementsSceneEntityState:enter()")
end

function AchievementsSceneEntityState:update(timeStep)
 print("	AchievementsSceneEntityState:update("..timeStep..")")
end

function AchievementsSceneEntityState:exit()
 print("	AchievementsSceneEntityState:exit()")
end

function AchievementsSceneEntityState:onMessage(message)
 print("	AchievementsSceneEntityState:onMessage(message)")
end

function AchievementsSceneEntityState:touchDown(touches)
 print("	AchievementsSceneEntityState:touchDown(touches)")
end

function AchievementsSceneEntityState:touchUp(touches)
 print("	AchievementsSceneEntityState:touchUp(touches)")
end

function AchievementsSceneEntityState:touchMove(touches)
 print("	AchievementsSceneEntityState:touchMove(touches)")
end

function AchievementsSceneEntityState:touchCancelled(touches)
 print("	AchievementsSceneEntityState:touchCancelled(touches)")
end

function AchievementsSceneEntityState:renderHUD()
 print("	AchievementsSceneEntityState:renderHUD()")
end

function AchievementsSceneEntityState:pause()
 print("	AchievementsSceneEntityState:pause()")
end

function AchievementsSceneEntityState:unPause()
 print("	AchievementsSceneEntityState:unPause()")
end

return AchievementsSceneEntityState
