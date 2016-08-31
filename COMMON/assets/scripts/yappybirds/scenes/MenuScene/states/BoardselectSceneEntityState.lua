 local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local BoardselectSceneEntityState = {}
 BoardselectSceneEntityState.__index = BoardselectSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(BoardselectSceneEntityState, {
 __index = SceneEntityState,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
 })
 
 function BoardselectSceneEntityState:className()
 return "BoardselectSceneEntityState"
 end
 
 function BoardselectSceneEntityState:class()
 return self
 end
 
 function BoardselectSceneEntityState:superClass()
 return SceneEntityState
 end
 
 function BoardselectSceneEntityState:destroy()
-- print(" BoardselectSceneEntityState:destroy()")
 
 BoardselectSceneEntityState.__gc(self)
 SceneEntityState.destroy(self)
 end
 
 function BoardselectSceneEntityState:create(init)
 SceneEntityState.create(self, init)

 
-- print("	BoardselectSceneEntityState:create(init)")
 end
 
 function BoardselectSceneEntityState:__gc()
 self:unLoad()
 
 end
 
 function BoardselectSceneEntityState:__tostring()
 
 return json.stringify(self)
 end
 
 
 
 
local init =
{
 name = "name",
 entityOwner = nil
}


function BoardselectSceneEntityState:isLoaded()
 return SceneEntityState.isLoaded(self)
end

function BoardselectSceneEntityState:load()
 SceneEntityState.load(self)

-- print(" BoardselectSceneEntityState:load()")
end

function BoardselectSceneEntityState:unLoad()
 SceneEntityState.unLoad(self)

-- print(" BoardselectSceneEntityState:unLoad()")
end

function BoardselectSceneEntityState:enter()
-- print("	BoardselectSceneEntityState:enter()")
end

function BoardselectSceneEntityState:update(timeStep)
-- print("	BoardselectSceneEntityState:update("..timeStep..")")
end

function BoardselectSceneEntityState:exit()
-- print("	BoardselectSceneEntityState:exit()")
end

function BoardselectSceneEntityState:onMessage(message)
-- print("	BoardselectSceneEntityState:onMessage(message)")
end

function BoardselectSceneEntityState:touchDown(touches)
-- print("	BoardselectSceneEntityState:touchDown(touches)")
end

function BoardselectSceneEntityState:touchUp(touches)
-- print("	BoardselectSceneEntityState:touchUp(touches)")
end

function BoardselectSceneEntityState:touchMove(touches)
-- print("	BoardselectSceneEntityState:touchMove(touches)")
end

function BoardselectSceneEntityState:touchCancelled(touches)
-- print("	BoardselectSceneEntityState:touchCancelled(touches)")
end

function BoardselectSceneEntityState:renderHUD()
-- print("	BoardselectSceneEntityState:renderHUD()")
end

function BoardselectSceneEntityState:pause()
-- print("	BoardselectSceneEntityState:pause()")
end

function BoardselectSceneEntityState:unPause()
-- print("	BoardselectSceneEntityState:unPause()")
end

return BoardselectSceneEntityState
