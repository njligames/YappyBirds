 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LevelselectSceneEntityState = {}
 LevelselectSceneEntityState.__index = LevelselectSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LevelselectSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function LevelselectSceneEntityState:className()
 return "LevelselectSceneEntityState"
 end
 
 function LevelselectSceneEntityState:class()
 return self
 end
 
 function LevelselectSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function LevelselectSceneEntityState:destroy()
-- print(" LevelselectSceneEntityState:destroy()")
 
 LevelselectSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function LevelselectSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
-- print("	LevelselectSceneEntityState:create(init)")
 end
 
 function LevelselectSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function LevelselectSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function LevelselectSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function LevelselectSceneEntityState:load()
 SceneEntityState.load(self)

-- print(" LevelselectSceneEntityState:load()")
end

function LevelselectSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

-- print(" LevelselectSceneEntityState:unLoad()")
end

function LevelselectSceneEntityState:enter()
-- print("	LevelselectSceneEntityState:enter()")
end

function LevelselectSceneEntityState:update(timeStep)
-- print("	LevelselectSceneEntityState:update("..timeStep..")")
end

function LevelselectSceneEntityState:exit()
-- print("	LevelselectSceneEntityState:exit()")
end

function LevelselectSceneEntityState:onMessage(message)
-- print("	LevelselectSceneEntityState:onMessage(message)")
end

function LevelselectSceneEntityState:touchDown(touches)
-- print("	LevelselectSceneEntityState:touchDown(touches)")
end

function LevelselectSceneEntityState:touchUp(touches)
-- print("	LevelselectSceneEntityState:touchUp(touches)")
end

function LevelselectSceneEntityState:touchMove(touches)
-- print("	LevelselectSceneEntityState:touchMove(touches)")
end

function LevelselectSceneEntityState:touchCancelled(touches)
-- print("	LevelselectSceneEntityState:touchCancelled(touches)")
end

function LevelselectSceneEntityState:renderHUD()
-- print("	LevelselectSceneEntityState:renderHUD()")
end

function LevelselectSceneEntityState:pause()
-- print("	LevelselectSceneEntityState:pause()")
end

function LevelselectSceneEntityState:unPause()
-- print("	LevelselectSceneEntityState:unPause()")
end

return LevelselectSceneEntityState
