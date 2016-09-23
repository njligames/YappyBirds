 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local HighScoresSceneEntityState = {}
 HighScoresSceneEntityState.__index = HighScoresSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(HighScoresSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function HighScoresSceneEntityState:className()
 return "HighScoresSceneEntityState"
 end
 
 function HighScoresSceneEntityState:class()
 return self
 end
 
 function HighScoresSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function HighScoresSceneEntityState:destroy()
 print(" HighScoresSceneEntityState:destroy()")
 
 HighScoresSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function HighScoresSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
 print("	HighScoresSceneEntityState:create(init)")
 end
 
 function HighScoresSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function HighScoresSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function HighScoresSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function HighScoresSceneEntityState:load()
 SceneEntityState.load(self)

 print(" HighScoresSceneEntityState:load()")
end

function HighScoresSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

 print(" HighScoresSceneEntityState:unLoad()")
end

function HighScoresSceneEntityState:enter()
 print("	HighScoresSceneEntityState:enter()")
end

function HighScoresSceneEntityState:update(timeStep)
 print("	HighScoresSceneEntityState:update("..timeStep..")")
end

function HighScoresSceneEntityState:exit()
 print("	HighScoresSceneEntityState:exit()")
end

function HighScoresSceneEntityState:onMessage(message)
 print("	HighScoresSceneEntityState:onMessage(message)")
end

function HighScoresSceneEntityState:touchDown(touches)
 print("	HighScoresSceneEntityState:touchDown(touches)")
end

function HighScoresSceneEntityState:touchUp(touches)
 print("	HighScoresSceneEntityState:touchUp(touches)")
end

function HighScoresSceneEntityState:touchMove(touches)
 print("	HighScoresSceneEntityState:touchMove(touches)")
end

function HighScoresSceneEntityState:touchCancelled(touches)
 print("	HighScoresSceneEntityState:touchCancelled(touches)")
end

function HighScoresSceneEntityState:renderHUD()
 print("	HighScoresSceneEntityState:renderHUD()")
end

function HighScoresSceneEntityState:pause()
 print("	HighScoresSceneEntityState:pause()")
end

function HighScoresSceneEntityState:unPause()
 print("	HighScoresSceneEntityState:unPause()")
end

return HighScoresSceneEntityState
