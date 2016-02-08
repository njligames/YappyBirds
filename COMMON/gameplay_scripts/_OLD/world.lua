local arg={...}

-- local menuScene = require "menuScene"
local worldStateObject = require "worldStateObject"

-- function destroyObject(object)
--     njli.World.getInstance():getWorldFactory():destroy(object)
-- end

function createPerspectiveCameraNode(name)
    local node = njli.Node.create()
    node:setName(name)

    local camera = njli.Camera.create()
    camera:enableOrthographic(false)
    camera:setRenderCategory(RenderCategories.perspective)

    node:addCamera(camera)

    return node
end

function createOrthoCameraNode(name)
    local node = njli.Node.create()
    node:setName(name)

    local camera = njli.Camera.create()
    camera:enableOrthographic()
    camera:setRenderCategory(RenderCategories.orthographic)

    node:addCamera(camera)

    return node
end

function destroyCameraNode(cameraNode)
    destroyObject(cameraNode:getCamera())
    destroyObject(cameraNode)
end

local push = function(self, stateName)
    self.worldStates[stateName]:push()
end

local pushSceneState = function(self, name)
    local stateName = njli.World.getInstance():getStateMachine():getState():getName()
    self.worldStates[stateName]:pushSceneState(name)
end

local start = function(self)
    -- PushWorldState(_worldStateNames.tests)
    -- PushWorldState(_worldStateNames.menu)
    PushWorldState(_worldStateNames.game)
    return self.worldStates
end

local delete = function(self)
    -- print("delete " .. self.worldName)

    njli.World.getInstance():disableDebugDraw()
    
    njli.World.getInstance():getStateMachine():clear(false)

    --destroy worldStates
    for k,v in pairs(self.worldStates) do
        self.worldStates[k]:__gc()
    end
    self.worldStates = {}

    -- destroyObject(self.shared.image)
    -- destroyObject(self.shared.material)
    -- destroyObject(self.shared.geometry)
    -- destroyObject(self.shared.physicsShape)
    destroyCameraNode(self.cameraNode)
    destroyObject(self.shader)

    destroyObject(self.physicsWorld)

    destroyObject(njli.World.getInstance():getScene())
end

local methods = 
{
    push = push,
    pushSceneState = pushSceneState,
    start = start,
	__gc = delete
}

local new = function(worldName)
    -- print("new " .. worldName)

    njli.World.getInstance():setName(worldName)

    local scene = njli.Scene.create()
    njli.World.getInstance():addScene(scene)
    njli.World.getInstance():getScene():setName(worldName .. "Scene")

    local physicsWorld = njli.PhysicsWorld.create()
    physicsWorld:setGravity(njli.btVector3(0, -9.81, 0))
    -- physicsWorld:setGravity(njli.btVector3(0, 0, 0))
    njli.World.getInstance():getScene():addPhysicsWorld(physicsWorld)

    local shader = njli.ShaderProgram.create();
    njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)

    local cameraNode = createOrthoCameraNode("Camera")

    njli.World.getInstance():getScene():addRootNode(cameraNode)
    njli.World.getInstance():setTouchCamera(cameraNode:getCamera())

    local worldStates = {}

    for k,v in pairs(_worldStateNames) do
        worldStates[v] = worldStateObject.new(v, shader)
    end

    local properties = 
    {
        worldName = worldName,
        scene = scene,
        physicsWorld = physicsWorld,
        shader = shader,
        cameraNode = cameraNode,
        worldStates = worldStates,
    }
    
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
