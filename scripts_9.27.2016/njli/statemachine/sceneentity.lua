local SceneEntity = {}
SceneEntity.__index = SceneEntity














local __ctor = function(self, init)
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end
















setmetatable(SceneEntity, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function SceneEntity:className()
 return "SceneEntity"
end

function SceneEntity:class()
 return self
end

function SceneEntity:superClass()
 return nil
end

function SceneEntity:isa(theClass)
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

function SceneEntity:__gc()
 SceneEntity._destroy(self)
end

function SceneEntity:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function SceneEntity:_destroy()
 assert(not self.__SceneEntityCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function SceneEntity:_create(init)
 self.__SceneEntityCalledLoad = false
 
 __ctor(self, init)
end

function SceneEntity:load()
 __load(self)
 
 self.__SceneEntityCalledLoad = true
end

function SceneEntity:unLoad()
 assert(self.__SceneEntityCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__SceneEntityCalledLoad = false
end

return SceneEntity












































































 





































































 










 



































































































































