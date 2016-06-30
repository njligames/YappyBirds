local MyGame = require "YappyGame"




local njligame = require "njli.game"
local njliGameInstance = njligame()

local mygame = MyGame({
    gameInstance = njliGameInstance,
})
mygame:startGame()

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

-- Scene Functions...

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


-- Node Functions...

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












-- local path = njli.ASSET_PATH("scripts/util.lua")
-- local util = (loadfile(path))()

-- path = njli.ASSET_PATH("scripts/filePaths.lua")
-- local filePaths = (loadfile(path))()

-- local path = njli.ASSET_PATH("scripts/levelData.lua")
-- local levelData = (loadfile(path))()
-- levelFileData = levelData.new()

-- path = njli.ASSET_PATH("scripts/menuNodePositions.lua")
-- local menuNodePositions = (loadfile(path))()

-- local yappyBirdsWorld = require "worlds.yappyBirdsWorld"

-- local theStartWorldName = _worldStateNames.yappyGame

-- local worldObjectTable = {}
-- local sceneObjectTable = {}
-- local nodeObjectTable = {}

-- function stackTrace(name)
--     print(debug.traceback(name .. " -  START Stack Trace"))
--     print(debug.getinfo(1))
--     print(name .. " -  END Stack Trace")
-- end

-- function getWorldCurrentState()
--     local stateMachine = njli.World.getInstance():getStateMachine()

--     if stateMachine then
--         local state = stateMachine:getState()
--         if state then
--             return worldObjectTable[state:getName()]
--         end
--     end

--     return nil
-- end

-- function getSceneCurrentState(scene)
--     if scene ~= nil then
--         return sceneObjectTable[scene:getStateMachine():getState():getName()]
--     end

--     return nil
-- end

-- function getNodeObject(name)
--     if nodeObjectTable then
--         local nodeObject = nodeObjectTable[name]
--         if nodeObject ~= nil then
--             if nodeObject.node ~= nil then
--                 if nodeObject.node:getStateMachine() ~= nil then
--                     if nodeObject.node:getStateMachine():getState() ~= nil then
--                         return nodeObject
--                     else
--                         stackTrace("Trying to get a NodeState that isn't there for name: " .. name)
--                     end
--                 else
--                     stackTrace("Trying to get a NodeStateMachine that isn't there for name: " .. name)
--                 end
--             else
--                 stackTrace("Trying to get a Node that isn't there for name: " .. name)
--             end
--         else
--             -- stackTrace("Trying to get a NodeObject that isn't there for name: " .. name)    
--         end
--     end
    
--     return nil

-- end

-- function getNodeCurrentState(node)
--     local nodeObject = nil
--     if node ~= nil then
--         nodeObject = getNodeObject(node:getName())
--     end

--     return nodeObject
-- end

-- function removeNodeObject(nodeObject)
--     if nodeObject ~= nil then

--         local key = nodeObject.instanceName

--         if nodeObjectTable[key] ~= nil then
--             -- nodeObjectTable[key].node:hide(getPerspectiveCamera())
--             -- nodeObjectTable[key].node:hide(getOrthoCamera())
--             nodeObjectTable[key]:__gc()
--             nodeObjectTable[key] = nil
--         -- else
--         --     stackTrace("The node object with key " .. key .. " is nil, so it cannot be removed.")
--         end

--     else
--         stackTrace("nodeObject is nil")
--     end
-- end

-- function insertNodeObject(nodeObject, key)
--     assert(nodeObject ~= nil, "The node object is nil")

--     assert(nodeObjectTable[key] == nil, "There is already a node object with key " .. key)


--     nodeObjectTable[key] = nodeObject
-- end












-- local yappyWorld = nil

-- function WorldDestroy()
--     if yappyWorld then
--         yappyWorld:__gc()
--         yappyWorld = nil
--         worldObjectTable = {}
--         sceneObjectTable = {}
--         nodeObjectTable = {}
--     end
-- end

-- function WorldCreate()
--     WorldDestroy()

--     yappyWorld = yappyBirdsWorld.new("YappyBirds")
--     yappyWorld.startWorldName = theStartWorldName

-- --njli.World.getInstance():enableDebugDraw(getOrthoCamera(), getShaderProgram())

--     worldObjectTable = yappyWorld:start()
-- end

-- function pushWorldState(name, userdata)
--     if worldObjectTable[name] ~= nil then
--         worldObjectTable[name]:addUserData("userdata", userdata)
--         worldObjectTable[name]:push()
--     else
--         print("unable to push world state name = " .. name)
--         -- print_r(worldObjectTable)
--     end
-- end

-- function getSceneState(name)
--     return sceneObjectTable[name]
-- end

-- function pushSceneState(name)
--     if sceneObjectTable[name] ~= nil then
--         sceneObjectTable[name]:push()
--     else
--         print("unable to push scene state name = " .. name)
--         -- print_r(sceneObjectTable)
--     end
-- end

-- function pushNodeState(name)
--     if nodeObjectTable[name] ~= nil then
--         nodeObjectTable[name]:push()
--     else
--         print("unable to push node state name = " .. name)
--         -- print_r(nodeObjectTable)
--     end
-- end

-- function getShaderProgram()
--     return yappyWorld.shader
-- end

-- function getOrthoCamera()
--     return yappyWorld:getOrthoCamera()
-- end

-- function getPerspectiveCamera()
--     return yappyWorld:getPerspectiveCamera()
-- end

-- function FacebookResponse(n)
--     print("FacebookLoginResponse")
-- end



-- print("\n\n")
-- print("getDeviceResolution\t", DeviceNameToResolutionDeviceName(njli.World.getInstance():getDeviceName()))
-- print("getDeviceName\t", njli.World.getInstance():getDeviceName())
-- print("DeviceNameDownsizeAmount\t", DeviceNameDownsizeAmount(njli.World.getInstance():getDeviceName()))

-- print("\n\n\n\n")

-- --local mtx = bullet.btTransform.getIdentity():getOpenGLMatrix()
-- --print(njli.ColorUtil.createMatrixFromArray(mtx))
-- --print(bullet.btScalarArray_getitem(mtx, 0))
-- --print_r(bullet)--.transformValues(transform))
-- --local x1, y1, z1, w1, x2, y2, z2, w2, x3, y3, z3, w3, x4, y4, z4, w4 = bullet.transformValues(transform)

-- --local transform = njli.ColorUtil.createHueRotationMatrix(0.0)
-- --print(transform)

-- WorldCreate()

