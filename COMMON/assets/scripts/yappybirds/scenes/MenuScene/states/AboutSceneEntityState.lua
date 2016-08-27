 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local AboutSceneEntityState = {}
 AboutSceneEntityState.__index = AboutSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(AboutSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function AboutSceneEntityState:className()
 return "AboutSceneEntityState"
 end
 
 function AboutSceneEntityState:class()
 return self
 end
 
 function AboutSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function AboutSceneEntityState:destroy()
-- print(" AboutSceneEntityState:destroy()")
 
 AboutSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function AboutSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
-- print("	AboutSceneEntityState:create(init)")
 end
 
 function AboutSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function AboutSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function AboutSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function AboutSceneEntityState:load()
 SceneEntityState.load(self)

-- print(" AboutSceneEntityState:load()")
end

function AboutSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

-- print(" AboutSceneEntityState:unLoad()")
end

function AboutSceneEntityState:enter()
-- print("	AboutSceneEntityState:enter()")
end

function AboutSceneEntityState:update(timeStep)
-- print("	AboutSceneEntityState:update("..timeStep..")")
end

function AboutSceneEntityState:exit()
-- print("	AboutSceneEntityState:exit()")
end

function AboutSceneEntityState:onMessage(message)
-- print("	AboutSceneEntityState:onMessage(message)")
end

function AboutSceneEntityState:touchDown(touches)
-- print("	AboutSceneEntityState:touchDown(touches)")
end

function AboutSceneEntityState:touchUp(touches)
-- print("	AboutSceneEntityState:touchUp(touches)")
end

function AboutSceneEntityState:touchMove(touches)
-- print("	AboutSceneEntityState:touchMove(touches)")
end

function AboutSceneEntityState:touchCancelled(touches)
-- print("	AboutSceneEntityState:touchCancelled(touches)")
end

function AboutSceneEntityState:renderHUD()
-- print("	AboutSceneEntityState:renderHUD()")
end

function AboutSceneEntityState:pause()
-- print("	AboutSceneEntityState:pause()")
end

function AboutSceneEntityState:unPause()
-- print("	AboutSceneEntityState:unPause()")
end

return AboutSceneEntityState
