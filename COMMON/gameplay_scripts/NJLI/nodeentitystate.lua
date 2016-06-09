local NodeEntityState = {}
NodeEntityState.__index = NodeEntityState

local json = require('JSON')

setmetatable(NodeEntityState, {
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
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

function NodeEntityState:destroy()
  NodeEntityState.__gc(self)
end

--[[
local init =
{
  name = "name",
  entityOwner = nil
}
--]]
function NodeEntityState:create(init)
  --TODO: Create and initialize properties...
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name")
  assert(init.entityOwner, "Init variable is expecting a entityOwner")

  self._init = init

  self:load()
end

function NodeEntityState:__gc()
  --TODO: Destroy properties
  self:unLoad()
end

function NodeEntityState:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

function NodeEntityState:getNodeState()
  return self._nodeState
end

function NodeEntityState:getEntityOwner()
  return self._entityOwner
end

function NodeEntityState:load()
  self:unLoad()

  self._entityOwner = self._init.entityOwner
  self._nodeState = njli.NodeState.create()

  self:getNodeState():setName(self._init.name)
end

function NodeEntityState:unLoad()
  if self:getNodeState() then
    njli.NodeState.destroy(self:getNodeState())
  end
  self._nodeState = nil

  self._entityOwner = nil
end

function NodeEntityState:push()      
  self:getEntityOwner():getNode():getStateMachine():pushState(self:getNodeState())                       
end

function NodeEntityState:isIn()
  return self:getNodeState():getName() == self:getEntityOwner():getNode():getStateMachine():getState():getName()
end

function NodeEntityState:enter()                            assert(false, "overwrite: NodeEntityState:enter") end
function NodeEntityState:update(timeStep)                   assert(false, "overwrite: NodeEntityState:update") end
function NodeEntityState:exit()                             assert(false, "overwrite: NodeEntityState:exit") end
function NodeEntityState:onMessage(message)                 assert(false, "overwrite: NodeEntityState:onMessage") end
function NodeEntityState:touchDown(touches)                 assert(false, "overwrite: NodeEntityState:touchDown") end
function NodeEntityState:touchUp(touches)                   assert(false, "overwrite: NodeEntityState:touchUp") end
function NodeEntityState:touchMove(touches)                 assert(false, "overwrite: NodeEntityState:touchMove") end
function NodeEntityState:touchCancelled(touches)            assert(false, "overwrite: NodeEntityState:touchCancelled") end
function NodeEntityState:render()                           assert(false, "overwrite: NodeEntityState:render") end
function NodeEntityState:actionUpdate(action, timeStep)     assert(false, "overwrite: NodeEntityState:actionUpdate") end
function NodeEntityState:actionComplete(action)             assert(false, "overwrite: NodeEntityState:actionComplete") end
function NodeEntityState:collide(otherNode, collisionPoint) assert(false, "overwrite: NodeEntityState:collide") end
function NodeEntityState:near(otherNode)                    assert(false, "overwrite: NodeEntityState:near") end
function NodeEntityState:rayTouchDown(rayContact)           assert(false, "overwrite: NodeEntityState:rayTouchDown") end
function NodeEntityState:rayTouchUp(rayContact)             assert(false, "overwrite: NodeEntityState:rayTouchUp") end
function NodeEntityState:rayTouchMove(rayContact)           assert(false, "overwrite: NodeEntityState:rayTouchMove") end
function NodeEntityState:rayTouchCancelled(rayContact)      assert(false, "overwrite: NodeEntityState:rayTouchCancelled") end
function NodeEntityState:pause()                            assert(false, "overwrite: NodeEntityState:pause") end
function NodeEntityState:unPause()                          assert(false, "overwrite: NodeEntityState:unPause") end

return NodeEntityState
