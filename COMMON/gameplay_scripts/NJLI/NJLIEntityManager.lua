local NJLIEntityManager = {}
NJLIEntityManager.__index = NJLIEntityManager

local json = require('JSON')

setmetatable(NJLIEntityManager, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function NJLIEntityManager:className()
  return "NJLIEntityManager"
end

function NJLIEntityManager:class()
  return self
end

function NJLIEntityManager:superClass()
  return nil
end

function NJLIEntityManager:isa(theClass)
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

function NJLIEntityManager:destroy()
  NJLIEntityManager.__gc(self)
end

function NJLIEntityManager:create(init)
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

function NJLIEntityManager:__gc()
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

function NJLIEntityManager:__tostring()
  --TODO: Represent the class as a string...
  -- return "NJLIEntityManager"
  return json.encode(self)
end

--TODO: List the Functions for NJLIEntityManager
  ---[[
  --EXAMPLE:

function NJLIEntityManager:set_nodeEntityTable(newval)
  self._nodeEntityTable = newval
end

function NJLIEntityManager:get_nodeEntityTable()
  return self._nodeEntityTable
end

function NJLIEntityManager:set_sceneEntityTable(newval)
  self._sceneEntityTable = newval
end

function NJLIEntityManager:get_sceneEntityTable()
  return self._sceneEntityTable
end

function NJLIEntityManager:set_worldEntityTable(newval)
  self._worldEntityTable = newval
end

function NJLIEntityManager:get_worldEntityTable()
  return self._worldEntityTable
end

function NJLIEntityManager:getNodeEntity(key)
  assert(self:hasNodeEntity(key), "There is no NJLINodeEntity with key " .. key)

  local nodeEntity = self._nodeEntityTable[key]
  assert(nodeEntity, "The nodeEntity is nil")
  assert(nodeEntity:getNode(), "The nodeEntity's node is nil")
  assert(nodeEntity:getNode():getStateMachine(), "The nodeEntity's, node's statemachine is nil")
  assert(nodeEntity:getNode():getStateMachine():getState(), "The nodeEntity's, node's statemachine's state is nil")

  return nodeEntity
end

function NJLIEntityManager:getSceneEntity(key)
  assert(self:hasSceneEntity(key), "There is no NJLISceneEntity with key " .. key)

  local sceneEntity = self._sceneEntityTable[key]
  assert(sceneEntity, "The sceneEntity is nil")
  assert(sceneEntity:getScene(), "The sceneEntity's scene is nil")
  assert(sceneEntity:getScene():getStateMachine(), "The sceneEntity's, scene's statemachine is nil")
  assert(sceneEntity:getScene():getStateMachine():getState(), "The sceneEntity's, scene's statemachine's state is nil")

  return sceneEntity
end

function NJLIEntityManager:getWorldEntity(key)
  assert(self:hasWorldEntity(key), "There is no NJLIWorldEntity with key " .. key)
  
  local worldEntity = self._worldEntityTable[key]
  assert(worldEntity, "The worldEntity is nil")
  assert(worldEntity:getWorld(), "The worldEntity's world is nil")
  assert(worldEntity:getWorld():getStateMachine(), "The worldEntity's, world's statemachine is nil")
  assert(worldEntity:getWorld():getStateMachine():getState(), "The worldEntity's, world's statemachine's state is nil")

  return worldEntity
end

function NJLIEntityManager:addNodeEntity(nodeEntity)
  assert(nodeEntity, "nodeEntity is nil")

  local key = nodeEntity:getName()
  assert(not self:hasNodeEntity(key), "Trying to overwrite a NJLINodeEntity with key " .. key)
  
  self._nodeEntityTable[key] = nodeEntity

  return key
end

function NJLIEntityManager:addSceneEntity(sceneEntity)
  assert(sceneEntity, "sceneEntity is nil")

  local key = sceneEntity:getName()
  assert(not self:hasSceneEntity(key), "Trying to overwrite a NJLISceneEntity with key " .. key)
  self._sceneEntityTable[key] = sceneEntity

  return key
end

function NJLIEntityManager:addWorldEntity(worldEntity)
  assert(worldEntity, "sceneEntity is nil")

  local key = worldEntity:getName()
  assert(not self:hasWorldEntity(key), "Trying to overwrite a NJLIWorldEntity with key " .. key)
  self._worldEntityTable[key] = worldEntity

  return key
end

function NJLIEntityManager:removeNodeEntity(key)
  self:getNodeEntity(key):destroy()

  self._nodeEntityTable[key] = nil
end

function NJLIEntityManager:removeSceneEntity(key)
  self:getSceneEntity(key):destroy()

  self._sceneEntityTable[key] = nil
end

function NJLIEntityManager:removeWorldEntity(key)
  self:getWorldEntity(key):destroy()

  self._worldEntityTable[key] = nil
end

function NJLIEntityManager:hasNodeEntity(key)
  return (self._nodeEntityTable[key] ~= nil)
end

function NJLIEntityManager:hasSceneEntity(key)
  return (self._sceneEntityTable[key] ~= nil)
end

function NJLIEntityManager:hasWorldEntity(key)
  return (self._worldEntityTable[key] ~= nil)
end

  --]]

return NJLIEntityManager

