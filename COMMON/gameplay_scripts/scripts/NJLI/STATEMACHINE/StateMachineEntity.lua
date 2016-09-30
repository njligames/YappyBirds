local StateMachineEntity = {}
StateMachineEntity.__index = StateMachineEntity

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
--  __ctor()
--  __dtor()
--  __load()
--  __unLoad()
--#############################################################################

local NodeEntity = require "njli.statemachine.NodeEntity"
local NodeEntityState = require "njli.statemachine.NodeEntityState"

local SceneEntity = require "njli.statemachine.SceneEntity"
local SceneEntityState = require "njli.statemachine.SceneEntityState"

local WorldEntity = require "njli.statemachine.WorldEntity"
local WorldEntityState = require "njli.statemachine.WorldEntityState"

local EntityManager = require "njli.statemachine.EntityManager"

local __ctor = function(self, init)
	self._entityManager = EntityManager()
end

local __dtor = function(self)
	self._entityManager = nil
end

local __load = function(self)
    --TODO: load this Entity
end

local __unLoad = function(self)
    --TODO: unload this Entity
end

--############################################################################# 

function StateMachineEntity:getEntityManager()
    return self._entityManager
end

function StateMachineEntity:_worldEnterState()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:enter()
    end
end

function StateMachineEntity:_worldUpdateState(timeStep)
    assert(timeStep, "The timeStep is nil")

    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:update(timeStep)
    end
end

function StateMachineEntity:_worldExitState()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:exit()
    end
end

function StateMachineEntity:_worldOnMessage(message)
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:onMessage(message)
    end
end

function StateMachineEntity:_worldRenderHUD()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:renderHUD()
    end
end

function StateMachineEntity:_worldTouchDown(touches)
    assert(touches, "The touches is nil")

    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:touchDown(touches)
    end
end

function StateMachineEntity:_worldTouchUp(touches)
    assert(touches, "The touches is nil")

    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:touchUp(touches)
    end
end

function StateMachineEntity:_worldTouchMove(touches)
    assert(touches, "The touches is nil")

    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:touchMove(touches)
    end
end

function StateMachineEntity:_worldTouchCancelled(touches)
    assert(touches, "The touches is nil")

    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:touchCancelled(touches)
    end
end

function StateMachineEntity:_worldStateMachineEntityPause()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:pause()
    end
end

function StateMachineEntity:_worldStateMachineEntityUnPause()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:unPause()
    end
end

function StateMachineEntity:_worldKeyboardShow()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:keyboardShow()
    end
end

function StateMachineEntity:_worldKeyboardCancel()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:keyboardCancel()
    end
end

function StateMachineEntity:_worldKeyboardReturn(text)
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:keyboardReturn(text)
    end
end

function StateMachineEntity:_worldWillResignActive()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:willResignActive()
    end
end

function StateMachineEntity:_worldDidBecomeActive()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:didBecomeActive()
    end
end

function StateMachineEntity:_worldDidEnterBackground()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:didEnterBackground()
    end
end

function StateMachineEntity:_worldWillEnterForeground()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:willEnterForeground()
    end
end

function StateMachineEntity:_worldWillTerminate()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:willTerminate()
    end
end

function StateMachineEntity:_worldInterrupt()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:interrupt()
    end
end

function StateMachineEntity:_worldResumeInterrupt()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:resumeInterrupt()
    end
end

function StateMachineEntity:_worldReceivedMemoryWarning()
    local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())

    if worldEntity and worldEntity:hasState() then
        worldEntity:receivedMemoryWarning()
    end
end

