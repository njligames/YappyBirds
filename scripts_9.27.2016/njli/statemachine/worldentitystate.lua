local WorldEntityState = {}
WorldEntityState.__index = WorldEntityState














local __ctor = function(self, init)
 
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end
















setmetatable(WorldEntityState, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function WorldEntityState:className()
 return "WorldEntityState"
end

function WorldEntityState:class()
 return self
end

function WorldEntityState:superClass()
 return nil
end

function WorldEntityState:isa(theClass)
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

function WorldEntityState:__gc()
 WorldEntityState._destroy(self)
end

function WorldEntityState:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function WorldEntityState:_destroy()
 assert(not self.__WorldEntityStateCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function WorldEntityState:_create(init)
 self.__WorldEntityStateCalledLoad = false
 
 __ctor(self, init)
end

function WorldEntityState:load()
 __load(self)
 
 self.__WorldEntityStateCalledLoad = true
end

function WorldEntityState:unLoad()
 assert(self.__WorldEntityStateCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__WorldEntityStateCalledLoad = false
end

return WorldEntityState



















































































 












 
















































