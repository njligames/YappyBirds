local NodeEntityState = {}
NodeEntityState.__index = NodeEntityState














local __ctor = function(self, init)
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end
















setmetatable(NodeEntityState, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function NodeEntityState:className()
 return "NodeEntityState"
end

function NodeEntityState:class()
 return self
end

function NodeEntityState:superClass()
 return nil
end

function NodeEntityState:isa(theClass)
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

function NodeEntityState:__gc()
 NodeEntityState._destroy(self)
end

function NodeEntityState:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function NodeEntityState:_destroy()
 assert(not self.__NodeEntityStateCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function NodeEntityState:_create(init)
 self.__NodeEntityStateCalledLoad = false
 
 __ctor(self, init)
end

function NodeEntityState:load()
 __load(self)
 
 self.__NodeEntityStateCalledLoad = true
end

function NodeEntityState:unLoad()
 assert(self.__NodeEntityStateCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__NodeEntityStateCalledLoad = false
end

return NodeEntityState




















































 










 




 









































































