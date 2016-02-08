
function createCube()
    local node = njli.Node.create()
    local cubeState = njli.NodeState.create()
    local shader = njli.ShaderProgram.create()
    local material = njli.Material.create()

    node:setName("Cube")
    cubeState:setName("CubeState")

    node:getStateMachine():pushState(cubeState)

    -- node:addGeometry(njli.Cube.create())
    node:addGeometry(njli.Sprite2D.create())

    node:getGeometry():addMaterial(material)

    njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
    node:getGeometry():addShaderProgram(shader)

    local imageTop = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/up.tga", imageTop)
    local imageBottom = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/dn.tga", imageBottom)
    local imageLeft = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/lf.tga", imageLeft)
    local imageRight = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/rt.tga", imageRight)
    local imageFar = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/ft.tga", imageFar)
    local imageNear = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/OLD/skybox/bk.tga", imageNear)

    imageRight:flip()
    imageBottom:flip()
    imageFar:flip()
    imageLeft:flip()
    imageTop:flip()
    imageNear:flip()

    -- node:getGeometry():getMaterial():getDiffuse():loadGPU(imageRight, imageBottom, imageNear, imageLeft, imageTop, imageFar)
    node:getGeometry():getMaterial():getDiffuse():loadGPU(imageLeft)

    

    return node
end

function createCamera()
    local node = njli.Node.create()
    local camera = njli.Camera.create()
    node:addCamera(camera)

    node:setOrigin(njli.btVector3(0, 0, 5))

    return node
end

--World-------------------

-- local sound = njli.Sound.create()
-- njli.World.getInstance():getWorldResourceLoader():load("sounds/swish.wav", sound)

local scene = njli.Scene.create()
njli.World.getInstance():addScene(scene)
njli.World.getInstance():getStateMachine():pushState(njli.WorldState.create())

-- local cubeNode = createCube()
-- cubeNode:setOrigin(njli.btVector3(0, 0, 0))
-- local soundIndex = cubeNode:addSound(sound)

local cubeNode2 = createCube()
cubeNode2:setOrigin(njli.btVector3(0, 3, 0))




function WorldEnterState()

    local cameraNode = createCamera()
    scene:addRootNode(cameraNode)

    -- cameraNode:addChildNode(cubeNode)

    cameraNode:addChildNode(cubeNode2)
    -- cubeNode:addChildNode(cubeNode2)

    --cameraNode:getCamera():lookAt(cubeNode:getOrigin())

    -- njli.World.getInstance():addNode(cubeNode)
    -- njli.World.getInstance():addCamera(cameraNode:getCamera())
end

local angle = 0
function WorldUpdateState(timeStep)
    local quat = njli.btQuaternion()
    -- angle = angle + (timeStep * 1)

    quat:setEuler(angle, angle, angle)
    -- cubeNode:setRotation(quat)

    angle = angle + (timeStep * 2)
    quat:setEuler(angle, angle, angle)
    cubeNode2:setRotation(quat)
end

function WorldExitState()
end

function WorldOnMessage(message)
end

function WorldTouchDown(touches)
    -- cubeNode:getSound(soundIndex):play()
end

function WorldTouchUp(touches)
end

function WorldTouchMove(touches)
end

function WorldTouchCancelled(touches)
end



function SceneEnterState(scene)
end

function SceneUpdateState(scene, timeStep)
end

function SceneExitState(scene)
end

function SceneOnMessage(scene, message)
end

function NodeEnterState(node)
end

function NodeUpdateState(node, timeStep)
end

function NodeExitState(node)
end

function NodeOnMessage(node, message)
end

function NodeCollide(node, otherNode, collisionPoint)
end

function NodeNear(node, otherNode)
end

function TouchDownRay(rayContact)
end

function TouchUpRay(rayContact)
end

function TouchMoveRay(rayContact)
end

function TouchCancelledRay(rayContact)
end