local SceneEntity = require "njli.statemachine.sceneentity"

local BirdEntity = {}
BirdEntity.__index = BirdEntity

local json = require('json')

setmetatable(BirdEntity, {
    __index = SceneEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function BirdEntity:className()
  return "BirdEntity"
end

function BirdEntity:class()
  return self
end

function BirdEntity:superClass()
  return SceneEntity
end

function BirdEntity:isa(theClass)
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

function BirdEntity:destroy()
  BirdEntity.__gc(self)
  SceneEntity.destroy(self)
end

function BirdEntity:create(init)

  -- local sceneEntityInit =
  -- {
  -- name = init.name,
  -- states =
  -- {
  -- {
  -- name = "LoadingGameplaySceneEntityState",
  -- module = require "yappybirds.scenes.GameplayScene.states.LoadingGameplaySceneEntityState"
  -- },
  -- {
  -- name = "AchievementsSceneEntityState",
  -- module = require "yappybirds.scenes.GameplayScene.states.LoseSceneEntityState"
  -- },
  -- {
  -- name = "BoardselectSceneEntityState",
  -- module = require "yappybirds.scenes.GameplayScene.states.PauseSceneEntityState"
  -- },
  -- {
  -- name = "CharactersSceneEntityState",
  -- module = require "yappybirds.scenes.GameplayScene.states.PlayingSceneEntityState"
  -- },
  -- {
  -- name = "HighScoresSceneEntityState",
  -- module = require "yappybirds.scenes.GameplayScene.states.WinSceneEntityState"
  -- },
  -- },

  -- startStateName = "LoadingGameplaySceneEntityState",
  -- gameInstance = init.gameInstance
  -- }

  local nodeEntityInit =
  {
    name = "BirdEntity",
    states =
    {
      {
        name = "Fly",
        module = "yappybirds.nodes.Balloon.states.Fly"
      },
      {
        name = "Grabbed",
        module = "yappybirds.nodes.Balloon.states.Grabbed"
      },
      {
        name = "Grabbing",
        module = "yappybirds.nodes.Balloon.states.Grabbing"
      },
      {
        name = "Hit",
        module = "yappybirds.nodes.Balloon.states.Hit"
      },
      {
        name = "Pursue",
        module = "yappybirds.nodes.Balloon.states.Pursue"
      },
      {
        name = "Spawn",
        module = "yappybirds.nodes.Balloon.states.Spawn"
      },
    },
    physicsShape = nil,
    physicsBody = nil,
    sharedGeometry = nil,
  }

  NodeEntity.create(self, nodeEntityInit)

  print(" GameplaySceneEntity:create(init)")
end

function BirdEntity:__gc()
  self:unLoad()
end

function BirdEntity:__tostring()

  return json:stringify(self)
end

--function BirdEntity:_addEntityState(stateName, entityStateModule)
--  local init =
--  {
--    name = stateName,
--    entityOwner = self
--  }
--  self._stateEntityTable[stateName] = entityStateModule(init)
--end

--function BirdEntity:_removeEntityState(stateName)
--  self:_getEntityState():destroy()
--  self._stateEntityTable[stateName] = nil
--end

--function BirdEntity:_getEntityState(stateName)
--  assert(self._stateEntityTable[stateName], "There must be a state with name: " .. stateName)

--  return self._stateEntityTable[stateName]
--end

--function BirdEntity:_hasEntityState(stateName)
--  return (self._stateEntityTable[stateName] ~= nil)
--end

function BirdEntity:hasState()
--  return self:getNode():getStateMachine():getState() ~= nil
  return NodeEntity.hasState(self)
end

function BirdEntity:getCurrentEntityState()
  assert(self:getNode():getStateMachine(), "message")
  assert(self:getNode():getStateMachine():getState(), "message")
  assert(self:getNode():getStateMachine():getState():getName(), "message")

  return self:_getEntityState(self:getNode():getStateMachine():getState():getName())
end

function BirdEntity:pushState(stateName)
  return NodeEntity.pushState(self, stateName)
end

function BirdEntity:getNode()
  return NodeEntity.getNode(self)
end

function BirdEntity:getPhysicsShape()
  return NodeEntity.getPhysicsShape(self)
end

function BirdEntity:getPhysicsBody()
  return NodeEntity.getPhysicsBody(self)
end

function BirdEntity:getAction()
  return NodeEntity.getAction(self)
end

function BirdEntity:getClock()
  return NodeEntity.getClock(self)
end

function BirdEntity:isLoaded()
  return NodeEntity.isLoaded(self)
end

function BirdEntity:load()
  NodeEntity.load(self)
end

function BirdEntity:unLoad()
  NodeEntity.unLoad(self)
end

function BirdEntity:startStateMachine()
  NodeEntity.startStateMachine(self)
end

function BirdEntity:enter()
  NodeEntity.enter(self)
end

function BirdEntity:update(timeStep)
  NodeEntity.update(self, timeStep)
end

function BirdEntity:exit()
  NodeEntity.exit(self)
end

function BirdEntity:onMessage(message)
  NodeEntity.update(self, message)
end

function BirdEntity:touchDown(touches)
  NodeEntity.touchDown(self, touches)
end

function BirdEntity:touchUp(touches)
  NodeEntity.touchUp(self, touches)
end

function BirdEntity:touchMove(touches)
  NodeEntity.touchMove(self, touches)
end

function BirdEntity:touchCancelled(touches)
  NodeEntity.touchCancelled(self, touches)
end

function BirdEntity:render()
  NodeEntity.render(self)
end

function BirdEntity:actionUpdate(action, timeStep)
  NodeEntity.actionUpdate(self, action, timeStep)
end

function BirdEntity:actionComplete(action)
  NodeEntity.actionComplete(self, action)
end

function BirdEntity:collide(otherNode, collisionPoint)
  NodeEntity.collide(self, otherNode, collisionPoint)
end

function BirdEntity:near(otherNode)
  NodeEntity.near(self, otherNode)
end

function BirdEntity:rayTouchDown(rayContact)
  NodeEntity.rayTouchDown(self, rayContact)
end

function BirdEntity:rayTouchUp(rayContact)
  NodeEntity.rayTouchUp(self, rayContact)
end

function BirdEntity:rayTouchMove(rayContact)
  NodeEntity.rayTouchMove(self, rayContact)
end

function BirdEntity:rayTouchCancelled(rayContact)
  NodeEntity.rayTouchCancelled(self, rayContact)
end

function BirdEntity:pause()
  NodeEntity.pause(self)
end

function BirdEntity:unPause()
  NodeEntity.unPause(self)
end

return BirdEntity
