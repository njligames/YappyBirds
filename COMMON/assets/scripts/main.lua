local origAssert = assert
assert = function(b, message) 
  if not b then
    print(debug.traceback())
  end
  origAssert (b, message)
end

local MyGame = require "YappyGame"

local njligame = require "njli.game"
njliGameInstance = njligame()

mygame = MyGame({
 gameInstance = njliGameInstance,
})
mygame:startStateMachine()

--##############################################################################

function __NJLIWorldEnterState()
--  print("__NJLIWorldEnterState")
  njliGameInstance:worldEnterState()
end

function __NJLIWorldUpdateState(timeStep)
--  print("__NJLIWorldUpdateState")
  njliGameInstance:worldUpdateState(timeStep)
end

function __NJLIWorldExitState()
--  print("__NJLIWorldExitState")
  njliGameInstance:worldExitState()
end

function __NJLIWorldOnMessage(message)
--  print("__NJLIWorldOnMessage")
  njliGameInstance:worldOnMessage(message)
end

function __NJLIWorldKeyboardShow()
--  print("__NJLIWorldKeyboardShow")
  njliGameInstance:worldKeyboardShow()
end

function __NJLIWorldKeyboardCancel()
--  print("__NJLIWorldKeyboardCancel")
  njliGameInstance:worldKeyboardCancel()
end

function __NJLIWorldKeyboardReturn(text)
--  print("__NJLIWorldKeyboardReturn")
  njliGameInstance:worldKeyboardReturn(text)
end

function __NJLIWorldReceivedMemoryWarning()
--  print("__NJLIWorldReceivedMemoryWarning")
  njliGameInstance:worldReceivedMemoryWarning()
end

function __NJLIWorldGamePause()
--  print("__NJLIWorldGamePause")
  njliGameInstance:worldGamePause()
end

function __NJLIWorldGameUnPause()
--  print("__NJLIWorldGameUnPause")
  njliGameInstance:worldGameUnPause()
end

function __NJLIWorldRenderHUD()
--  print("__NJLIWorldRenderHUD")
  njliGameInstance:worldRenderHUD()
end

function __NJLIWorldTouchDown(touches)
--  print("__NJLIWorldTouchDown")
  njliGameInstance:worldTouchDown(touches)
end

function __NJLIWorldTouchUp(touches)
--  print("__NJLIWorldTouchUp")
  njliGameInstance:worldTouchUp(touches)
end

function __NJLIWorldTouchMove(touches)
--  print("__NJLIWorldTouchMove")
  njliGameInstance:worldTouchMove(touches)
end

function __NJLIWorldTouchCancelled(touches)
--  print("__NJLIWorldTouchCancelled")
  njliGameInstance:worldTouchCancelled(touches)
end

--##############################################################################

function __NJLISceneEnterState(scene)
--  print("__NJLISceneEnterState")
  njliGameInstance:sceneEnterState(scene)
end

function __NJLISceneUpdateState(scene, timeStep)
--  print("__NJLISceneUpdateState")
  njliGameInstance:sceneUpdateState(scene, timeStep)
end

function __NJLISceneExitState(scene)
--  print("__NJLISceneExitState")
  njliGameInstance:sceneExitState(scene)
end

function __NJLISceneOnMessage(scene, message)
--  print("__NJLISceneOnMessage")
  njliGameInstance:sceneOnMessage(scene, message)
end

function __NJLISceneKeyboardShow(scene)
--  print("__NJLISceneKeyboardShow")
  njliGameInstance:sceneKeyboardShow(scene)
end

function __NJLISceneKeyboardCancel(scene)
--  print("__NJLISceneKeyboardCancel")
  njliGameInstance:sceneKeyboardCancel(scene)
end

function __NJLISceneKeyboardReturn(scene, text)
--  print("__NJLISceneKeyboardReturn")
  njliGameInstance:sceneKeyboardReturn(scene, text)
end

function __NJLISceneRenderHUD(scene)
--  print("__NJLISceneRenderHUD")
  njliGameInstance:sceneRenderHUD(scene)
