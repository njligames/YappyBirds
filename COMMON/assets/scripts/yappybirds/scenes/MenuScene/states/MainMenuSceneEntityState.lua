 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local MainMenuSceneEntityState = {}
 MainMenuSceneEntityState.__index = MainMenuSceneEntityState
 
 local json = require('json')
 
 setmetatable(MainMenuSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function MainMenuSceneEntityState:className()
 return "MainMenuSceneEntityState"
 end
 
 function MainMenuSceneEntityState:class()
 return self
 end
 
 function MainMenuSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function MainMenuSceneEntityState:destroy()
-- print(" MainMenuSceneEntityState:destroy()")
 
 MainMenuSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function MainMenuSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
-- print("	MainMenuSceneEntityState:create(init)")
 end
 
 function MainMenuSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function MainMenuSceneEntityState:__tostring()
 
 return json:stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function MainMenuSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function MainMenuSceneEntityState:load()
 SceneEntityState.load(self)

-- print(" MainMenuSceneEntityState:load()")
end

function MainMenuSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

-- print(" MainMenuSceneEntityState:unLoad()")
end

function MainMenuSceneEntityState:enter()
-- print("	MainMenuSceneEntityState:enter()")
end

function MainMenuSceneEntityState:update(timeStep)
-- print("	MainMenuSceneEntityState:update("..timeStep..")")
end

function MainMenuSceneEntityState:exit()
-- print("	MainMenuSceneEntityState:exit()")
end

function MainMenuSceneEntityState:onMessage(message)
-- print("	MainMenuSceneEntityState:onMessage(message)")
end

function MainMenuSceneEntityState:touchDown(touches)
-- print("	MainMenuSceneEntityState:touchDown(touches)")
end

function MainMenuSceneEntityState:touchUp(touches)
-- print("	MainMenuSceneEntityState:touchUp(touches)")
end

function MainMenuSceneEntityState:touchMove(touches)
-- print("	MainMenuSceneEntityState:touchMove(touches)")
end

function MainMenuSceneEntityState:touchCancelled(touches)
-- print("	MainMenuSceneEntityState:touchCancelled(touches)")
end

function MainMenuSceneEntityState:renderHUD()
-- print("	MainMenuSceneEntityState:renderHUD()")
end

function MainMenuSceneEntityState:pause()
-- print("	MainMenuSceneEntityState:pause()")
end

function MainMenuSceneEntityState:unPause()
-- print("	MainMenuSceneEntityState:unPause()")
end

return MainMenuSceneEntityState
