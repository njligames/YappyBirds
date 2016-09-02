 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local ModeselectSceneEntityState = {}
 ModeselectSceneEntityState.__index = ModeselectSceneEntityState
 
 local json = require('json')
 
 setmetatable(ModeselectSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function ModeselectSceneEntityState:className()
 return "ModeselectSceneEntityState"
 end
 
 function ModeselectSceneEntityState:class()
 return self
 end
 
 function ModeselectSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function ModeselectSceneEntityState:destroy()
-- print(" ModeselectSceneEntityState:destroy()")
 
 ModeselectSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function ModeselectSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
-- print("	ModeselectSceneEntityState:create(init)")
 end
 
 function ModeselectSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function ModeselectSceneEntityState:__tostring()
 
 return json:stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function ModeselectSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function ModeselectSceneEntityState:load()
 SceneEntityState.load(self)

-- print(" ModeselectSceneEntityState:load()")
end

function ModeselectSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

-- print(" ModeselectSceneEntityState:unLoad()")
end

function ModeselectSceneEntityState:enter()
-- print("	ModeselectSceneEntityState:enter()")
end

function ModeselectSceneEntityState:update(timeStep)
-- print("	ModeselectSceneEntityState:update("..timeStep..")")
end

function ModeselectSceneEntityState:exit()
-- print("	ModeselectSceneEntityState:exit()")
end

function ModeselectSceneEntityState:onMessage(message)
-- print("	ModeselectSceneEntityState:onMessage(message)")
end

function ModeselectSceneEntityState:touchDown(touches)
-- print("	ModeselectSceneEntityState:touchDown(touches)")
end

function ModeselectSceneEntityState:touchUp(touches)
-- print("	ModeselectSceneEntityState:touchUp(touches)")
end

function ModeselectSceneEntityState:touchMove(touches)
-- print("	ModeselectSceneEntityState:touchMove(touches)")
end

function ModeselectSceneEntityState:touchCancelled(touches)
-- print("	ModeselectSceneEntityState:touchCancelled(touches)")
end

function ModeselectSceneEntityState:renderHUD()
-- print("	ModeselectSceneEntityState:renderHUD()")
end

function ModeselectSceneEntityState:pause()
-- print("	ModeselectSceneEntityState:pause()")
end

function ModeselectSceneEntityState:unPause()
-- print("	ModeselectSceneEntityState:unPause()")
end

return ModeselectSceneEntityState
