local EntityManager = {}
EntityManager.__index = EntityManager














local __ctor = function(self, init)
 
 self._nodeEntityTable = {}
 self._sceneEntityTable = {}
 self._worldEntityTable = {}
end

local __dtor = function(self)
 
 self._nodeEntityTable = nil
 self._sceneEntityTable = nil
 self._worldEntityTable = nil
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end



function EntityManager:getNodeEntity(key)
 if not self:hasNodeEntity(key) then
 error("There is no NodeEntity with key " .. key, 2)
 end

 return self._nodeEntityTable[key]
end

function EntityManager:getSceneEntity(key)
 if not self:hasSceneEntity(key) then
 error("There is no SceneEntity with key " .. key, 2)
 end

 return self._sceneEntityTable[key]
end

function EntityManager:getWorldEntity(key)
 if not self:hasWorldEntity(key) then
 
 end

 return self._worldEntityTable[key]
end



function EntityManager:addNodeEntity(nodeEntity)
 assert(nodeEntity, "nodeEntity is nil")

 local key = nodeEntity:getNode():getName()
 local ret = false

 if self:hasNodeEntity(key) then
 print("Cannot overwrite a NodeEntity with key " .. key .. ".")
 else
 self._nodeEntityTable[key] = nodeEntity
 ret = true
 end

 return key, ret
end

function EntityManager:addSceneEntity(sceneEntity)
 assert(sceneEntity, "nodeEntity is nil")

 local key = sceneEntity:getScene():getName()
 local ret = false

 if self:hasSceneEntity(key) then
 print("Cannot overwrite a SceneEntity with key " .. key .. ".")
 else
 self._sceneEntityTable[key] = sceneEntity
 ret = true
 end

 return key, ret
end

function EntityManager:addWorldEntity(worldEntity)
 assert(worldEntity, "worldEntity is nil")

 local key = worldEntity:getWorld():getName()
 local ret = false

 if self:hasWorldEntity(key) then
 error("Cannot overwrite a WorldEntity with key " .. key .. ".", 2)
 else
 self._worldEntityTable[key] = worldEntity
 ret = true
 end

 return key, ret
end



function EntityManager:removeNodeEntity(key)
 self._nodeEntityTable[key] = nil
end

function EntityManager:removeSceneEntity(key)
 self._sceneEntityTable[key] = nil
end

function EntityManager:removeWorldEntity(key)
 self._worldEntityTable[key] = nil
end



function EntityManager:hasNodeEntity(key)
 return (self._nodeEntityTable[key] ~= nil)
end

function EntityManager:hasSceneEntity(key)
 return (self._sceneEntityTable[key] ~= nil)
end

function EntityManager:hasWorldEntity(key)
 return (self._worldEntityTable[key] ~= nil)
end










setmetatable(EntityManager, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
 return self
 end,
 })

function EntityManager:className()
 return "EntityManager"
end

function EntityManager:class()
 return self
end

function EntityManager:superClass()
 return nil
end

function EntityManager:isa(theClass)
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

function EntityManager:__gc()
 EntityManager._destroy(self)
end

function EntityManager:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function EntityManager:_destroy()
 assert(not self.__EntityManagerCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function EntityManager:_create(init)
 self.__EntityManagerCalledLoad = false
 
 __ctor(self, init)
end

function EntityManager:load()
 __load(self)
 
 self.__EntityManagerCalledLoad = true
end

function EntityManager:unLoad()
 assert(self.__EntityManagerCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__EntityManagerCalledLoad = false
end

return EntityManager