end

function __NJLISceneGamePause(scene)
--  print("__NJLISceneGamePause")
  njliGameInstance:sceneGamePause(scene)
end

function __NJLISceneGameUnPause(scene)
--  print("__NJLISceneGameUnPause")
  njliGameInstance:sceneGameUnPause(scene)
end

function __NJLISceneTouchDown(scene, touches)
--  print("__NJLISceneTouchDown")
  njliGameInstance:sceneTouchDown(scene, touches)
end

function __NJLISceneTouchUp(scene, touches)
--  print("__NJLIWorldTouchUp")
  njliGameInstance:sceneTouchUp(scene, touches)
end

function __NJLISceneTouchMove(scene, touches)
--  print("__NJLISceneTouchMove")
  njliGameInstance:sceneTouchMove(scene, touches)
end

function __NJLISceneTouchCancelled(scene, touches)
--  print("__NJLISceneTouchCancelled")
  njliGameInstance:sceneTouchCancelled(scene, touches)
end

--##############################################################################

function __NJLINodeEnterState(node)
--  print("__NJLINodeEnterState")
  njliGameInstance:nodeEnterState(node)
end

function __NJLINodeUpdateState(node, timeStep)
--  print("__NJLINodeUpdateState")
  njliGameInstance:nodeUpdateState(node, timeStep)
end

function __NJLINodeExitState(node)
--  print("__NJLINodeExitState")
  njliGameInstance:nodeExitState(node)
end

function __NJLINodeOnMessage(node, message)
--  print("__NJLINodeOnMessage")
  njliGameInstance:nodeOnMessage(node, message)
end

function __NJLINodeCollide(node, otherNode, collisionPoint)
--  print("__NJLINodeCollide")
  njliGameInstance:nodeCollide(node, otherNode, collisionPoint)
end

function __NJLINodeNear(node, otherNode)
--  print("__NJLINodeNear")
  njliGameInstance:nodeNear(node, otherNode)
end

function __NJLINodeActionUpdate(action, timeStep)
--  print("__NJLINodeActionUpdate")
  njliGameInstance:nodeActionUpdate(action, timeStep)
end

function __NJLINodeActionComplete(action)
--  print("__NJLINodeActionComplete")
  njliGameInstance:nodeActionComplete(node)
end

function __NJLINodeRayTouchDown(rayContact)
--  print("__NJLINodeRayTouchDown")
  njliGameInstance:rayTouchDown(rayContact)
end

function __NJLINodeRayTouchUp(rayContact)
--  print("__NJLINodeRayTouchUp")
  njliGameInstance:rayTouchUp(rayContact)
end

function __NJLINodeRayTouchMove(rayContact)
--  print("__NJLINodeRayTouchMove")
  njliGameInstance:rayTouchMove(rayContact)
end

function __NJLINodeRayTouchCancelled(rayContact)
--  print("__NJLINodeRayTouchCancelled")
  njliGameInstance:rayTouchCancelled(rayContact)
end

--##############################################################################

function __NJLIGameWillResignActive()
  print("__NJLIGameWillResignActive")
  mygame:gameWillResignActive()
end

function __NJLIGameDidBecomeActive()
  print("__NJLIGameDidBecomeActive")
  mygame:gameDidBecomeActive()
end

function __NJLIGameDidEnterBackground()
  print("__NJLIGameDidEnterBackground")
  mygame:gameDidEnterBackground()
end

function __NJLIGameWillEnterForeground()
  print("__NJLIGameWillEnterForeground")
  mygame:gameWillEnterForeground()
end

function __NJLIGameWillTerminate()
  print("__NJLIGameWillTerminate")
  mygame:gameWillTerminate()
end

function __NJLIGameInterrupt()
  print("__NJLIGameInterrupt")
  mygame:gameInterrupt()
end

function __NJLIGameResumeInterrupt()
  print("__NJLIGameResumeInterrupt")
  mygame:gameResumeInterrupt()
end
