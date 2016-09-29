local NodeEntity = {}
NodeEntity.__index = NodeEntity














local __ctor = function(self, init)
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end
















setmetatable(NodeEntity, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function NodeEntity:className()
 return "NodeEntity"
end

function NodeEntity:class()
 return self
end

function NodeEntity:superClass()
 return nil
end

function NodeEntity:isa(theClass)
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

function NodeEntity:__gc()
 NodeEntity._destroy(self)
end

function NodeEntity:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function NodeEntity:_destroy()
 assert(not self.__NodeEntityCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function NodeEntity:_create(init)
 self.__NodeEntityCalledLoad = false
 
 __ctor(self, init)
end

function NodeEntity:load()
 __load(self)
 
 self.__NodeEntityCalledLoad = true
end

function NodeEntity:unLoad()
 assert(self.__NodeEntityCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__NodeEntityCalledLoad = false
end

return NodeEntity














































































































































 
 
 

































 

 
 
 
 






































































































































