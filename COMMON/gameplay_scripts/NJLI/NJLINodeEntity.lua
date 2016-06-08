local NJLINodeEntity = {}
NJLINodeEntity.__index = NJLINodeEntity

local json = require('JSON')

setmetatable(NJLINodeEntity, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function NJLINodeEntity:className()
  return "NJLINodeEntity"
end

function NJLINodeEntity:class()
  return self
end

function NJLINodeEntity:superClass()
  return nil
end

function NJLINodeEntity:isa(theClass)
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

function NJLINodeEntity:destroy()
  NJLINodeEntity.__gc(self)
end
--[[
    local init = 
    {
      name = "name",
      states =
      {
        {
            name = "Spawn", 
            module = "nodes.bird.states.spawn"
        },
        {
            name = "Fly", 
            module = "nodes.bird.states.fly"
        },
        {
            name = "Pursue", 
            module = "nodes.bird.states.pursue"
        },
        {
            name = "Hit", 
            module = "nodes.bird.states.hit"
        },
        {
            name = "Grabbing", 
            module = "nodes.bird.states.grabbing"
        },
        {
            name = "Grabbed", 
            module = "nodes.bird.states.grabbed"
        },
      },--end states
      physicsShape = nil, --Create the physics shape
      physicsBody = nil, --Create the physics body
      sharedGeometry = nil,
    }
  --]]
function NJLINodeEntity:create(init)
  --TODO: Create and initialize properties...
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value")
  assert(init.states, "Init variable is expecting a states table")
  assert(type(init.states) == "table", "Init variable is expecting a states table")
  assert(init.physicsShape, "Init variable is expecting a physicsShape value")
  assert(init.physicsBody, "Init variable is expecting a physicsBody value")
  assert(init.sharedGeometry, "Init variable is expecting a sharedGeometry value")

  self._init = init

  self:load()
end

function NJLINodeEntity:__gc()
  self:unLoad()
end

function NJLINodeEntity:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

function NJLINodeEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function NJLINodeEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function NJLINodeEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function NJLINodeEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function NJLINodeEntity:getCurrentEntityState()
  assert(self:getNode():getStateMachine(), "message")
  assert(self:getNode():getStateMachine():getState(), "message")
  assert(self:getNode():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getNode():getStateMachine():getState():getName())
end

function NJLINodeEntity:getNode()
  return self._node
end

function NJLINodeEntity:getPhysicsShape()
  return self._physicsShape
end

function NJLINodeEntity:getPhysicsBody()
  return self._physicsBody
end

function NJLINodeEntity:getAction()
  return self._action
end

function NJLINodeEntity:getClock()
  return self._clock
end

function NJLINodeEntity:load()
  self:unLoad()
  
  self._stateEntityTable = {}
  for k,v in pairs(self._init.states) do
    local m = require v.module

    self:_addEntityState(v.name, m)
  end

  self._node = njli.Node.create()
  self:getNode():setName(self._init.name)

  self._physicsShape = self._init.physicsShape
  self._physicsBody = self._init.physicsBody

  self._action = njli.Action.create()
  self._clock = njli.Clock.create()

  self._sharedGeometry = self._init.sharedGeometry
end

function NJLINodeEntity:unLoad()
  if self:getClock() then
    njli.Clock.destroy(self:getClock())
    self._clock = nil
  end

  if self:getAction() then
    njli.Action.destroy(self:getAction())
    self._action = nil
  end

  if self:getPhysicsBody() then
    njli.PhysicsBody.destroy(self:getPhysicsBody())
    self._physicsBody = nil
  end

  if self:getPhysicsShape() then
    njli.PhysicsShape.destroy(self:getPhysicsShape())
    self._physicsShape = nil
  end

  if self:getNode() then
    njli.Node.destroy(self:getNode())
    self._node = nil
  end

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

end

function NJLINodeEntity:initialize()
end

function NJLINodeEntity:enter()
  self:getCurrentEntityState():enter()
end

function NJLINodeEntity:update(timeStep)
  self:getCurrentEntityState():update(timeStep)
end

function NJLINodeEntity:exit()
  self:getCurrentEntityState():exit()
end

function NJLINodeEntity:onMessage(message)
  self:getCurrentEntityState():onMessage(message)
end

function NJLINodeEntity:touchDown(touches)
  self:getCurrentEntityState():touchDown(touches)
end

function NJLINodeEntity:touchUp(touches)
  self:getCurrentEntityState():touchUp(touches)
end

function NJLINodeEntity:touchMove(touches)
  self:getCurrentEntityState():touchMove(touches)
end

function NJLINodeEntity:touchCancelled(touches)
  self:getCurrentEntityState():touchCancelled(touches)
end

function NJLINodeEntity:render()
  self:getCurrentEntityState():render()
end

function NJLINodeEntity:actionUpdate(action, timeStep)
  self:getCurrentEntityState():actionUpdate(action, timeStep)
end

function NJLINodeEntity:actionComplete(action)
  self:getCurrentEntityState():actionComplete(action)
end

function NJLINodeEntity:collide(otherNode, collisionPoint)
  self:getCurrentEntityState():collide(otherNode, collisionPoint)
end

function NJLINodeEntity:near(otherNode)
  self:getCurrentEntityState():near(otherNode)
end

function NJLINodeEntity:rayTouchDown(rayContact)
  self:getCurrentEntityState():rayTouchDown(rayContact)
end

function NJLINodeEntity:rayTouchUp(rayContact)
  self:getCurrentEntityState():rayTouchUp(rayContact)
end

function NJLINodeEntity:rayTouchMove(rayContact)
  self:getCurrentEntityState():rayTouchMove(rayContact)
end

function NJLINodeEntity:rayTouchCancelled(rayContact)
  self:getCurrentEntityState():rayTouchCancelled(rayContact)
end

function NJLINodeEntity:pause()
  self:getCurrentEntityState():pause()
end

function NJLINodeEntity:unPause()
  self:getCurrentEntityState():unPause()
end

return NJLINodeEntity
