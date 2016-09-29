local Device = {}
Device.__index = Device














local __ctor = function(self, init)
 
end

local __dtor = function(self)
 
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end



function Device:update(timeStep)
 
end

function Device:render()
 
end

function Device:resize(width, height, orientation)
 
end

function Device:touchDown(touches)
 
end

function Device:touchUp(touches)
 
end

function Device:touchMove(touches)
 
end

function Device:touchCancelled(touches)
 
end










setmetatable(Device, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function Device:className()
 return "Device"
end

function Device:class()
 return self
end

function Device:superClass()
 return nil
end

function Device:isa(theClass)
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

function Device:__gc()
 Device._destroy(self)
end

function Device:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Device:_destroy()
 assert(not self.__DeviceCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function Device:_create(init)
 self.__DeviceCalledLoad = false
 
 __ctor(self, init)
end

function Device:load()
 __load(self)
 
 self.__DeviceCalledLoad = true
end

function Device:unLoad()
 assert(self.__DeviceCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__DeviceCalledLoad = false
end

return Device
