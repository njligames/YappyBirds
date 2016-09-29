local Interface = require 'NJLI.Interface'

local interface = Interface()

--############################################################################# 
--World State Functions
--#############################################################################

function __NJLIWorldEnterState()
	--print("__NJLIWorldEnterState")
	interface:_getStateMachine():_worldEnterState()
end

function __NJLIWorldUpdateState(timeStep)
	--print("__NJLIWorldUpdateState")
	interface:_getStateMachine():_worldUpdateState(timeStep)
end

function __NJLIWorldExitState()
	--print("__NJLIWorldExitState")
	interface:_getStateMachine():_worldExitState()
end

function __NJLIWorldOnMessage(message)
	--print("__NJLIWorldOnMessage")
	interface:_getStateMachine():_worldOnMessage(message)
end

function __NJLIWorldKeyboardShow()
	--print("__NJLIWorldKeyboardShow")
	interface:_getStateMachine():_worldKeyboardShow()
end

function __NJLIWorldKeyboardCancel()
	--print("__NJLIWorldKeyboardCancel")
	interface:_getStateMachine():_worldKeyboardCancel()
end

function __NJLIWorldKeyboardReturn(text)
	--print("__NJLIWorldKeyboardReturn")
	interface:_getStateMachine():_worldKeyboardReturn(text)
end

function __NJLIWorldReceivedMemoryWarning()
	--print("__NJLIWorldReceivedMemoryWarning")
	interface:_getStateMachine():_worldReceivedMemoryWarning()
end

function __NJLIWorldGamePause()
	--print("__NJLIWorldGamePause")
	interface:_getStateMachine():_worldGamePause()
end

function __NJLIWorldGameUnPause()
	--print("__NJLIWorldGameUnPause")
	interface:_getStateMachine():_worldGameUnPause()
end

function __NJLIWorldRenderHUD()
	--print("__NJLIWorldRenderHUD")
	interface:_getStateMachine():_worldRenderHUD()
end

function __NJLIWorldTouchDown(touches)
	--print("__NJLIWorldTouchDown")
	interface:_getStateMachine():_worldTouchDown(touches)
end

function __NJLIWorldTouchUp(touches)
	--print("__NJLIWorldTouchUp")
	interface:_getStateMachine():_worldTouchUp(touches)
end

function __NJLIWorldTouchMove(touches)
	--print("__NJLIWorldTouchMove")
	interface:_getStateMachine():_worldTouchMove(touches)
end

function __NJLIWorldTouchCancelled(touches)
	--print("__NJLIWorldTouchCancelled")
	interface:_getStateMachine():_worldTouchCancelled(touches)
end

function __NJLIWorldWillResignActive()
	--print("__NJLIWorldWillResignActive")
	interface:_getStateMachine():_worldWillResignActive()
end

function __NJLIWorldDidBecomeActive()
	--print("__NJLIWorldDidBecomeActive")
	interface:_getStateMachine():_worldDidBecomeActive()
end

function __NJLIWorldDidEnterBackground()
	--print("__NJLIWorldDidEnterBackground")
	interface:_getStateMachine():_worldDidEnterBackground()
end

function __NJLIWorldWillEnterForeground()
	--print("__NJLIWorldWillEnterForeground")
	interface:_getStateMachine():_worldWillEnterForeground()
end

function __NJLIWorldWillTerminate()
	--print("__NJLIWorldWillTerminate")
	interface:_getStateMachine():_worldWillTerminate()
end

function __NJLIWorldInterrupt()
	--print("__NJLIWorldInterrupt")
	interface:_getStateMachine():_worldInterrupt()
end

function __NJLIWorldResumeInterrupt()
	--print("__NJLIWorldResumeInterrupt")
	interface:_getStateMachine():_worldResumeInterrupt()
end

--############################################################################# 
--Scene State Functions
--#############################################################################

function __NJLISceneEnterState(scene)
	--print("__NJLISceneEnterState")
	interface:_getStateMachine():_sceneEnterState(scene)
end

function __NJLISceneUpdateState(scene, timeStep)
	--print("__NJLISceneUpdateState")
	interface:_getStateMachine():_sceneUpdateState(scene, timeStep)
end

function __NJLISceneExitState(scene)
	--print("__NJLISceneExitState")
	interface:_getStateMachine():_sceneExitState(scene)
end

function __NJLISceneOnMessage(scene, message)
 --print("__NJLISceneOnMessage")
 interface:_getStateMachine():_sceneOnMessage(scene, message)
end

function __NJLISceneKeyboardShow(scene)
	--print("__NJLISceneKeyboardShow")
	interface:_getStateMachine():_sceneKeyboardShow(scene)
end

function __NJLISceneKeyboardCancel(scene)
	--print("__NJLISceneKeyboardCancel")
	interface:_getStateMachine():_sceneKeyboardCancel(scene)
end

function __NJLISceneKeyboardReturn(scene, text)
	--print("__NJLISceneKeyboardReturn")
	interface:_getStateMachine():_sceneKeyboardReturn(scene, text)
end

function __NJLISceneRenderHUD(scene)
	--print("__NJLISceneRenderHUD")
	interface:_getStateMachine():_sceneRenderHUD(scene)
end

function __NJLISceneGamePause(scene)
	--print("__NJLISceneGamePause")
	interface:_getStateMachine():_sceneGamePause(scene)
end

function __NJLISceneGameUnPause(scene)
	--print("__NJLISceneGameUnPause")
	interface:_getStateMachine():_sceneGameUnPause(scene)
end

