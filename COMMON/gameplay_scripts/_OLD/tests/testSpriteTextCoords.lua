


njli.World.getInstance():getStateMachine():pushState(njli.WorldState.create())
local scene = njli.Scene.create()
njli.World.getInstance():addScene(scene)

njli.World.getInstance():enableDebugDraw()

local physicsWorld = njli.PhysicsWorld.create()
scene:addPhysicsWorld(physicsWorld)

local current_frame = 0
local testBirdFront = (loadfile(njli.ASSET_PATH("scripts/tests/birds0.lua")))()
local spriteAtlas = create(testBirdFront:getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

function createSpriteNode()
    local shader = njli.ShaderProgram.create();
    njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
    local image = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/birds0.png", image)

    local material = njli.Material.create();
    material:getDiffuse():loadGPU (image);

    local imageWidth = image:getWidth()
    local imageHeight = image:getHeight()
    local sprite2D = njli.Sprite2D.create();
    sprite2D:addMaterial(material)
    sprite2D:addShaderProgram(shader)
    
    sprite2D:setSpriteAtlasFrame(0, spriteAtlas, current_frame)

    local transform = njli.btTransform(njli.btTransform.getIdentity())
    -- local origin = njli.btVector3(imageWidth*.5, imageHeight*.5, 0)
    local origin = njli.btVector3(njli.World.getInstance():getViewportDimensions():x()*.5, njli.World.getInstance():getViewportDimensions():y()*.5, 0)

    local node = njli.Node.create()
    node:getStateMachine():pushState(njli.NodeState.create())
    -- njli.World.getInstance():addNode(node)
    node:addGeometry(sprite2D)

    transform:setOrigin(origin)

    node:setTransform(transform)






    local rigidBody = njli.PhysicsBodyRigid.create()
	-- rigidBody:setKinematicPhysics()
	-- rigidBody:setStaticPhysics()
	rigidBody:setDynamicPhysics()

	local physicsShapeBox2D = njli.PhysicsShapeBox2D.create()
	rigidBody:addPhysicsShape(physicsShapeBox2D)

	node:addPhysicsBody(rigidBody)





    return node
end

function createCameraNode()
    local node = njli.Node.create()
    local camera = njli.Camera.create()
    camera:enableOrthographic()

    node:addCamera(camera)
    return node
end

local cubeNode = createSpriteNode()
local cameraNode = createCameraNode()

function MyWorldStateEnter()

    
    scene:addRootNode(cameraNode)
    

    cameraNode:addChildNode(cubeNode)

    -- cubeNode:hide(cameraNode:getCamera())

    njli.World.getInstance():setTouchCamera(cameraNode:getCamera());
    njli.World.getInstance():setDebugDrawCamera(cameraNode:getCamera());
    njli.World.getInstance():setDebugShader(cubeNode:getGeometry():getShaderProgram())
    njli.World.getInstance():setDebugMaterial(cubeNode:getGeometry():getMaterial())

end

function MyWorldStateUpdate(timeStep)

end

function MyWorldStateExit()
end

function MyWorldStateTouchDown(touches)
end

function MyWorldStateTouchUp(touches)
end

function MyWorldStateTouchMove(touches)
end




--Scene-------------------

function MySceneMySceneStateEnter(scene)
end

function MySceneMySceneStateUpdate(scene, timeStep)
end

function MySceneMySceneStateExit(scene)
end






--Node-------------------

function MyNodeMyNodeStateEnter(node)
end

local angle = 0
function MyNodeMyNodeStateUpdate(node, timeStep)

	local quat = njli.btQuaternion()
    angle = angle + (timeStep * 10)
    quat:setEuler(0, 0, 0)

    

    node:getGeometry():setSpriteAtlasFrame(0, spriteAtlas, current_frame, false)

    current_frame = current_frame + 1

    if(current_frame >= spriteAtlas:numberOfFrames()) then
        current_frame = 0
    end



    local transform = njli.btTransform(njli.btTransform.getIdentity())
	local origin = njli.btVector3(njli.World.getInstance():getViewportDimensions():x()*.5, njli.World.getInstance():getViewportDimensions():y()*.5, 0)
	transform:setOrigin(origin)

    node:setTransform(transform)
    node:setRotation(quat)
    print(angle)
    -- node:getGeometry():applyBillboard(cameraNode:getCamera())
end

function MyNodeMyNodeStateExit(node)
end

function TouchDownRay(rayContact)
	print("TouchDownRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
function TouchUpRay(rayContact)
	print("TouchUpRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
function TouchMoveRay(rayContact)
	print("TouchMoveRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
function TouchCancelledRay(rayContact)
	print("TouchCancelledRay " .. rayContact:getHitNode():getWorldTransform():getOrigin():x() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():y() .. " " .. rayContact:getHitNode():getWorldTransform():getOrigin():z())
end
