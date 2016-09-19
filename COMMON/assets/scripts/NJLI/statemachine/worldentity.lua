local WorldEntity = {}
WorldEntity.__index = WorldEntity

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

--TODO: write function here for WorldEntity
--function WorldEntity:somefunction()
--end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(WorldEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function WorldEntity:className()
  return "WorldEntity"
end

function WorldEntity:class()
  return self
end

function WorldEntity:superClass()
  return nil
end

function WorldEntity:isa(theClass)
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

function WorldEntity:__gc()
  WorldEntity._destroy(self)
end

function WorldEntity:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function WorldEntity:_destroy()
  assert(not self.__WorldEntityCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function WorldEntity:_create(init)
  self.__WorldEntityCalledLoad = false
  
  __ctor(self, init)
end

function WorldEntity:load()
  __load(self)
  
  self.__WorldEntityCalledLoad = true
end

function WorldEntity:unLoad()
  assert(self.__WorldEntityCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__WorldEntityCalledLoad = false
end

return WorldEntity

-- local WorldEntity = {}
-- WorldEntity.__index = WorldEntity

-- --#############################################################################
-- --DO NOT EDIT ABOVE
-- --#############################################################################

-- --#############################################################################
-- --Begin Custom Code
-- --Required local functions:
-- --  __ctor()
-- --  __dtor()
-- --  __load()
-- --  __unLoad()
-- --#############################################################################

-- local __ctor = function(self, init)
--   --TODO: construct this Entity
-- end

-- local __dtor = function(self)
--   --TODO: destruct this Entity
-- end

-- local __load = function(self)
--   --TODO: load this Entity
-- end

-- local __unLoad = function(self)
--   --TODO: unload this Entity
-- end

-- --#############################################################################
-- --End Custom Code
-- --#############################################################################


-- --#############################################################################
-- --DO NOT EDIT BELOW
-- --#############################################################################

-- setmetatable(WorldEntity, {
--     __call = function (cls, ...)
--       local self = setmetatable({}, cls)
--       self:_create(...)
--       return self
--     end,
--   })

-- function WorldEntity:className()
--   return "WorldEntity"
-- end

-- function WorldEntity:class()
--   return self
-- end

-- function WorldEntity:superClass()
--   return nil
-- end

-- function WorldEntity:isa(theClass)
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

-- function WorldEntity:__gc()
--   WorldEntity._destroy(self)
-- end

-- function WorldEntity:__tostring()
--   local ret = self:className() .. " =\n{\n"
  
--   for pos,val in pairs(self) do 
--     ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
--   end

--   return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
-- end

-- function WorldEntity:_destroy()
--   assert(not self.__WorldEntityCalledLoad, "Must unload before you destroy")
  
--   __dtor(self)
-- end

-- function WorldEntity:_create(init)
--   self.__WorldEntityCalledLoad = false
  
--   __ctor(self, init)
-- end

-- function WorldEntity:load()
--   __load(self)
  
--   self.__WorldEntityCalledLoad = true
-- end

-- function WorldEntity:unLoad()
--   assert(self.__WorldEntityCalledLoad, "Must load before unloading")
  
--   __unLoad(self)
--   self.__WorldEntityCalledLoad = false
-- end

-- return WorldEntity
