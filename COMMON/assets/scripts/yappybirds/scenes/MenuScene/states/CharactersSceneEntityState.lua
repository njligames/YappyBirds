 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local CharactersSceneEntityState = {}
 CharactersSceneEntityState.__index = CharactersSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(CharactersSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function CharactersSceneEntityState:className()
 return "CharactersSceneEntityState"
 end
 
 function CharactersSceneEntityState:class()
 return self
 end
 
 function CharactersSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function CharactersSceneEntityState:destroy()
-- print(" CharactersSceneEntityState:destroy()")
 
 CharactersSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function CharactersSceneEntityState:create(init)
 SceneEntityState.create(self, init)
 
 
-- print("	CharactersSceneEntityState:create(init)")
 end
 
 function CharactersSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function CharactersSceneEntityState:__tostring()
 
 return json.encode(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function CharactersSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function CharactersSceneEntityState:load()
 SceneEntityState.load(self)

-- print(" CharactersSceneEntityState:load()")
end

function CharactersSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

-- print(" CharactersSceneEntityState:unLoad()")
end

function CharactersSceneEntityState:enter()
-- print("	CharactersSceneEntityState:enter()")
end

function CharactersSceneEntityState:update(timeStep)
-- print("	CharactersSceneEntityState:update("..timeStep..")")
end

function CharactersSceneEntityState:exit()
-- print("	CharactersSceneEntityState:exit()")
end

function CharactersSceneEntityState:onMessage(message)
-- print("	CharactersSceneEntityState:onMessage(message)")
end

function CharactersSceneEntityState:touchDown(touches)
-- print("	CharactersSceneEntityState:touchDown(touches)")
end

function CharactersSceneEntityState:touchUp(touches)
-- print("	CharactersSceneEntityState:touchUp(touches)")
end

function CharactersSceneEntityState:touchMove(touches)
-- print("	CharactersSceneEntityState:touchMove(touches)")
end

function CharactersSceneEntityState:touchCancelled(touches)
-- print("	CharactersSceneEntityState:touchCancelled(touches)")
end

function CharactersSceneEntityState:renderHUD()
-- print("	CharactersSceneEntityState:renderHUD()")
end

function CharactersSceneEntityState:pause()
-- print("	CharactersSceneEntityState:pause()")
end

function CharactersSceneEntityState:unPause()
-- print("	CharactersSceneEntityState:unPause()")
end

return CharactersSceneEntityState
