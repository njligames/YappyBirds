local SceneEntityState = {}
SceneEntityState.__index = SceneEntityState














local __ctor = function(self, init)
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end
















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
































































































 




































