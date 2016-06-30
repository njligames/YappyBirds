local EntityManager = {}
EntityManager.__index = EntityManager

local json = require('JSON')

setmetatable(EntityManager, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
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

function EntityManager:destroy()
  EntityManager.__gc(self)
end

function EntityManager:create(init)
  --TODO: Create and initialize properties...
  ---[[
  --EXAMPLE:
  self._nodeEntityTable = {}
  self._sceneEntityTable = {}
  self._worldEntityTable = {}
  --]]

  if init then
    --TODO: Initialize the properties...
  end
end

function EntityManager:__gc()
  --TODO: Destroy properties
  for k,v in pairs(self._nodeEntityTable) do
    v:destroy()
  end

  for k,v in pairs(self._sceneEntityTable) do
    v:destroy()
  end

  for k,v in pairs(self._worldEntityTable) do
    v:destroy()
  end
end

function EntityManager:__tostring()
  --TODO: Represent the class as a string...
  -- return "EntityManager"
  return json.encode(self)
end

--TODO: List the Functions for EntityManager
  ---[[
  --EXAMPLE:

function EntityManager:set_nodeEntityTable(newval)
  self._nodeEntityTable = newval
end

function EntityManager:get_nodeEntityTable()
  return self._nodeEntityTable
end

function EntityManager:set_sceneEntityTable(newval)
  self._sceneEntityTable = newval
end

function EntityManager:get_sceneEntityTable()
  return self._sceneEntityTable
end

function EntityManager:set_worldEntityTable(newval)
  self._worldEntityTable = newval
end

function EntityManager:get_worldEntityTable()
  return self._worldEntityTable
end

function EntityManager:getNodeEntity(key)
  assert(self:hasNodeEntity(key), "There is no NJLINodeEntity with key " .. key)

  local nodeEntity = self._nodeEntityTable[key]
  assert(nodeEntity, "The nodeEntity is nil")
  -- assert(nodeEntity:getNode(), "The nodeEntity's node is nil")
  -- assert(nodeEntity:getNode():getStateMachine(), "The nodeEntity's, node's statemachine is nil")
  -- assert(nodeEntity:getNode():getStateMachine():getState(), "The nodeEntity's, node's statemachine's state is nil")

  return nodeEntity
end

function EntityManager:getSceneEntity(key)
  assert(self:hasSceneEntity(key), "There is no NJLISceneEntity with key " .. key)

  local sceneEntity = self._sceneEntityTable[key]
  assert(sceneEntity, "The sceneEntity is nil")
  -- assert(sceneEntity:getScene(), "The sceneEntity's scene is nil")
  -- assert(sceneEntity:getScene():getStateMachine(), "The sceneEntity's, scene's statemachine is nil")
  -- assert(sceneEntity:getScene():getStateMachine():getState(), "The sceneEntity's, scene's statemachine's state is nil")

  return sceneEntity
end

function EntityManager:getWorldEntity(key)
  assert(self:hasWorldEntity(key), "There is no NJLIWorldEntity with key " .. key)
  
  local worldEntity = self._worldEntityTable[key]
  assert(worldEntity, "The worldEntity is nil")
  -- assert(worldEntity:getWorld(), "The worldEntity's world is nil")
  -- assert(worldEntity:getWorld():getStateMachine(), "The worldEntity's, world's statemachine is nil")
  -- assert(worldEntity:getWorld():getStateMachine():getState(), "The worldEntity's, world's statemachine's state is nil")

  return worldEntity
end

function EntityManager:addNodeEntity(nodeEntity)
  local key = self:getNodeEntityKey(nodeEntity)
  assert(not self:hasNodeEntity(key), "Trying to overwrite a NJLINodeEntity with key " .. key)
  
  self._nodeEntityTable[key] = nodeEntity

  return key
end

function EntityManager:addSceneEntity(sceneEntity)
  local key = self:getSceneEntityKey(sceneEntity)
  assert(not self:hasSceneEntity(key), "Trying to overwrite a NJLISceneEntity with key " .. key)
  self._sceneEntityTable[key] = sceneEntity

  return key
end

function EntityManager:addWorldEntity(worldEntity)
  local key = self:getWorldEntityKey(worldEntity)
  assert(not self:hasWorldEntity(key), "Trying to overwrite a NJLIWorldEntity with key " .. key)
  self._worldEntityTable[key] = worldEntity

  return key
end

function EntityManager:removeNodeEntity(nodeEntity)
  local key = self:getNodeEntityKey(nodeEntity)
  assert(self:hasNodeEntity(key), "Trying to remove a NJLINodeEntity with key " .. key)

  self:getNodeEntity(key):destroy()

  self._nodeEntityTable[key] = nil
end

function EntityManager:removeSceneEntity(sceneEntity)
  local key = self:getSceneEntityKey(sceneEntity)
  assert(self:hasSceneEntity(key), "Trying to remove a NJLISceneEntity with key " .. key)

  self:getSceneEntity(key):destroy()

  self._sceneEntityTable[key] = nil
end

function EntityManager:removeWorldEntity(worldEntity)
  local key = self:getWorldEntityKey(worldEntity)
  assert(self:hasWorldEntity(key), "Trying to remove a NJLIWorldEntity with key " .. key)

  self:getWorldEntity(key):destroy()

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


function EntityManager:getNodeEntityKey(nodeEntity)
  assert(nodeEntity, "nodeEntity is nil")

  local key = nodeEntity:getNode():getName()
  return key
end

function EntityManager:getSceneEntityKey(sceneEntity)
  assert(sceneEntity, "sceneEntity is nil")

  local key = sceneEntity:getScene():getName()
  return key
end

function EntityManager:getWorldEntityKey(worldEntity)
  assert(worldEntity, "worldEntity is nil")

  local key = worldEntity:getWorld():getName()
  return key
end

  --]]

return EntityManager

