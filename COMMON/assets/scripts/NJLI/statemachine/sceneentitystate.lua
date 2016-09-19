local SceneEntityState = {}
SceneEntityState.__index = SceneEntityState

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
--  __ctor()
--  __dtor()
--  __load()
--  __unLoad()
--#############################################################################

local __ctor = function(self, init)
  --TODO: construct this Entity
end

local __dtor = function(self)
  --TODO: destruct this Entity
end

local __load = function(self)
  --TODO: load this Entity
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--############################################################################# 

--TODO: write function here for SceneEntityState
--function SceneEntityState:somefunction()
--end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(SceneEntityState, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function SceneEntityState:className()
  return "SceneEntityState"
end

function SceneEntityState:class()
  return self
end

function SceneEntityState:superClass()
  return nil
end

function SceneEntityState:isa(theClass)
  local b_isa = false
  local cur_class = theClass:class()
  while ( nil ~= cur_class ) and ( false == b_isa ) do
    if cur_class == theClass then
      b_isa = true
    else
      cur_class = cur_class:superClass()
    end
  end

  return b_isa
end

function SceneEntityState:__gc()
  SceneEntityState._destroy(self)
end

function SceneEntityState:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SceneEntityState:_destroy()
  assert(not self.__SceneEntityStateCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function SceneEntityState:_create(init)
  self.__SceneEntityStateCalledLoad = false
  
  __ctor(self, init)
end

function SceneEntityState:load()
  __load(self)
  
  self.__SceneEntityStateCalledLoad = true
end

function SceneEntityState:unLoad()
  assert(self.__SceneEntityStateCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__SceneEntityStateCalledLoad = false
end

return SceneEntityState

-- local SceneEntityState = {}
-- SceneEntityState.__index = SceneEntityState

-- local json = require('json')

-- setmetatable(SceneEntityState, {
--     __call = function (cls, ...)
--       local self = setmetatable({}, cls)
--       self:create(...)
--       return self
--     end,
--   })

-- function SceneEntityState:className()
--   return "SceneEntityState"
-- end

-- function SceneEntityState:class()
--   return self
-- end

-- function SceneEntityState:superClass()
--   return nil
-- end

-- function SceneEntityState:isa(theClass)
--   local b_isa = false
--   local cur_class = theClass:class()
--   while ( nil ~= cur_class ) and ( false == b_isa ) do
--     if cur_class == theClass then
--       b_isa = true
--     else
--       cur_class = cur_class:superClass()
--     end
--   end

--   return b_isa
-- end

-- function SceneEntityState:destroy()
--   SceneEntityState.__gc(self)
-- end

-- function SceneEntityState:create(init)

--   assert(init, "init variable is nil.")
--   assert(init.name, "Init variable is expecting a name value")
--   assert(init.entityOwner, "Init variable is expecting a entityOwner value")

--   self._entityOwner = init.entityOwner
--   self._sceneState = njli.SceneState.create()

--   self:getSceneState():setName(init.name)
-- end

-- function SceneEntityState:__gc()
--   self:unLoad()
-- end

-- function SceneEntityState:__tostring()

--   return json:stringify(self)
-- end

-- function SceneEntityState:getSceneState()
--   return self._sceneState
-- end

-- function SceneEntityState:getEntityOwner()
--   return self._entityOwner
-- end

-- function SceneEntityState:isLoaded()
--   if self.loaded == nil then
--     self.loaded = false
--   end

--   return self.loaded
-- end

-- function SceneEntityState:load()
--    print("SceneEntityState:load()")

--   self.loaded = true
-- end

-- function SceneEntityState:unLoad()
--   if self:getSceneState() then
--     njli.SceneState.destroy(self:getSceneState())
--   end
--   self._sceneState = nil

--   self._entityOwner = nil

--   self.loaded = false
  
--   print("SceneEntityState:unLoad()")
-- end

-- function SceneEntityState:pushState(stateName)
--   self:getEntityOwner():pushState(stateName)
-- end

-- function SceneEntityState:push()
--   self:getEntityOwner():getScene():getStateMachine():pushState(self:getSceneState())
-- end

-- function SceneEntityState:isIn()
--   return self:getSceneState():getName() == self:getEntityOwner():getScene():getStateMachine():getState():getName()
-- end

-- function SceneEntityState:enter() print("SceneEntityState:enter") end
-- function SceneEntityState:update(timeStep) print("SceneEntityState:update") end
-- function SceneEntityState:exit() print("SceneEntityState:exit") end
-- function SceneEntityState:onMessage(message) print("SceneEntityState:onMessage") end
-- function SceneEntityState:touchDown(touches) print("SceneEntityState:touchDown") end
-- function SceneEntityState:touchUp(touches) print("SceneEntityState:touchUp") end
-- function SceneEntityState:touchMove(touches) print("SceneEntityState:touchMove") end
-- function SceneEntityState:touchCancelled(touches) print("SceneEntityState:touchCancelled") end
-- function SceneEntityState:renderHUD() print("SceneEntityState:renderHUD") end
-- function SceneEntityState:pause() print("SceneEntityState:pause") end
-- function SceneEntityState:unPause() print("SceneEntityState:unPause") end
-- function SceneEntityState:willResignActive() print("SceneEntityState:willResignActive") end
-- function SceneEntityState:didBecomeActive() print("SceneEntityState:didBecomeActive") end
-- function SceneEntityState:didEnterBackground() print("SceneEntityState:didEnterBackground") end
-- function SceneEntityState:willEnterForeground() print("SceneEntityState:willEnterForeground") end
-- function SceneEntityState:willTerminate() print("SceneEntityState:willTerminate") end
-- function SceneEntityState:interrupt() print("SceneEntityState:interrupt") end
-- function SceneEntityState:resumeInterrupt() print("SceneEntityState:resumeInterrupt") end
-- function SceneEntityState:receivedMemoryWarning() print("SceneEntityState:receivedMemoryWarning") end

-- return SceneEntityState
