local SceneEntity = {}
SceneEntity.__index = SceneEntity

local json = require('json')

setmetatable(SceneEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
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

function SceneEntity:destroy()
  SceneEntity.__gc(self)
end

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
  },
  startStateName = "",
}

function SceneEntity:create(init)
  assert(init, "init variable is nil.")
  assert(init.name, "Init variable is expecting a name value when creating " .. self:className())
  assert(init.states, "Init variable is expecting a states table when creating " .. self:className())
  assert(type(init.states) == "table", "Init variable is expecting a states table when creating " .. self:className())
  assert(init.startStateName, "Init variable is expecting a startStateName value when creating " .. self:className())

  self._startStateName = init.startStateName

  self._scene = njli.Scene.create()

  self:getScene():setName(init.name)

  self._stateEntityTable = {}
  if init then
    for k,v in pairs(init.states) do
      self:_addEntityState(v.name, v.module)
    end
  end

end

function SceneEntity:__gc()
  self:unLoad()
end

function SceneEntity:__tostring()

  return json:stringify(self)
end

function SceneEntity:_addEntityState(stateName, entityStateModule)
  local init =
  {
    name = stateName,
    entityOwner = self
  }
  self._stateEntityTable[stateName] = entityStateModule(init)
end

function SceneEntity:_removeEntityState(stateName)
  self:_getEntityState():destroy()
  self._stateEntityTable[stateName] = nil
end

function SceneEntity:_getEntityState(stateName)
  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

  return self._stateEntityTable[stateName]
end

function SceneEntity:_hasEntityState(stateName)
  return (self._stateEntityTable[stateName] ~= nil)
end

function SceneEntity:hasState()
  return self:getScene():getStateMachine():getState() ~= nil
end

function SceneEntity:getCurrentEntityState()
  assert(self:getScene():getStateMachine(), "message")
  assert(self:getScene():getStateMachine():getState(), "message")
  assert(self:getScene():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getScene():getStateMachine():getState():getName())
end

function SceneEntity:getStartSceneName()
  return self._startStateName
end

function SceneEntity:getScene()
  return self._scene
end

function SceneEntity:isLoaded()
  if self.loaded == nil then
    self.loaded = false
  end

  return self.loaded
end

function SceneEntity:load()
  -- print("SceneEntity:load()")

  for k,v in pairs(self._stateEntityTable) do
    v:load()
  end
  self.loaded = true
end

function SceneEntity:unLoad()
  -- print("SceneEntity:unLoad()")

  if self:getScene() then
    njli.Scene.destroy(self:getScene())
    self._scene = nil
  end

  if self._stateEntityTable then
    for k,v in pairs(self._stateEntityTable) do
      self:_getEntityState(v.name):unLoad()
      self:_removeEntityState(k)
    end
    self._stateEntityTable = nil
  end

  self.loaded = false
end

function SceneEntity:startStateMachine()
  if self:_getEntityState(self:getStartSceneName()) then
    
    --njli.World.getInstance():addScene(self:getScene())
    self:_getEntityState(self:getStartSceneName()):push()
    
  else
    print("\n\n\nself:getStartSceneName() is not found.\n\n\n")
  end
end

function SceneEntity:enter()
  self:getCurrentEntityState():enter()
end

function SceneEntity:update(timeStep)
  self:getCurrentEntityState():update(timeStep)
end

function SceneEntity:exit()
  self:getCurrentEntityState():exit()
end

function SceneEntity:onMessage(message)
  self:getCurrentEntityState():onMessage(touches)
end

function SceneEntity:touchDown(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchDown(touches)
  end
end

function SceneEntity:touchUp(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchUp(touches)
  end
end

function SceneEntity:touchMove(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchMove(touches)
  end
end

function SceneEntity:touchCancelled(touches)
  if self:hasState() then
    self:getCurrentEntityState():touchCancelled(touches)
  end
end

function SceneEntity:renderHUD()
  if self:hasState() then
    self:getCurrentEntityState():renderHUD()
  end
end

function SceneEntity:pause()
  if self:hasState() then
    self:getCurrentEntityState():pause()
  end
end

function SceneEntity:unPause()
  if self:hasState() then
    self:getCurrentEntityState():unPause()
  end
end

return SceneEntity