function StateMachineEntity:_sceneEnterState(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:enter()
    end
end

function StateMachineEntity:_sceneUpdateState(scene, timeStep)
    assert(scene, "The scene is nil")
    assert(timeStep, "The timeStep is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:update(timeStep)
    end
end

function StateMachineEntity:_sceneExitState(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:exit()
    end
end

function StateMachineEntity:_sceneOnMessage(scene, message)
    assert(scene, "The scene is nil")
    assert(message, "The message is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:onMessage(message)
    end
end

function StateMachineEntity:_sceneRenderHUD(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:renderHUD()
    end
end

function StateMachineEntity:_sceneTouchDown(scene, touches)
    assert(scene, "The scene is nil")
    assert(touches, "The touches is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:touchDown(touches)
    end
end

function StateMachineEntity:_sceneTouchUp(scene, touches)
    assert(scene, "The scene is nil")
    assert(touches, "The touches is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:touchUp(touches)
    end
end

function StateMachineEntity:_sceneTouchMove(scene, touches)
    assert(scene, "The scene is nil")
    assert(touches, "The touches is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:touchMove(touches)
    end
end

function StateMachineEntity:_sceneTouchCancelled(scene, touches)
    assert(scene, "The scene is nil")
    assert(touches, "The touches is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:touchCancelled(touches)
    end
end

function StateMachineEntity:_sceneStateMachineEntityPause(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:pause()
    end
end

function StateMachineEntity:_sceneStateMachineEntityUnPause(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:unPause()
    end
end

function StateMachineEntity:_sceneKeyboardShow(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:keyboardShow()
    end
end

function StateMachineEntity:_sceneKeyboardCancel(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:keyboardCancel()
    end
end

function StateMachineEntity:_sceneKeyboardReturn(scene, text)
    assert(scene, "The scene is nil")
    assert(text, "The text is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:keyboardReturn(text)
    end
end

function StateMachineEntity:_sceneWillResignActive(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:willResignActive()
    end
end

function StateMachineEntity:_sceneDidBecomeActive(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:didBecomeActive()
    end
end

function StateMachineEntity:_sceneDidEnterBackground(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:didEnterBackground()
    end
end

function StateMachineEntity:_sceneWillEnterForeground(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:willEnterForeground()
    end
end

function StateMachineEntity:_sceneWillTerminate(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:willTerminate()
    end
end

function StateMachineEntity:_sceneInterrupt(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:interrupt()
    end
end

function StateMachineEntity:_sceneResumeInterrupt(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:resumeInterrupt()
    end
end

function StateMachineEntity:_sceneReceivedMemoryWarning(scene)
    assert(scene, "The scene is nil")

    local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

    if sceneEntity and sceneEntity:hasState() then
        sceneEntity:receivedMemoryWarning()
    end
end

function StateMachineEntity:_nodeEnterState(node)
    assert(node, "The node is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:enter()
    end
end

function StateMachineEntity:_nodeUpdateState(node, timeStep)
    assert(node, "The node is nil")
    assert(timeStep, "The timeStep is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:update(timeStep)
    end
end

function StateMachineEntity:_nodeExitState(node)
    assert(node, "The node is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:exit()
    end
end

function StateMachineEntity:_nodeOnMessage(node, message)
    assert(node, "The node is nil")
    assert(message, "The message is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:onMessage()
    end
end

function StateMachineEntity:_rayTouchDown(rayContact)
    assert(rayContact, "The rayContact is nil")

    local hitNode = rayContact:getHitNode()
    assert(hitNode, "The hitNode is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:touchDown(rayContact)
    end
end

function StateMachineEntity:_rayTouchUp(rayContact)
    assert(rayContact, "The rayContact is nil")

    local hitNode = rayContact:getHitNode()
    assert(hitNode, "The hitNode is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:touchUp(rayContact)
    end
end

function StateMachineEntity:_rayTouchMove(rayContact)
    assert(rayContact, "The rayContact is nil")

    local hitNode = rayContact:getHitNode()
    assert(hitNode, "The hitNode is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:touchMove(rayContact)
    end
end

function StateMachineEntity:_rayTouchCancelled(rayContact)
    assert(rayContact, "The rayContact is nil")

    local hitNode = rayContact:getHitNode()
    assert(hitNode, "The hitNode is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:touchCancelled(rayContact)
    end
end

function StateMachineEntity:_nodeCollide(node, otherNode, collisionPoint)
    assert(node, "The node is nil")
    assert(otherNode, "The otherNode is nil")
    assert(collisionPoint, "The collisionPoint is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:collide(otherNode, collisionPoint)
    end
end

function StateMachineEntity:_nodeNear(node, otherNode)
    assert(node, "The node is nil")
    assert(otherNode, "The otherNode is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:near(otherNode)
    end
end

function StateMachineEntity:_nodeActionUpdate(action, timeStep)
    assert(action, "The action is nil")
    assert(timeStep, "The timeStep is nil")

    local node = action:getParent()
    assert(node, "The node is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:actionUpdate(action, timeStep)
    end
end

function StateMachineEntity:_nodeActionComplete(action)
    assert(action, "The action is nil")

    local node = action:getParent()
    assert(node, "The node is nil")

    local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

    if nodeEntity and nodeEntity:hasState() then
        nodeEntity:actionComplete(action)
    end
end

function StateMachineEntity:pushWorldState(worldEntityState)
    error("todo")
end

function StateMachineEntity:pushSceneState(worldEntityState)
    error("todo")
end

function StateMachineEntity:pushNodeState(worldEntityState)
    error("todo")
end

--############################################################################# 
--End Custom Code
--#############################################################################


--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(StateMachineEntity, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:_create(...)
      return self
    end,
  })

function StateMachineEntity:className()
  return "StateMachineEntity"
end

function StateMachineEntity:class()
  return self
end

function StateMachineEntity:superClass()
  return nil
end

function StateMachineEntity:isa(theClass)
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

function StateMachineEntity:__gc()
  StateMachineEntity._destroy(self)
end

function StateMachineEntity:__tostring()
  local ret = self:className() .. " =\n{\n"
  
  for pos,val in pairs(self) do 
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function StateMachineEntity:_destroy()
  assert(not self.__StateMachineEntityCalledLoad, "Must unload before you destroy")
  
  __dtor(self)
end

function StateMachineEntity:_create(init)
  self.__StateMachineEntityCalledLoad = false
  
  __ctor(self, init)
end

function StateMachineEntity:load()
  __load(self)
  
  self.__StateMachineEntityCalledLoad = true
end

function StateMachineEntity:unLoad()
  assert(self.__StateMachineEntityCalledLoad, "Must load before unloading")
  
  __unLoad(self)
  self.__StateMachineEntityCalledLoad = false
end

return StateMachineEntity
