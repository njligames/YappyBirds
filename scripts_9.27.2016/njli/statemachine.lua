local EntityManager = require "njli.entitymanager"
require "njli.util"

local Game = {}
Game.__index = Game














local __ctor = function(self, init)
 
 self._entityManager = EntityManager()
end

local __dtor = function(self)
 
 self._entityManager = nil
end

local __load = function(self)
 
end

local __unLoad = function(self)
 
end

function Game:getEntityManager()
 return self._entityManager
end

function Game:_worldEnterState()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:enter()
 end
end

function Game:_worldUpdateState(timeStep)
 assert(timeStep, "The timeStep is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:update(timeStep)
 end
end

function Game:_worldExitState()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:exit()
 end
end

function Game:_worldOnMessage(message)
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:onMessage()
 end
end

function Game:_worldRenderHUD()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:renderHUD()
 end
end

function Game:_worldTouchDown(touches)
 assert(touches, "The touches is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:touchDown(touches)
 end
end

function Game:_worldTouchUp(touches)
 assert(touches, "The touches is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:touchUp(touches)
 end
end

function Game:_worldTouchMove(touches)
 assert(touches, "The touches is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:touchMove(touches)
 end
end

function Game:_worldTouchCancelled(touches)
 assert(touches, "The touches is nil")

 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:touchCancelled(touches)
 end
end

function Game:_worldGamePause()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:pause()
 end
end

function Game:_worldGameUnPause()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:unPause()
 end
end

function Game:_worldKeyboardShow()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:keyboardShow()
 end
end

function Game:_worldKeyboardCancel()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:keyboardCancel()
 end
end

function Game:_worldKeyboardReturn(text)
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:keyboardReturn(text)
 end
end

function Game:_worldWillResignActive()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:willResignActive()
 end
end

function Game:_worldDidBecomeActive()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:didBecomeActive()
 end
end

function Game:_worldDidEnterBackground()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:didEnterBackground()
 end
end

function Game:_worldWillEnterForeground()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:willEnterForeground()
 end
end

function Game:_worldWillTerminate()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:willTerminate()
 end
end

function Game:_worldInterrupt()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:interrupt()
 end
end

function Game:_worldResumeInterrupt()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:resumeInterrupt()
 end
end

function Game:_worldReceivedMemoryWarning()
 local worldEntity = self:getEntityManager():getWorldEntity(njli.World.getInstance():getName())
 
 if worldEntity and worldEntity:hasState() then
 worldEntity:receivedMemoryWarning()
 end
end



function Game:_sceneEnterState(scene)
 assert(scene, "The scene is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:enter()
 end
end

function Game:_sceneUpdateState(scene, timeStep)
 assert(scene, "The scene is nil")
 assert(timeStep, "The timeStep is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:update(timeStep)
 end
end

function Game:_sceneExitState(scene)
 assert(scene, "The scene is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:exit()
 end
end

function Game:_sceneOnMessage(scene, message)
 assert(scene, "The scene is nil")
 assert(message, "The message is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:onMessage(message)
 end
end

function Game:_sceneRenderHUD(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:renderHUD()
 end
end

function Game:_sceneTouchDown(scene, touches)
 assert(scene, "The scene is nil")
 assert(touches, "The touches is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:touchDown(touches)
 end
end

function Game:_sceneTouchUp(scene, touches)
 assert(scene, "The scene is nil")
 assert(touches, "The touches is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:touchUp(touches)
 end
end

function Game:_sceneTouchMove(scene, touches)
 assert(scene, "The scene is nil")
 assert(touches, "The touches is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:touchMove(touches)
 end
end

function Game:_sceneTouchCancelled(scene, touches)
 assert(scene, "The scene is nil")
 assert(touches, "The touches is nil")

 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:touchCancelled(touches)
 end
end

function Game:_sceneGamePause(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:pause()
 end
end

function Game:_sceneGameUnPause(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:unPause()
 end
end

function Game:_sceneKeyboardShow(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:keyboardShow()
 end
end

function Game:_sceneKeyboardCancel(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:keyboardCancel()
 end
end

function Game:_sceneKeyboardReturn(scene, text)
 assert(scene, "The scene is nil")
 assert(text, "The text is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:keyboardReturn(text)
 end
end

function Game:_sceneWillResignActive(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:willResignActive()
 end
end

function Game:_sceneDidBecomeActive(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:didBecomeActive()
 end
end

function Game:_sceneDidEnterBackground(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:didEnterBackground()
 end
end

function Game:_sceneWillEnterForeground(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:willEnterForeground()
 end
end

function Game:_sceneWillTerminate(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:willTerminate()
 end
end

function Game:_sceneInterrupt(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:interrupt()
 end
end

function Game:_sceneResumeInterrupt(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:resumeInterrupt()
 end
end

function Game:_sceneReceivedMemoryWarning(scene)
 assert(scene, "The scene is nil")
 
 local sceneEntity = self:getEntityManager():getSceneEntity(scene:getName())

 if sceneEntity and sceneEntity:hasState() then
 sceneEntity:receivedMemoryWarning()
 end
end



function Game:_nodeEnterState(node)
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:enter()
 end
end

function Game:_nodeUpdateState(node, timeStep)
 assert(node, "The node is nil")
 assert(timeStep, "The timeStep is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:update()
 end
end

function Game:_nodeExitState(node)
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:exit()
 end
end

function Game:_nodeOnMessage(node, message)
 assert(node, "The node is nil")
 assert(message, "The message is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:onMessage()
 end
end

function Game:_rayTouchDown(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:touchDown(rayContact)
 end
end

function Game:_rayTouchUp(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:touchUp(rayContact)
 end
end

function Game:_rayTouchMove(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:touchMove(rayContact)
 end
end

function Game:_rayTouchCancelled(rayContact)
 assert(rayContact, "The rayContact is nil")

 local hitNode = rayContact:getHitNode()
 assert(hitNode, "The hitNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(hitNode:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:touchCancelled(rayContact)
 end
end

function Game:_nodeCollide(node, otherNode, collisionPoint)
 assert(node, "The node is nil")
 assert(otherNode, "The otherNode is nil")
 assert(collisionPoint, "The collisionPoint is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:collide(otherNode, collisionPoint)
 end
end

function Game:_nodeNear(node, otherNode)
 assert(node, "The node is nil")
 assert(otherNode, "The otherNode is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:near(otherNode)
 end
end

function Game:_nodeActionUpdate(action, timeStep)
 assert(action, "The action is nil")
 assert(timeStep, "The timeStep is nil")

 local node = action:getParent()
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:actionUpdate(action, timeStep)
 end
end

function Game:_nodeActionComplete(action)
 assert(action, "The action is nil")

 local node = action:getParent()
 assert(node, "The node is nil")

 local nodeEntity = self:getEntityManager():getNodeEntity(node:getName())

 if nodeEntity and nodeEntity:hasState() then
 nodeEntity:actionComplete(action)
 end
end



function Game:update(timeStep)

end

function Game:render()

end

function Game:resize(width, height, orientation)
 
end

function Game:touchDown(touches)

end

function Game:touchUp(touches)

end

function Game:touchMove(touches)

end

function Game:touchCancelled(touches)

end










setmetatable(Game, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:_create(...)
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

function Game:__gc()
 Game._destroy(self)
end

function Game:__tostring()
 local ret = self:className() .. " =\n{\n"
 
 for pos,val in pairs(self) do 
 ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
 end

 return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Game:_destroy()
 assert(not self.__GameCalledLoad, "Must unload before you destroy")
 
 __dtor(self)
end

function Game:_create(init)
 self.__GameCalledLoad = false
 
 __ctor(self, init)
end

function Game:load()
 __load(self)
 
 self.__GameCalledLoad = true
end

function Game:unLoad()
 assert(self.__GameCalledLoad, "Must load before unloading")
 
 __unLoad(self)
 self.__GameCalledLoad = false
end

return Game
