
NJLI = {}

require "njli.util"

local StateMachine = require "njli.statemachine.statemachine"
local Device = require "njli.device"

NJLI.statemachine = StateMachine()
NJLI.device = Device()

--##############################################################################

function __NJLIWorldEnterState()
  print("__NJLIWorldEnterState")
  NJLI.statemachine:_worldEnterState()
end

function __NJLIWorldUpdateState(timeStep)
--  print("__NJLIWorldUpdateState")
  NJLI.statemachine:_worldUpdateState(timeStep)
end

function __NJLIWorldExitState()
  print("__NJLIWorldExitState")
  NJLI.statemachine:_worldExitState()
end

function __NJLIWorldOnMessage(message)
  print("__NJLIWorldOnMessage")
  NJLI.statemachine:_worldOnMessage(message)
end

function __NJLIWorldKeyboardShow()
  print("__NJLIWorldKeyboardShow")
  NJLI.statemachine:_worldKeyboardShow()
end

function __NJLIWorldKeyboardCancel()
  print("__NJLIWorldKeyboardCancel")
  NJLI.statemachine:_worldKeyboardCancel()
end

function __NJLIWorldKeyboardReturn(text)
  print("__NJLIWorldKeyboardReturn")
  NJLI.statemachine:_worldKeyboardReturn(text)
end

function __NJLIWorldReceivedMemoryWarning()
  print("__NJLIWorldReceivedMemoryWarning")
  NJLI.statemachine:_worldReceivedMemoryWarning()
end

function __NJLIWorldGamePause()
  print("__NJLIWorldGamePause")
  NJLI.statemachine:_worldGamePause()
end

function __NJLIWorldGameUnPause()
  print("__NJLIWorldGameUnPause")
  NJLI.statemachine:_worldGameUnPause()
end

function __NJLIWorldRenderHUD()
--  print("__NJLIWorldRenderHUD")
  NJLI.statemachine:_worldRenderHUD()
end

function __NJLIWorldTouchDown(touches)
--  print("__NJLIWorldTouchDown")
  NJLI.statemachine:_worldTouchDown(touches)
end

function __NJLIWorldTouchUp(touches)
--  print("__NJLIWorldTouchUp")
  NJLI.statemachine:_worldTouchUp(touches)
end

function __NJLIWorldTouchMove(touches)
--  print("__NJLIWorldTouchMove")
  NJLI.statemachine:_worldTouchMove(touches)
end

function __NJLIWorldTouchCancelled(touches)
--  print("__NJLIWorldTouchCancelled")
  NJLI.statemachine:_worldTouchCancelled(touches)
end

function __NJLIWorldWillResignActive()
--  print("__NJLIGameWillResignActive")
  NJLI.statemachine:_worldWillResignActive()
end

function __NJLIWorldDidBecomeActive()
--  print("__NJLIGameDidBecomeActive")
  NJLI.statemachine:_worldDidBecomeActive()
end

function __NJLIWorldDidEnterBackground()
--  print("__NJLIGameDidEnterBackground")
  NJLI.statemachine:_worldDidEnterBackground()
end

function __NJLIWorldWillEnterForeground()
--  print("__NJLIGameWillEnterForeground")
  NJLI.statemachine:_worldWillEnterForeground()
end

function __NJLIWorldWillTerminate()
--  print("__NJLIGameWillTerminate")
  NJLI.statemachine:_worldWillTerminate()
end

function __NJLIWorldInterrupt()
--  print("__NJLIGameInterrupt")
  NJLI.statemachine:_worldInterrupt()
end

function __NJLIWorldResumeInterrupt()
--  print("__NJLIGameResumeInterrupt")
  NJLI.statemachine:_worldResumeInterrupt()
end

--##############################################################################

function __NJLISceneEnterState(scene)
  print("__NJLISceneEnterState")
  NJLI.statemachine:_sceneEnterState(scene)
end

function __NJLISceneUpdateState(scene, timeStep)
--  print("__NJLISceneUpdateState")
  NJLI.statemachine:_sceneUpdateState(scene, timeStep)
end

function __NJLISceneExitState(scene)
  print("__NJLISceneExitState")
  NJLI.statemachine:_sceneExitState(scene)
end

function __NJLISceneOnMessage(scene, message)
  print("__NJLISceneOnMessage")
  NJLI.statemachine:_sceneOnMessage(scene, message)
end

function __NJLISceneKeyboardShow(scene)
  print("__NJLISceneKeyboardShow")
  NJLI.statemachine:_sceneKeyboardShow(scene)
end

function __NJLISceneKeyboardCancel(scene)
  print("__NJLISceneKeyboardCancel")
  NJLI.statemachine:_sceneKeyboardCancel(scene)
end

function __NJLISceneKeyboardReturn(scene, text)
  print("__NJLISceneKeyboardReturn")
  NJLI.statemachine:_sceneKeyboardReturn(scene, text)
end

function __NJLISceneRenderHUD(scene)
--  print("__NJLISceneRenderHUD")
  NJLI.statemachine:_sceneRenderHUD(scene)
end

function __NJLISceneGamePause(scene)
  print("__NJLISceneGamePause")
  NJLI.statemachine:_sceneGamePause(scene)
end

function __NJLISceneGameUnPause(scene)
  print("__NJLISceneGameUnPause")
  NJLI.statemachine:_sceneGameUnPause(scene)
