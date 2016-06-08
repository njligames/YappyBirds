local NJLIGame = {}
NJLIGame.__index = NJLIGame

local json = require('JSON')

setmetatable(NJLIGame, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function NJLIGame:className()
 return "NJLIGame"
end

function NJLIGame:class()
 return self
end

function NJLIGame:superClass()
 return nil
end

function NJLIGame:isa(theClass)
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

function NJLIGame:destroy()
 NJLIGame.__gc(self)
end

function NJLIGame:create(init)
 
 
 
 local NJLIEntityManager = require "njli.njlientitymanager"
 self._entityManager = NJLIEntityManager()
 

 if init then
 
 end
end

function NJLIGame:__gc()
 
 self._entityManager:destroy()
end

function NJLIGame:__tostring()
 
 
 return json.encode(self)
end


 
 



function NJLIGame:getEntityManager()
 return self._entityManager
end


function NJLIGame:worldKeyboardShow()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:keyboardShow()
end

function NJLIGame:worldKeyboardCancel()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:keyboardCancel()
end

function NJLIGame:worldKeyboardReturn(text)
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:keyboardReturn(text)
end

function NJLIGame:worldReceivedMemoryWarning()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:receivedMemoryWarning()
end

function NJLIGame:worldGamePause()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:pause()
end

function NJLIGame:worldGameUnPause()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:unPause()
end

function NJLIGame:worldRenderHUD()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:renderHUD()
end

function NJLIGame:worldEnterState()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:enter()
end

function NJLIGame:worldUpdateState(timeStep)
 assert(timeStep, "The timeStep is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:update(timeStep)
end

function NJLIGame:worldExitState()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:exit()
end

function NJLIGame:worldOnMessage(message)
 assert(message, "The message is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:onMessage()
end

function NJLIGame:worldTouchDown(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchDown(touches)
end

function NJLIGame:worldTouchUp(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchUp(touches)
end

function NJLIGame:worldTouchMove(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchMove(touches)
end

function NJLIGame:worldTouchCancelled(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchCancelled(touches)
end






function NJLIGame:sceneEnterState(scene)
 assert(scene, "The scene is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:enter()
end

function NJLIGame:sceneUpdateState(scene, timeStep)
 assert(scene, "The scene is nil")
 assert(timeStep, "The timeStep is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:update(timeStep)
end

function NJLIGame:sceneExitState(scene)
 assert(scene, "The scene is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:exit()
end

function NJLIGame:sceneOnMessage(scene, message)
 assert(scene, "The scene is nil")
 assert(message, "The message is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:onMessage(message)
end



function NJLIGame:nodeEnterState(node)
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:enter()
end

function NJLIGame:nodeUpdateState(node, timeStep)
 assert(node, "The node is nil")
 assert(timeStep, "The timeStep is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:update()
end

function NJLIGame:nodeExitState(node)
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:exit()
end

function NJLIGame:nodeOnMessage(node, message)
 assert(node, "The node is nil")
 assert(message, "The message is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:onMessage()
end

function NJLIGame:nodeCollide(node, otherNode, collisionPoint)
 assert(node, "The node is nil")
 assert(otherNode, "The otherNode is nil")
 assert(collisionPoint, "The collisionPoint is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:collide(otherNode, collisionPoint)
end

function NJLIGame:nodeNear(node, otherNode)
 assert(node, "The node is nil")
 assert(otherNode, "The otherNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:near(otherNode)
end

function NJLIGame:nodeActionUpdate(action, timeStep)
 assert(action, "The action is nil")
 assert(timeStep, "The timeStep is nil")

 local node = action:getParent()
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:actionUpdate(action, timeStep)
end

function NJLIGame:nodeActionComplete(action)
 assert(action, "The action is nil")

 local node = action:getParent()
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:actionComplete(action)
end




function NJLIGame:rayTouchDown(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchDown(rayContact)
end

function NJLIGame:rayTouchUp(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchUp(rayContact)
end

function NJLIGame:rayTouchMove(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchMove(rayContact)
end

function NJLIGame:rayTouchCancelled(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchCancelled(rayContact)
end

 

return NJLIGame
