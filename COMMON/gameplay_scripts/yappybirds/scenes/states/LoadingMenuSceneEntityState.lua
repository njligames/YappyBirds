  local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local LoadingMenuSceneEntityState = {}
 LoadingMenuSceneEntityState.__index = LoadingMenuSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(LoadingMenuSceneEntityState, {
   __index = SceneEntityState,
   __call = function (cls, ...)
     local self = setmetatable({}, cls)
     self:create(...)
     return self
   end,
 })
 
 function LoadingMenuSceneEntityState:className()
   return "LoadingMenuSceneEntityState"
 end
 
 function LoadingMenuSceneEntityState:class()
   return self
 end
 
 function LoadingMenuSceneEntityState:superClass()
   return SceneEntityState
 end
 
 function LoadingMenuSceneEntityState:destroy()
  print(" LoadingMenuSceneEntityState:destroy()")
  
   LoadingMenuSceneEntityState.__gc(self)
   SceneEntityState.destroy(self)
 end
 
 function LoadingMenuSceneEntityState:create(init)
  SceneEntityState.create(self, init)
    
   --TODO: Create and initialize properties...
  print("	LoadingMenuSceneEntityState:create(init)")
 end
 
 function LoadingMenuSceneEntityState:__gc()
  self:unLoad()
   --TODO: Destroy properties
 end
 
 function LoadingMenuSceneEntityState:__tostring()
   --TODO: Represent the class as a string...
   return json.encode(self)
 end
 
 --TODO: List the Functions for LoadingMenuSceneEntityState
 
 --[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]

function LoadingMenuSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function LoadingMenuSceneEntityState:load()
  SceneEntityState.load(self)

  print(" LoadingMenuSceneEntityState:load()")
end

function LoadingMenuSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print(" LoadingMenuSceneEntityState:unLoad()")
end

function LoadingMenuSceneEntityState:enter()
  print("	LoadingMenuSceneEntityState:enter()")
end

function LoadingMenuSceneEntityState:update(timeStep)
  print("	LoadingMenuSceneEntityState:update("..timeStep..")")
end

function LoadingMenuSceneEntityState:exit()
  print("	LoadingMenuSceneEntityState:exit()")
end

function LoadingMenuSceneEntityState:onMessage(message)
  print("	LoadingMenuSceneEntityState:onMessage(message)")
end

function LoadingMenuSceneEntityState:touchDown(touches)
  print("	LoadingMenuSceneEntityState:touchDown(touches)")
end

function LoadingMenuSceneEntityState:touchUp(touches)
  print("	LoadingMenuSceneEntityState:touchUp(touches)")
end

function LoadingMenuSceneEntityState:touchMove(touches)
  print("	LoadingMenuSceneEntityState:touchMove(touches)")
end

function LoadingMenuSceneEntityState:touchCancelled(touches)
  print("	LoadingMenuSceneEntityState:touchCancelled(touches)")
end

function LoadingMenuSceneEntityState:renderHUD()
  print("	LoadingMenuSceneEntityState:renderHUD()")
end

function LoadingMenuSceneEntityState:pause()
  print("	LoadingMenuSceneEntityState:pause()")
end

function LoadingMenuSceneEntityState:unPause()
  print("	LoadingMenuSceneEntityState:unPause()")
end

return LoadingMenuSceneEntityState
