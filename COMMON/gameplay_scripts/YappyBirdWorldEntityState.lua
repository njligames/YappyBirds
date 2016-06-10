 local WorldEntityState = require "njli.worldentitystate"
 
 local YappyBirdWorldEntityState = {}
 YappyBirdWorldEntityState.__index = YappyBirdWorldEntityState
 
 local json = require('JSON')
 
 setmetatable(YappyBirdWorldEntityState, {
   __index = WorldEntityState,
   __call = function (cls, ...)
     local self = setmetatable({}, cls)
     WorldEntityState.create(self, ...)
     self:create(...)
     return self
   end,
 })
 
 function YappyBirdWorldEntityState:className()
   return "YappyBirdWorldEntityState"
 end
 
 function YappyBirdWorldEntityState:class()
   return self
 end
 
 function YappyBirdWorldEntityState:superClass()
   return WorldEntityState
 end
 
 function YappyBirdWorldEntityState:destroy()
   YappyBirdWorldEntityState.__gc(self)
   WorldEntityState.destroy(self)
 end
 
 function YappyBirdWorldEntityState:create(init)
    WorldEntityState.create(self, init)
   --TODO: Create and initialize properties...
 end
 
 function YappyBirdWorldEntityState:__gc()
   --TODO: Destroy properties
 end
 
 function YappyBirdWorldEntityState:__tostring()
   --TODO: Represent the class as a string...
   return json.encode(self)
 end
 
 --TODO: List the Functions for YappyBirdWorldEntityState
 
 --[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]
function YappyBirdWorldEntityState:create(init)
  WorldEntityState.create(self, init)
end

function YappyBirdWorldEntityState:__gc()
  self:unLoad()
end

function YappyBirdWorldEntityState:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

function YappyBirdWorldEntityState:load()
  WorldEntityState.load(self)
end

function YappyBirdWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)
end

function YappyBirdWorldEntityState:enter()                 
end

function YappyBirdWorldEntityState:update(timeStep)        
end

function YappyBirdWorldEntityState:exit()                  
end

function YappyBirdWorldEntityState:onMessage(message)      
end

function YappyBirdWorldEntityState:touchDown(touches)      
end

function YappyBirdWorldEntityState:touchUp(touches)        
end

function YappyBirdWorldEntityState:touchMove(touches)      
end

function YappyBirdWorldEntityState:touchCancelled(touches) 
end

function YappyBirdWorldEntityState:renderHUD()             
end

function YappyBirdWorldEntityState:keyboardShow()          
end

function YappyBirdWorldEntityState:keyboardCancel()        
end

function YappyBirdWorldEntityState:keyboardReturn(text)    
end

function YappyBirdWorldEntityState:receivedMemoryWarning() 
end

function YappyBirdWorldEntityState:pause()                 
end

function YappyBirdWorldEntityState:unPause()               
end

return YappyBirdWorldEntityState
