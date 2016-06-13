  local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LeaderboardsSceneEntityState = {}
 LeaderboardsSceneEntityState.__index = LeaderboardsSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LeaderboardsSceneEntityState, {
   __index = SceneEntityState,
   __call = function (cls, ...)
     local self = setmetatable({}, cls)
     self:create(...)
     return self
   end,
 })
 
 function LeaderboardsSceneEntityState:className()
   return "LeaderboardsSceneEntityState"
 end
 
 function LeaderboardsSceneEntityState:class()
   return self
 end
 
 function LeaderboardsSceneEntityState:superClass()
   return SceneEntityState
 end
 
 function LeaderboardsSceneEntityState:destroy()
  print(" LeaderboardsSceneEntityState:destroy()")
  
   LeaderboardsSceneEntityState.__gc(self)
   SceneEntityState.destroy(self)
 end
 
 function LeaderboardsSceneEntityState:create(init)
  SceneEntityState.create(self, init)
    
   --TODO: Create and initialize properties...
  print("	LeaderboardsSceneEntityState:create(init)")
 end
 
 function LeaderboardsSceneEntityState:__gc()
  self:unLoad()
   --TODO: Destroy properties
 end
 
 function LeaderboardsSceneEntityState:__tostring()
   --TODO: Represent the class as a string...
   return json.encode(self)
 end
 
 --TODO: List the Functions for LeaderboardsSceneEntityState
 
 --[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]

function LeaderboardsSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LeaderboardsSceneEntityState:load()
  SceneEntityState.load(self)

  print(" LeaderboardsSceneEntityState:load()")
end

function LeaderboardsSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print(" LeaderboardsSceneEntityState:unLoad()")
end

function LeaderboardsSceneEntityState:enter()
  print("	LeaderboardsSceneEntityState:enter()")
end

function LeaderboardsSceneEntityState:update(timeStep)
  print("	LeaderboardsSceneEntityState:update("..timeStep..")")
end

function LeaderboardsSceneEntityState:exit()
  print("	LeaderboardsSceneEntityState:exit()")
end

function LeaderboardsSceneEntityState:onMessage(message)
  print("	LeaderboardsSceneEntityState:onMessage(message)")
end

function LeaderboardsSceneEntityState:touchDown(touches)
  print("	LeaderboardsSceneEntityState:touchDown(touches)")
end

function LeaderboardsSceneEntityState:touchUp(touches)
  print("	LeaderboardsSceneEntityState:touchUp(touches)")
end

function LeaderboardsSceneEntityState:touchMove(touches)
  print("	LeaderboardsSceneEntityState:touchMove(touches)")
end

function LeaderboardsSceneEntityState:touchCancelled(touches)
  print("	LeaderboardsSceneEntityState:touchCancelled(touches)")
end

function LeaderboardsSceneEntityState:renderHUD()
  print("	LeaderboardsSceneEntityState:renderHUD()")
end

function LeaderboardsSceneEntityState:pause()
  print("	LeaderboardsSceneEntityState:pause()")
end

function LeaderboardsSceneEntityState:unPause()
  print("	LeaderboardsSceneEntityState:unPause()")
end

return LeaderboardsSceneEntityState
