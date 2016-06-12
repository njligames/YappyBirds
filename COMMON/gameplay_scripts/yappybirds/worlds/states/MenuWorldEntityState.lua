 local WorldEntityState = require "njli.statemachine.worldentitystate"
 
 local MenuWorldEntityState = {}
 MenuWorldEntityState.__index = MenuWorldEntityState
 
 local json = require('JSON')
 
 setmetatable(MenuWorldEntityState, {
   __index = WorldEntityState,
   __call = function (cls, ...)
     local self = setmetatable({}, cls)
     WorldEntityState.create(self, ...)
     self:create(...)
     return self
   end,
 })
 
 function MenuWorldEntityState:className()
   return "MenuWorldEntityState"
 end
 
 function MenuWorldEntityState:class()
   return self
 end
 
 function MenuWorldEntityState:superClass()
   return WorldEntityState
 end
 
 function MenuWorldEntityState:destroy()
   MenuWorldEntityState.__gc(self)
   WorldEntityState.destroy(self)
 end
 
 function MenuWorldEntityState:create(init)
    WorldEntityState.create(self, init)
   --TODO: Create and initialize properties...
 end
 
 function MenuWorldEntityState:__gc()
   --TODO: Destroy properties
 end
 
 function MenuWorldEntityState:__tostring()
   --TODO: Represent the class as a string...
   return json.encode(self)
 end
 
 --TODO: List the Functions for MenuWorldEntityState
 
 --[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]
function MenuWorldEntityState:create(init)
  WorldEntityState.create(self, init)
end

function MenuWorldEntityState:__gc()
  self:unLoad()
end

function MenuWorldEntityState:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

function MenuWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function MenuWorldEntityState:load()
  WorldEntityState.load(self)
end

function MenuWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)
end

function MenuWorldEntityState:enter()
end

function MenuWorldEntityState:update(timeStep)
end

function MenuWorldEntityState:exit()                  
end

function MenuWorldEntityState:onMessage(message)      
end

function MenuWorldEntityState:touchDown(touches)      
end

function MenuWorldEntityState:touchUp(touches)        
end

function MenuWorldEntityState:touchMove(touches)      
end

function MenuWorldEntityState:touchCancelled(touches) 
end

function MenuWorldEntityState:renderHUD()             
end

function MenuWorldEntityState:keyboardShow()          
end

function MenuWorldEntityState:keyboardCancel()        
end

function MenuWorldEntityState:keyboardReturn(text)    
end

function MenuWorldEntityState:receivedMemoryWarning() 
end

function MenuWorldEntityState:pause()                 
end

function MenuWorldEntityState:unPause()               
end

return MenuWorldEntityState
