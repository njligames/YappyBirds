local YappyGame = {}
YappyGame.__index = YappyGame














local __ctor = function(self, init)
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end



function YappyGame:startStateMachine()
 print("started the statemachine")
end










setmetatable(YappyGame, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function YappyGame:className()
 return "YappyGame"
end

function YappyGame:class()
 return self
end

function YappyGame:superClass()
 return nil
end

function YappyGame:isa(theClass)
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

function YappyGame:__gc()
 YappyGame._destroy(self)
end

function YappyGame:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function YappyGame:_destroy()
 assert(not self.__YappyGameCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function YappyGame:_create(init)
 self.__YappyGameCalledLoad = false
 
 __ctor(self, init)
end

function YappyGame:load()
 __load(self)
 
 self.__YappyGameCalledLoad = true
end

function YappyGame:unLoad()
 assert(self.__YappyGameCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__YappyGameCalledLoad = false
end

return YappyGame




















































 







 


















 

 




