local njligame = require "njli.game"
local njliGameInstance = njligame()
local game = require "game"

local init = 
{
 gameInstance = njliGameInstance,
}

local yappyGame = game(init)
yappyGame:start()

function WorldKeyboardShow()
 njliGameInstance:worldKeyboardShow()
end

function WorldKeyboardCancel()
 njliGameInstance:worldKeyboardCancel()
end

function WorldKeyboardReturn(text)
 njliGameInstance:worldKeyboardReturn(text)
end

function WorldReceivedMemoryWarning()
 njliGameInstance:worldReceivedMemoryWarning()
end

function WorldGamePause()
 njliGameInstance:worldGamePause()
end

function WorldGameUnPause()
 njliGameInstance:worldGameUnPause()
end

function WorldRenderHUD()
 njliGameInstance:worldRenderHUD()
end

function WorldEnterState()
 njliGameInstance:worldEnterState()
end

function WorldUpdateState(timeStep)
 njliGameInstance:worldUpdateState(timeStep)
end

function WorldExitState()
 njliGameInstance:worldExitState()
end

function WorldOnMessage(message)
 njliGameInstance:worldOnMessage(message)
end

function WorldTouchDown(touches)
 njliGameInstance:worldTouchDown(touches)
end

function WorldTouchUp(touches)
 njliGameInstance:worldTouchUp(touches)
end

function WorldTouchMove(touches)
 njliGameInstance:worldTouchMove(touches)
end

function WorldTouchCancelled(touches)
 njliGameInstance:worldTouchCancelled(touches)
end



function SceneEnterState(scene)
 njliGameInstance:sceneEnterState(scene)
end

function SceneUpdateState(scene, timeStep)
 njliGameInstance:sceneUpdateState(scene, timeStep)
end

function SceneExitState(scene)
 njliGameInstance:sceneExitState(scene)
end

function SceneOnMessage(scene, message)
 njliGameInstance:sceneOnMessage(scene, message)
end




function NodeEnterState(node)
 njliGameInstance:nodeEnterState(node)
end

function NodeUpdateState(node, timeStep)
 njliGameInstance:nodeUpdateState(node, timeStep)
end

function NodeExitState(node)
 njliGameInstance:nodeExitState(node)
end

function NodeOnMessage(node, message)
 njliGameInstance:nodeOnMessage(node, message)
end

function NodeCollide(node, otherNode, collisionPoint)
 njliGameInstance:nodeCollide(node, otherNode, collisionPoint)
end

function NodeNear(node, otherNode)
 njliGameInstance:nodeNear(node, otherNode)
end

function NodeActionUpdate(action, timeStep)
 njliGameInstance:nodeActionUpdate(action, timeStep)
end

function NodeActionComplete(action)
 njliGameInstance:nodeActionComplete(node)
end

function NodeRayTouchDown(rayContact)
 njliGameInstance:rayTouchDown(rayContact)
end

function NodeRayTouchUp(rayContact)
 njliGameInstance:rayTouchUp(rayContact)
end

function NodeRayTouchMove(rayContact)
 njliGameInstance:rayTouchMove(rayContact)
end

function NodeRayTouchCancelled(rayContact)
 njliGameInstance:rayTouchCancelled(rayContact)
end

















































































 















































































































































