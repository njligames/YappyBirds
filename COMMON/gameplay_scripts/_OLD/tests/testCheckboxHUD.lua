--njli.World.getInstance():getWorldFactory():destroyAll()


local scene = njli.Scene.create()
local shader = njli.ShaderProgram.create();
local material = njli.Material.create();
local sprite2D = njli.Sprite2D.create();
local image = njli.Image.create()


njli.World.getInstance():getWorldResourceLoader():load("shaders/objectShader.vsh", "shaders/objectShader.fsh", shader)
njli.World.getInstance():getWorldResourceLoader():load("images/birds0.png", image)

local font = njli.World.getInstance():getWorldHUD():createFont("sans", "fonts/Roboto-Regular.ttf")
if (font == -1) then
    print("Could not add font italic.\n");
end

local icons = njli.World.getInstance():getWorldHUD():createFont("icons", "fonts/entypo.ttf")
if (icons == -1) then
    print("Could not add font icons.\n");
end

local checkboxHUD = njli.CheckboxHUD.create()
material:getDiffuse():loadGPU(checkboxHUD);
local imageWidth = 2048
local imageHeight = 2048

-- material:getDiffuse():loadGPU(image);
-- local imageWidth = image:getWidth()
-- local imageHeight = image:getHeight()

sprite2D:setMaterial(material)
sprite2D:setShaderProgram(shader)

sprite2D:setDimensions(0, njli.btVector2(2048, 2048), njli.btVector2(0,0))

local i = 0

-- local testBirdFront = (loadfile(njli.ASSET_PATH("scripts/birds0.lua")))()


-- local spriteAtlas = create(testBirdFront:getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

-- local current_frame = 0
-- sprite2D:setSpriteAtlasFrame(i, spriteAtlas, current_frame)
-- local numberOfFrames = spriteAtlas:numberOfFrames()




local transform = njli.btTransform(njli.btTransform.getIdentity())
local origin = njli.btVector3(0, 0, 0)

local node = njli.Node.create()
-- node:getStateMachine():pushState(njli.NodeState.create())
njli.World.getInstance():addNode(node)
node:setGeometry(sprite2D)

transform:setOrigin(origin)

node:setTransform(transform)


local orthoCamera = njli.Camera.create()
orthoCamera:enableOrthographic()

njli.World.getInstance():addCamera(orthoCamera)













njli.World.getInstance():pushState(njli.WorldState.create())

function MyWorldStateEnter()

end

function MyWorldStateUpdate(timeStep)

end

function MyWorldStateExit()
end

function MyWorldStateTouchDown(touches)
	-- print(checkboxHUD);
	if checkboxHUD:isChecked() then
		checkboxHUD:unCheck()
	else
		checkboxHUD:check()
	end
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

function MyNodeMyNodeStateUpdate(node, timeStep)

	-- node:getGeometry():setSpriteAtlasFrame(0, spriteAtlas, current_frame)

	-- current_frame = current_frame + 1

	-- if(current_frame >= spriteAtlas:numberOfFrames()) then
	-- 	current_frame = 0
	-- end
end

function MyNodeMyNodeStateExit(node)
end