local Interface = require 'NJLI.Interface'

local interface = Interface()

--#############################################################################
--World State Functions
--#############################################################################

function __NJLIWorldEnterState()
  --print("__NJLIWorldEnterState")
  interface:getStateMachine():_worldEnterState()
end

function __NJLIWorldUpdateState(timeStep)
  --print("__NJLIWorldUpdateState")
  interface:getStateMachine():_worldUpdateState(timeStep)
end

function __NJLIWorldExitState()
  --print("__NJLIWorldExitState")
  interface:getStateMachine():_worldExitState()
end

function __NJLIWorldOnMessage(message)
  --print("__NJLIWorldOnMessage")
  interface:getStateMachine():_worldOnMessage(message)
end

function __NJLIWorldKeyboardShow()
  --print("__NJLIWorldKeyboardShow")
  interface:getStateMachine():_worldKeyboardShow()
end

function __NJLIWorldKeyboardCancel()
  --print("__NJLIWorldKeyboardCancel")
  interface:getStateMachine():_worldKeyboardCancel()
end

function __NJLIWorldKeyboardReturn(text)
  --print("__NJLIWorldKeyboardReturn")
  interface:getStateMachine():_worldKeyboardReturn(text)
end

function __NJLIWorldReceivedMemoryWarning()
  --print("__NJLIWorldReceivedMemoryWarning")
  interface:getStateMachine():_worldReceivedMemoryWarning()
end

function __NJLIWorldGamePause()
  --print("__NJLIWorldGamePause")
  interface:getStateMachine():_worldGamePause()
end

function __NJLIWorldGameUnPause()
  --print("__NJLIWorldGameUnPause")
  interface:getStateMachine():_worldGameUnPause()
end

function __NJLIWorldRenderHUD()
  --print("__NJLIWorldRenderHUD")
  interface:getStateMachine():_worldRenderHUD()
end

function __NJLIWorldTouchDown(touches)
  --print("__NJLIWorldTouchDown")
  interface:getStateMachine():_worldTouchDown(touches)
end

function __NJLIWorldTouchUp(touches)
  --print("__NJLIWorldTouchUp")
  interface:getStateMachine():_worldTouchUp(touches)
end

function __NJLIWorldTouchMove(touches)
  --print("__NJLIWorldTouchMove")
  interface:getStateMachine():_worldTouchMove(touches)
end

function __NJLIWorldTouchCancelled(touches)
  --print("__NJLIWorldTouchCancelled")
  interface:getStateMachine():_worldTouchCancelled(touches)
end

function __NJLIWorldWillResignActive()
  --print("__NJLIWorldWillResignActive")
  interface:getStateMachine():_worldWillResignActive()
end

function __NJLIWorldDidBecomeActive()
  --print("__NJLIWorldDidBecomeActive")
  interface:getStateMachine():_worldDidBecomeActive()
end

function __NJLIWorldDidEnterBackground()
  --print("__NJLIWorldDidEnterBackground")
  interface:getStateMachine():_worldDidEnterBackground()
end

function __NJLIWorldWillEnterForeground()
  --print("__NJLIWorldWillEnterForeground")
  interface:getStateMachine():_worldWillEnterForeground()
end

function __NJLIWorldWillTerminate()
  --print("__NJLIWorldWillTerminate")
  interface:getStateMachine():_worldWillTerminate()
end

function __NJLIWorldInterrupt()
  --print("__NJLIWorldInterrupt")
  interface:getStateMachine():_worldInterrupt()
end

function __NJLIWorldResumeInterrupt()
  --print("__NJLIWorldResumeInterrupt")
  interface:getStateMachine():_worldResumeInterrupt()
end

--#############################################################################
--Scene State Functions
--#############################################################################

function __NJLISceneEnterState(scene)
  --print("__NJLISceneEnterState")
  interface:getStateMachine():_sceneEnterState(scene)
end

function __NJLISceneUpdateState(scene, timeStep)
  --print("__NJLISceneUpdateState")
  interface:getStateMachine():_sceneUpdateState(scene, timeStep)
end

function __NJLISceneExitState(scene)
  --print("__NJLISceneExitState")
  interface:getStateMachine():_sceneExitState(scene)
end

function __NJLISceneOnMessage(scene, message)
  --print("__NJLISceneOnMessage")
  interface:getStateMachine():_sceneOnMessage(scene, message)
end

function __NJLISceneKeyboardShow(scene)
  --print("__NJLISceneKeyboardShow")
  interface:getStateMachine():_sceneKeyboardShow(scene)
end

function __NJLISceneKeyboardCancel(scene)
  --print("__NJLISceneKeyboardCancel")
  interface:getStateMachine():_sceneKeyboardCancel(scene)
end

function __NJLISceneKeyboardReturn(scene, text)
  --print("__NJLISceneKeyboardReturn")
  interface:getStateMachine():_sceneKeyboardReturn(scene, text)
end

function __NJLISceneRenderHUD(scene)
  --print("__NJLISceneRenderHUD")
  interface:getStateMachine():_sceneRenderHUD(scene)
end

function __NJLISceneGamePause(scene)
  --print("__NJLISceneGamePause")
  interface:getStateMachine():_sceneGamePause(scene)
end

function __NJLISceneGameUnPause(scene)
  --print("__NJLISceneGameUnPause")
  interface:getStateMachine():_sceneGameUnPause(scene)
end

