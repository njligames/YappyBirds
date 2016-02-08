njli.World.getInstance():getWorldFactory():destroyAll()


local scene = njli.Scene.create()
local shader = njli.ShaderProgram.create();
local material = njli.Material.create();
local sprite2D = njli.Sprite2D.create();
local image = njli.Image.create()


njli.World.getInstance():getWorldResourceLoader():load("shaders/spriteShader.vsh", "shaders/spriteShader.fsh", shader)
njli.World.getInstance():getWorldResourceLoader():load("images/basi0g01.png", image)
material:getDiffuse():loadGPU(image);
local imageWidth = image:getWidth()
local imageHeight = image:getHeight()
sprite2D:setMaterial(material)
sprite2D:setShaderProgram(shader)

for i=0, sprite2D:getMaxMeshes()-1 do
    sprite2D:setDimensions(i, njli.btVector2(imageWidth,imageHeight))
end

local transform = njli.btTransform(njli.btTransform.getIdentity())
local origin = njli.btVector3(0, 0, 0)

for i=0, sprite2D:getMaxMeshes()-1 do
    local node = njli.Node.create()
    node:getStateMachine():pushState(njli.NodeState.create())
    njli.World.getInstance():addNode(node)
    node:setGeometry(sprite2D)

    origin:setY(origin:y() + imageHeight)

    if(origin:y() > njli.World.getInstance():getViewportDimensions():y()) then
        origin:setY(0)
        origin:setX(origin:x() + imageWidth)
    end

    transform:setOrigin(origin)

    node:setTransform(transform)
end


local orthoCamera = njli.Camera.create()
orthoCamera:enableOrthographic()

njli.World.getInstance():addCamera(orthoCamera)




