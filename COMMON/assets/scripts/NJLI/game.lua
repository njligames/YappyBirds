local Game = {}
Game.__index = Game

local json = require('json')

setmetatable(Game, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function Game:className()
 return "Game"
end

function Game:class()
 return self
end

function Game:superClass()
 return nil
end

function Game:isa(theClass)
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

function Game:destroy()
 Game.__gc(self)
end

function Game:create(init)
 
 
 
 local EntityManager = require "njli.entitymanager"
 self._entityManager = EntityManager()
 

 if init then
 
 end
end

function Game:__gc()
 
 self._entityManager:destroy()
end

function Game:__tostring()
 
 
 return json:stringify(self)
end


 
 



function Game:getEntityManager()
 return self._entityManager
end


function Game:worldKeyboardShow()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:keyboardShow()
end

function Game:worldKeyboardCancel()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:keyboardCancel()
end

function Game:worldKeyboardReturn(text)
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:keyboardReturn(text)
end

function Game:worldReceivedMemoryWarning()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:receivedMemoryWarning()
end

function Game:worldGamePause()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:pause()
end

function Game:worldGameUnPause()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:unPause()
end

function Game:worldRenderHUD()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:renderHUD()
end

function Game:worldEnterState()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:enter()
end

function Game:worldUpdateState(timeStep)
 assert(timeStep, "The timeStep is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:update(timeStep)
end

function Game:worldExitState()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:exit()
end

function Game:worldOnMessage(message)
 assert(message, "The message is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:onMessage()
end

function Game:worldTouchDown(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchDown(touches)
end

function Game:worldTouchUp(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchUp(touches)
end

function Game:worldTouchMove(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchMove(touches)
end

function Game:worldTouchCancelled(touches)
 assert(touches, "The touches is nil")
 
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 worldEntity:touchCancelled(touches)
end






function Game:sceneEnterState(scene)
 assert(scene, "The scene is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:enter()
end

function Game:sceneUpdateState(scene, timeStep)
 assert(scene, "The scene is nil")
 assert(timeStep, "The timeStep is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:update(timeStep)
end

function Game:sceneExitState(scene)
 assert(scene, "The scene is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:exit()
end

function Game:sceneOnMessage(scene, message)
 assert(scene, "The scene is nil")
 assert(message, "The message is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())
 sceneEntity:onMessage(message)
end



function Game:nodeEnterState(node)
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:enter()
end

function Game:nodeUpdateState(node, timeStep)
 assert(node, "The node is nil")
 assert(timeStep, "The timeStep is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:update()
end

function Game:nodeExitState(node)
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:exit()
end

function Game:nodeOnMessage(node, message)
 assert(node, "The node is nil")
 assert(message, "The message is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:onMessage()
end

function Game:nodeCollide(node, otherNode, collisionPoint)
 assert(node, "The node is nil")
 assert(otherNode, "The otherNode is nil")
 assert(collisionPoint, "The collisionPoint is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:collide(otherNode, collisionPoint)
end

function Game:nodeNear(node, otherNode)
 assert(node, "The node is nil")
 assert(otherNode, "The otherNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:near(otherNode)
end

function Game:nodeActionUpdate(action, timeStep)
 assert(action, "The action is nil")
 assert(timeStep, "The timeStep is nil")

 local node = action:getParent()
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:actionUpdate(action, timeStep)
end

function Game:nodeActionComplete(action)
 assert(action, "The action is nil")

 local node = action:getParent()
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())
 nodeEntity:actionComplete(action)
end




function Game:rayTouchDown(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchDown(rayContact)
end

function Game:rayTouchUp(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchUp(rayContact)
end

function Game:rayTouchMove(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchMove(rayContact)
end

function Game:rayTouchCancelled(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())
 nodeEntity:touchCancelled(rayContact)
end

 

return Game