function __NJLISceneReceivedMemoryWarning(scene)
  --print("__NJLISceneReceivedMemoryWarning")
  interface:getStateMachine():_sceneReceivedMemoryWarning(scene)
end

function __NJLISceneTouchDown(scene, touches)
  --print("__NJLISceneTouchDown")
  interface:getStateMachine():_sceneTouchDown(scene, touches)
end

function __NJLISceneTouchUp(scene, touches)
  --print("__NJLISceneTouchUp")
  interface:getStateMachine():_sceneTouchUp(scene, touches)
end

function __NJLISceneTouchMove(scene, touches)
  --print("__NJLISceneTouchMove")
  interface:getStateMachine():_sceneTouchMove(scene, touches)
end

function __NJLISceneTouchCancelled(scene, touches)
  --print("__NJLISceneTouchCancelled")
  interface:getStateMachine():_sceneTouchCancelled(scene, touches)
end

function __NJLISceneWillResignActive(scene)
  --print("__NJLISceneWillResignActive")
  interface:getStateMachine():_sceneWillResignActive(scene)
end

function __NJLISceneDidBecomeActive(scene)
  --print("__NJLISceneDidBecomeActive")
  interface:getStateMachine():_sceneDidBecomeActive(scene)
end

function __NJLISceneDidEnterBackground(scene)
  --print("__NJLISceneDidEnterBackground")
  interface:getStateMachine():_sceneDidEnterBackground(scene)
end

function __NJLISceneWillEnterForeground(scene)
  --print("__NJLISceneWillEnterForeground")
  interface:getStateMachine():_sceneWillEnterForeground(scene)
end

function __NJLISceneWillTerminate(scene)
  --print("__NJLISceneWillTerminate")
  interface:getStateMachine():_sceneWillTerminate(scene)
end

function __NJLISceneInterrupt(scene)
  --print("__NJLISceneInterrupt")
  interface:getStateMachine():_sceneInterrupt(scene)
end

function __NJLISceneResumeInterrupt(scene)
  --print("__NJLISceneResumeInterrupt")
  interface:getStateMachine():_sceneResumeInterrupt(scene)
end

--#############################################################################
--Node State Functions
--#############################################################################

function __NJLINodeEnterState(node)
  print("__NJLINodeEnterState")
  interface:getStateMachine():_nodeEnterState(node)
end

function __NJLINodeUpdateState(node, timeStep)
  --print("__NJLINodeUpdateState")
  interface:getStateMachine():_nodeUpdateState(node, timeStep)
end

function __NJLINodeExitState(node)
  --print("__NJLINodeExitState")
  interface:getStateMachine():_nodeExitState(node)
end

function __NJLINodeOnMessage(node, message)
  --print("__NJLINodeOnMessage")
  interface:getStateMachine():_nodeOnMessage(node, message)
end

function __NJLINodeCollide(node, otherNode, collisionPoint)
  --print("__NJLINodeCollide")
  interface:getStateMachine():_nodeCollide(node, otherNode, collisionPoint)
end

function __NJLINodeNear(node, otherNode)
  --print("__NJLINodeNear")
  interface:getStateMachine():_nodeNear(node, otherNode)
end

function __NJLINodeActionUpdate(action, timeStep)
  --print("__NJLINodeActionUpdate")
  interface:getStateMachine():_nodeActionUpdate(action, timeStep)
end

function __NJLINodeActionComplete(action)
  --print("__NJLINodeActionComplete")
  interface:getStateMachine():_nodeActionComplete(action)
end

function __NJLINodeRayTouchDown(rayContact)
  --print("__NJLINodeRayTouchDown")
  interface:getStateMachine():_rayTouchDown(rayContact)
end

function __NJLINodeRayTouchUp(rayContact)
  --print("__NJLINodeRayTouchUp")
  interface:getStateMachine():_rayTouchUp(rayContact)
end

function __NJLINodeRayTouchMove(rayContact)
  --print("__NJLINodeRayTouchMove")
  interface:getStateMachine():_rayTouchMove(rayContact)
end

function __NJLINodeRayTouchCancelled(rayContact)
  --print("__NJLINodeRayTouchCancelled")
  interface:getStateMachine():_rayTouchCancelled(rayContact)
end

--#############################################################################
--Device Functions
--#############################################################################

function __NJLIUpdate(timeStep)
  --print("__NJLIUpdate(".. timeStep .. ")")
  interface:getDeviceEntity():update(timeStep)
end

function __NJLIRender()
  --print("__NJLIRender()")
  interface:getDeviceEntity():render()
end

function __NJLIResize(width, height, orientation)
  --print("__NJLIResize(" .. width .. ", " .. height .. ", " .. orientation .. ")")
  interface:getDeviceEntity():resize(width, height, orientation)
end

function __NJLITouchDown(touches)
  --print("__NJLITouchDown(" .. #touches .. ")")
  interface:getDeviceEntity():touchDown(touches)
end

function __NJLITouchUp(touches)
  --print("__NJLITouchUp(" .. #touches .. ")")
  interface:getDeviceEntity():touchUp(touches)
end

function __NJLITouchMove(touches)
  --print("__NJLITouchMove(" .. #touches .. ")")
  interface:getDeviceEntity():touchMove(touches)
end

function __NJLITouchCancelled(touches)
  --print("__NJLITouchCancelled(" .. #touches .. ")")
  interface:getDeviceEntity():touchCancelled(touches)
end

return interface

