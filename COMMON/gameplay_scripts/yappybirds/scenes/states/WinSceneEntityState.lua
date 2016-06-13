  local SceneEntityState = require "njli.statemachine.sceneentitystate"
 
 local WinSceneEntityState = {}
 WinSceneEntityState.__index = WinSceneEntityState
 
 local json = require('JSON')
 
 setmetatable(WinSceneEntityState, {
   __index = SceneEntityState,
   __call = function (cls, ...)
     local self = setmetatable({}, cls)
     self:create(...)
     return self
   end,
 })
 
 function WinSceneEntityState:className()
   return "WinSceneEntityState"
 end
 
 function WinSceneEntityState:class()
   return self
 end
 
 function WinSceneEntityState:superClass()
   return SceneEntityState
 end
 
 function WinSceneEntityState:destroy()
  print(" WinSceneEntityState:destroy()")

   WinSceneEntityState.__gc(self)
   SceneEntityState.destroy(self)
 end
 
 function WinSceneEntityState:create(init)
  SceneEntityState.create(self, init)
    
   --TODO: Create and initialize properties...
  print("	WinSceneEntityState:create(init)")
 end
 
 function WinSceneEntityState:__gc()
  self:unLoad()
   --TODO: Destroy properties
 end
 
 function WinSceneEntityState:__tostring()
   --TODO: Represent the class as a string...
   return json.encode(self)
 end
 
 --TODO: List the Functions for WinSceneEntityState
 
 --[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]

function WinSceneEntityState:isLoaded()
  return SceneEntityState.isLoaded(self)
end

function WinSceneEntityState:load()
  SceneEntityState.load(self)

  print(" WinSceneEntityState:load()")
end

function WinSceneEntityState:unLoad()
  SceneEntityState.unLoad(self)

  print(" WinSceneEntityState:unLoad()")
end

function WinSceneEntityState:enter()
  print("	WinSceneEntityState:enter()")
end

function WinSceneEntityState:update(timeStep)
  print("	WinSceneEntityState:update("..timeStep..")")
end

function WinSceneEntityState:exit()
  print("	WinSceneEntityState:exit()")
end

function WinSceneEntityState:onMessage(message)
  print("	WinSceneEntityState:onMessage(message)")
end

function WinSceneEntityState:touchDown(touches)
  print("	WinSceneEntityState:touchDown(touches)")
end

function WinSceneEntityState:touchUp(touches)
  print("	WinSceneEntityState:touchUp(touches)")
end

function WinSceneEntityState:touchMove(touches)
  print("	WinSceneEntityState:touchMove(touches)")
end

function WinSceneEntityState:touchCancelled(touches)
  print("	WinSceneEntityState:touchCancelled(touches)")
end

function WinSceneEntityState:renderHUD()
  print("	WinSceneEntityState:renderHUD()")
end

function WinSceneEntityState:pause()
  print("	WinSceneEntityState:pause()")
end

function WinSceneEntityState:unPause()
  print("	WinSceneEntityState:unPause()")
end

return WinSceneEntityState
