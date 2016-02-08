local util = (loadfile(njli.ASSET_PATH("scripts/util.lua")))()

local worldStateObjectTable = {}
local sceneStateObjectTable = {}
local nodeStateObjectTable = {}

function WorldGamePause()
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:pause()
end

function WorldGameUnPause()
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:unPause()
end

function WorldRenderHUD()
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:renderHUD()
end

function WorldEnterState()
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    sceneStateObjectTable = worldStateObjectTable[stateName]:enter()
end

function WorldUpdateState(timeStep)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:update(timeStep)
end

function WorldExitState()
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:exit()
end

function WorldOnMessage(message)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:onMessage(message)
end

function WorldTouchDown(touches)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:touchDown(touches)
end

function WorldTouchUp(touches)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:touchUp(touches)
end

function WorldTouchMove(touches)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:touchMove(touches)
end

function WorldTouchCancelled(touches)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    worldStateObjectTable[stateName]:touchCancelled(touches)
end

function SceneEnterState(scene)
    local stateName = scene:getStateMachine():getState():getName()
    nodeStateObjectTable = sceneStateObjectTable[stateName]:enter(scene)
end

function SceneUpdateState(scene, timeStep)
    local stateName = scene:getStateMachine():getState():getName()
    sceneStateObjectTable[stateName]:update(scene, timeStep)
    scene = nil
end

function SceneExitState(scene)
    local stateName = scene:getStateMachine():getState():getName()
    sceneStateObjectTable[stateName]:exit(scene)
end

function SceneOnMessage(scene, message)
    local stateName = scene:getStateMachine():getState():getName()
    sceneStateObjectTable[stateName]:onMessage(scene, message)
end

function NodeEnterState(node)
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:enter()
end

function NodeUpdateState(node, timeStep)
    local stateName = node:getName()
    if nodeStateObjectTable[stateName] then
        nodeStateObjectTable[stateName]:update(timeStep)
    end
end

function NodeExitState(node)
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:exit()
end

function NodeOnMessage(node, message)
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:onMessage(message)
end

function NodeCollide(node, otherNode, collisionPoint)
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:collide(otherNode, collisionPoint)
end

function NodeNear(node, otherNode)
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:near(otherNode)
end

function NodeActionUpdate(action, timeStep)
    local node = action:getParent()
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:actionUpdate(action, timeStep)
end

function NodeActionComplete(action)
    local node = action:getParent()
    local stateName = node:getName()
    nodeStateObjectTable[stateName]:actionComplete(action)
end

function TouchDownRay(rayContact)
    local stateName = rayContact:getHitNode():getName()
    nodeStateObjectTable[stateName]:touchDown(rayContact)
end

function TouchUpRay(rayContact)
    local stateName = rayContact:getHitNode():getName()
    nodeStateObjectTable[stateName]:touchUp(rayContact)
end

function TouchMoveRay(rayContact)
    local stateName = rayContact:getHitNode():getName()
    nodeStateObjectTable[stateName]:touchMove(rayContact)
end

function TouchCancelledRay(rayContact)
    local stateName = rayContact:getHitNode():getName()
    nodeStateObjectTable[stateName]:touchCancelled(rayContact)
end


local yappyWorld = nil

function WorldDestroy()
    if yappyWorld then
        yappyWorld:__gc()
        yappyWorld = nil
        worldStateObjectTable = {}
        sceneStateObjectTable = {}
        nodeStateObjectTable = {}
    end
end

local yappBirdsWorld = require "world"

function WorldCreate()
    WorldDestroy()

    yappyWorld = yappBirdsWorld.new("YappyBirds")
    worldStateObjectTable = yappyWorld:start()
end

function PushWorldState(name)
    print("PushWorldState " .. name)
    yappyWorld:push(name)
end

function PushSceneState(name)
    yappyWorld:pushSceneState(name)
end

function FacebookResponse(n)
    print("FacebookLoginResponse")
end

function KeyboardShow()
end

function KeyboardCancel()
end

function KeyboardReturn(text)
    print(text)
end



WorldCreate()