function __NJLISceneReceivedMemoryWarning(scene)
	--print("__NJLISceneReceivedMemoryWarning")
	interface:_getStateMachine():_sceneReceivedMemoryWarning(scene)
end

function __NJLISceneTouchDown(scene, touches)
	--print("__NJLISceneTouchDown")
	interface:_getStateMachine():_sceneTouchDown(scene, touches)
end

function __NJLISceneTouchUp(scene, touches)
	--print("__NJLISceneTouchUp")
	interface:_getStateMachine():_sceneTouchUp(scene, touches)
end

function __NJLISceneTouchMove(scene, touches)
	--print("__NJLISceneTouchMove")
	interface:_getStateMachine():_sceneTouchMove(scene, touches)
end

function __NJLISceneTouchCancelled(scene, touches)
	--print("__NJLISceneTouchCancelled")
	interface:_getStateMachine():_sceneTouchCancelled(scene, touches)
end

function __NJLISceneWillResignActive(scene)
	--print("__NJLISceneWillResignActive")
	interface:_getStateMachine():_sceneWillResignActive(scene)
end

function __NJLISceneDidBecomeActive(scene)
	--print("__NJLISceneDidBecomeActive")
	interface:_getStateMachine():_sceneDidBecomeActive(scene)
end

function __NJLISceneDidEnterBackground(scene)
	--print("__NJLISceneDidEnterBackground")
	interface:_getStateMachine():_sceneDidEnterBackground(scene)
end

function __NJLISceneWillEnterForeground(scene)
	--print("__NJLISceneWillEnterForeground")
	interface:_getStateMachine():_sceneWillEnterForeground(scene)
end

function __NJLISceneWillTerminate(scene)
	--print("__NJLISceneWillTerminate")
	interface:_getStateMachine():_sceneWillTerminate(scene)
end

function __NJLISceneInterrupt(scene)
	--print("__NJLISceneInterrupt")
	interface:_getStateMachine():_sceneInterrupt(scene)
end

function __NJLISceneResumeInterrupt(scene)
	--print("__NJLISceneResumeInterrupt")
	interface:_getStateMachine():_sceneResumeInterrupt(scene)
end

--############################################################################# 
--Node State Functions
--#############################################################################

function __NJLINodeEnterState(node)
	--print("__NJLINodeEnterState")
	interface:_getStateMachine():_nodeEnterState(node)
end

function __NJLINodeUpdateState(node, timeStep)
	--print("__NJLINodeUpdateState")
	interface:_getStateMachine():_nodeUpdateState(node, timeStep)
end

function __NJLINodeExitState(node)
	--print("__NJLINodeExitState")
	interface:_getStateMachine():_nodeExitState(node)
end

function __NJLINodeOnMessage(node, message)
	--print("__NJLINodeOnMessage")
	interface:_getStateMachine():_nodeOnMessage(node, message)
end

function __NJLINodeCollide(node, otherNode, collisionPoint)
	--print("__NJLINodeCollide")
	interface:_getStateMachine():_nodeCollide(node, otherNode, collisionPoint)
end

function __NJLINodeNear(node, otherNode)
	--print("__NJLINodeNear")
	interface:_getStateMachine():_nodeNear(node, otherNode)
end

function __NJLINodeActionUpdate(action, timeStep)
	--print("__NJLINodeActionUpdate")
	interface:_getStateMachine():_nodeActionUpdate(action, timeStep)
end

function __NJLINodeActionComplete(action)
	--print("__NJLINodeActionComplete")
	interface:_getStateMachine():_nodeActionComplete(action)
end

function __NJLINodeRayTouchDown(rayContact)
	--print("__NJLINodeRayTouchDown")
	interface:_getStateMachine():_rayTouchDown(rayContact)
end

function __NJLINodeRayTouchUp(rayContact)
	--print("__NJLINodeRayTouchUp")
	interface:_getStateMachine():_rayTouchUp(rayContact)
end

function __NJLINodeRayTouchMove(rayContact)
	--print("__NJLINodeRayTouchMove")
	interface:_getStateMachine():_rayTouchMove(rayContact)
end

function __NJLINodeRayTouchCancelled(rayContact)
	--print("__NJLINodeRayTouchCancelled")
	interface:_getStateMachine():_rayTouchCancelled(rayContact)
end

--############################################################################# 
--Device Functions
--#############################################################################

function __NJLIUpdate(timeStep)
	--print("__NJLIUpdate(".. timeStep .. ")")
	interface:_getDeviceEntity():update(timeStep)
end

function __NJLIRender()
	--print("__NJLIRender()")
	interface:_getDeviceEntity():render()
end

function __NJLIResize(width, height, orientation)
	--print("__NJLIResize(" .. width .. ", " .. height .. ", " .. orientation .. ")")
	interface:_getDeviceEntity():resize(width, height, orientation)
end

function __NJLITouchDown(touches)
	--print("__NJLITouchDown(" .. #touches .. ")")
	interface:_getDeviceEntity():touchDown(touches)
end

function __NJLITouchUp(touches)
	--print("__NJLITouchUp(" .. #touches .. ")")
	interface:_getDeviceEntity():touchUp(touches)
end

function __NJLITouchMove(touches)
	--print("__NJLITouchMove(" .. #touches .. ")")
	interface:_getDeviceEntity():touchMove(touches)
end

function __NJLITouchCancelled(touches)
	--print("__NJLITouchCancelled(" .. #touches .. ")")
	interface:_getDeviceEntity():touchCancelled(touches)
end

return interface