end

function __NJLISceneReceivedMemoryWarning(scene)
  print("__NJLISceneReceivedMemoryWarning")
  NJLI.statemachine:_sceneReceivedMemoryWarning(scene)
end

function __NJLISceneTouchDown(scene, touches)
--  print("__NJLISceneTouchDown")
  NJLI.statemachine:_sceneTouchDown(scene, touches)
end

function __NJLISceneTouchUp(scene, touches)
--  print("__NJLISceneTouchUp")
  NJLI.statemachine:_sceneTouchUp(scene, touches)
end

function __NJLISceneTouchMove(scene, touches)
--  print("__NJLISceneTouchMove")
  NJLI.statemachine:_sceneTouchMove(scene, touches)
end

function __NJLISceneTouchCancelled(scene, touches)
--  print("__NJLISceneTouchCancelled")
  NJLI.statemachine:_sceneTouchCancelled(scene, touches)
end

function __NJLISceneWillResignActive(scene)
--  print("__NJLISceneWillResignActive")
  NJLI.statemachine:_sceneWillResignActive(scene)
end

function __NJLISceneDidBecomeActive(scene)
--  print("__NJLISceneDidBecomeActive")
  NJLI.statemachine:_sceneDidBecomeActive(scene)
end

function __NJLISceneDidEnterBackground(scene)
--  print("__NJLISceneDidEnterBackground")
  NJLI.statemachine:_sceneDidEnterBackground(scene)
end

function __NJLISceneWillEnterForeground(scene)
--  print("__NJLISceneWillEnterForeground")
  NJLI.statemachine:_sceneWillEnterForeground(scene)
end

function __NJLISceneWillTerminate(scene)
--  print("__NJLISceneWillTerminate")
  NJLI.statemachine:_sceneWillTerminate(scene)
end

function __NJLISceneInterrupt(scene)
--  print("__NJLISceneInterrupt")
  NJLI.statemachine:_sceneInterrupt(scene)
end

function __NJLISceneResumeInterrupt(scene)
--  print("__NJLISceneResumeInterrupt")
  NJLI.statemachine:_sceneResumeInterrupt(scene)
end

--##############################################################################

function __NJLINodeEnterState(node)
  print("__NJLINodeEnterState")
  NJLI.statemachine:_nodeEnterState(node)
end

function __NJLINodeUpdateState(node, timeStep)
  print("__NJLINodeUpdateState")
  NJLI.statemachine:_nodeUpdateState(node, timeStep)
end

function __NJLINodeExitState(node)
  print("__NJLINodeExitState")
  NJLI.statemachine:_nodeExitState(node)
end

function __NJLINodeOnMessage(node, message)
  print("__NJLINodeOnMessage")
  NJLI.statemachine:_nodeOnMessage(node, message)
end

function __NJLINodeCollide(node, otherNode, collisionPoint)
  print("__NJLINodeCollide")
  NJLI.statemachine:_nodeCollide(node, otherNode, collisionPoint)
end

function __NJLINodeNear(node, otherNode)
  print("__NJLINodeNear")
  NJLI.statemachine:_nodeNear(node, otherNode)
end

function __NJLINodeActionUpdate(action, timeStep)
  print("__NJLINodeActionUpdate")
  NJLI.statemachine:_nodeActionUpdate(action, timeStep)
end

function __NJLINodeActionComplete(action)
  print("__NJLINodeActionComplete")
  NJLI.statemachine:_nodeActionComplete(action)
end

function __NJLINodeRayTouchDown(rayContact)
  print("__NJLINodeRayTouchDown")
  NJLI.statemachine:_rayTouchDown(rayContact)
end

function __NJLINodeRayTouchUp(rayContact)
  print("__NJLINodeRayTouchUp")
  NJLI.statemachine:_rayTouchUp(rayContact)
end

function __NJLINodeRayTouchMove(rayContact)
  print("__NJLINodeRayTouchMove")
  NJLI.statemachine:_rayTouchMove(rayContact)
end

function __NJLINodeRayTouchCancelled(rayContact)
  print("__NJLINodeRayTouchCancelled")
  NJLI.statemachine:_rayTouchCancelled(rayContact)
end

--##############################################################################

function __NJLIUpdate(timeStep)
--  print("__NJLIUpdate("..tostring(timeStep)..")")
  NJLI.device:update(timeStep)
end

function __NJLIRender()
--  print("__NJLIRender()")
  NJLI.device:render()
end

function __NJLIResize(width, height, orientation)
--  print("__NJLIResize(" .. tostring(width) .. ", " .. tostring(height) .. ", ".. tostring(orientation) .. ")")
  NJLI.device:resize(width, height, orientation)
end

function __NJLITouchDown(touches)
--  print("__NJLITouchDown("..tostring(touches)..")")
  NJLI.device:touchDown(touches)
end

function __NJLITouchUp(touches)
--  print("__NJLITouchUp("..tostring(touches)..")")
  NJLI.device:touchUp(touches)
end

function __NJLITouchMove(touches)
--  print("__NJLITouchMove("..tostring(touches)..")")
  NJLI.device:touchMove(touches)
end

function __NJLITouchCancelled(touches)
--  print("__NJLITouchCancelled("..tostring(touches)..")")
  NJLI.device:touchCancelled(touches)
end