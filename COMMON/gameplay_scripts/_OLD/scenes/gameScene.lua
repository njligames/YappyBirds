local arg={...}

local drawTest = function(self)
    local d = njli.World.getInstance():getDebugDrawer()
    d:drawLine(njli.btVector3(0.008323,0.013545,0.100000), njli.btVector3(0.018323,0.013545,0.100000), njli.btVector4(1, 0, 0, 1));
    d:drawLine(njli.btVector3(0.018323,0.013545,0.100000), njli.btVector3(0.028323,0.013545,0.100000), njli.btVector4(0, 1, 0, 1));

    d:drawLine(njli.btVector3(0.028323,0.013545,0.100000), njli.btVector3(0.038323,0.013545,0.100000), njli.btVector4(0, 0, 1, 1));

    d:drawLine(njli.btVector3(0.038323,0.013545,0.100000), njli.btVector3(0.048323,0.013545,0.100000), njli.btVector4(0, 0, 1, 1));
    d:drawLine(njli.btVector3(0.048323,0.013545,0.100000), njli.btVector3(0.058323,0.013545,0.100000), njli.btVector4(0, 0, 1, 1));
end


local testPursue = function(self)
    local tx = function(x,y,layer)
        local origin = self:getOriginForLayer(x, y, layer)
        return self:transformCoordinate(origin)
    end

    -- local layer = 1
    -- local points = 
    -- {
    --     tx(80 + 256, 80, layer),
    --     tx(592 + 256, 80, layer),
    --     tx(512, 768, layer),
    -- }
    -- local dog = self:createDogNode(points)






    local count = 1
    local layer = 1

    -- print(njli.World.getInstance():getViewportDimensions() * 2)

    local points = 
    {
        tx(2048*.5, 600, layer),
        tx(80 + 256, 80, layer),
        tx(592 + 256, 80, layer),
        tx(512, 768, layer),
    }
    local theDog = self:createDogNode(points)
    -- theDog.movingEntity:getSteeringBehaviors():setFollowPathOff()

    local half_width = 80--110
    local half_height = 80--110

    local current_x = half_width
    local current_y = half_height

    local done = false
    local otherDogs = {}
    local otherDogsIdx = 1
    while not done and count < 40 do
        count = count + 1
        otherDogs[otherDogsIdx] = self:createDogNode({tx(current_x, current_y, layer)})
        otherDogs[otherDogsIdx].movingEntity:getSteeringBehaviors():setFollowPathOff()
        -- otherDogs[otherDogsIdx].movingEntity:getSteeringBehaviors():setEvadeOn(theDog.movingEntity)
        otherDogs[otherDogsIdx].movingEntity:getSteeringBehaviors():setPursuitOn(theDog.movingEntity)
        otherDogsIdx = otherDogsIdx + 1
        current_x = current_x + (half_width * 2)
        if current_x > 2048 then
            current_x = half_width
            current_y = current_y + (half_height * 2)
            if current_y > 1024 then
                done = true
            end
        end
    end

    for i=1,#otherDogs do
        otherDogs[i].movingEntity:setTagged(true)
        otherDogs[i].movingEntity:getSteeringBehaviors():setSeparationOn(otherDogs)
    end
    print("There are now " .. count .. " entities " .. #otherDogs)
end

local testEvade = function(self)
    local tx = function(x,y,layer)
        local origin = self:getOriginForLayer(x, y, layer)
        return self:transformCoordinate(origin)
    end

    -- local layer = 1
    -- local points = 
    -- {
    --     tx(80 + 256, 80, layer),
    --     tx(592 + 256, 80, layer),
    --     tx(512, 768, layer),
    -- }
    -- local dog = self:createDogNode(points)






    local count = 1
    local layer = 1

    print(njli.World.getInstance():getViewportDimensions() * 2)

    local points = 
    {
        tx(2048*.5, 600, layer),
        tx(80 + 256, 80, layer),
        tx(592 + 256, 80, layer),
        tx(512, 768, layer),
    }
    local theDog = self:createDogNode(points)
    -- theDog.movingEntity:getSteeringBehaviors():setFollowPathOff()

    local half_width = 80--110
    local half_height = 80--110

    local current_x = half_width
    local current_y = half_height

    local done = false
    while not done and count < 60 do
        count = count + 1
        local d = self:createDogNode({tx(current_x, current_y, layer)})
        d.movingEntity:getSteeringBehaviors():setFollowPathOff()
        -- d.movingEntity:getSteeringBehaviors():setEvadeOn(theDog.movingEntity)
        d.movingEntity:getSteeringBehaviors():setEvadeOn(theDog.movingEntity)
        current_x = current_x + (half_width * 2)
        if current_x > 2048 then
            current_x = half_width
            current_y = current_y + (half_height * 2)
            if current_y > 1024 then
                done = true
            end
        end
    end

    print("There are now " .. count .. " entities")
end

















local subLayerOffset = -0.1

local translateDogWayPoints = function(self, points)
    local tx = function(x,y,layer)
        local origin = self:getOriginForLayer(x, y, layer)
        return self:transformCoordinate(origin)
    end
    local translatedPoints = {}
    local idx = 1

    for k,v in pairs(points) do
        translatedPoints[idx] = tx(v.x, v.y, v.layer)
        idx = idx + 1
    end

    return translatedPoints

end

local getOriginForLayer = function(self, x, y, layer, sublayer)
    local divisor = self:getDivisor()
    local x_offset = (0.5 * self.scale )
    local y_offset = (0.5 * self.scale )

    local xx = ((self.WORLD_XOFFSET) + ((x/divisor)-x_offset))
    local yy = ((self.WORLD_YOFFSET) + ((y/divisor)-y_offset))
    local offset = 0
    if sublayer ~= nil then
        offset = (sublayer * subLayerOffset)
    end

    local zz = self.LAYER_MAX + (0.1 - (self.LAYER_DISTANCE * (layer - 1))) + offset

    return njli.btVector3(xx, yy, zz)
end

local transformCoordinate = function(self, origin)
    local myself = self
    function adjustPosition(oldPosition, newDistance)
        local ret = oldPosition
        local totalDistanceFromCamera = myself.LAYER_MAX - 0.1

        if newDistance ~= totalDistanceFromCamera then
            local theta = math.atan(oldPosition, totalDistanceFromCamera)
            local newPosition = math.tan(theta) * newDistance
            ret = newPosition
        end

        return ret
    end

    local zz = origin:z()
    local xx = adjustPosition(origin:x(), zz)
    local yy = adjustPosition(origin:y(), zz)

    return njli.btVector3(xx, yy, zz)
end

local getDivisor = function(self)
    return math.floor(2048 / self.scale)
end

function birdTypeToFilename(type)
    return "character_puffyBird_idle_front"
end

function projectileTypeToFilename(type)
    return "projectile_waterBalloon_thrown_front"
end

function dogFilename()
    return "character_dog_run_side"
end

local createBirdNode = function(self, spawnPoint)
    print("Spawning " .. spawnPoint.birdType)

    local fileName = birdTypeToFilename(type)
    local instanceName = self.birdInstanceCount .. "/" .. fileName
    self.birdInstanceCount = self.birdInstanceCount + 1

    local birdNode = require "birdNode"

    self.nodes[instanceName] = birdNode.new(instanceName, self.characterSpriteAtlas, self.characterGeometry, self.theDog, self.level)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(njli.World.getInstance():getScene():getRootNode():getCamera())

    local frameName = self.nodes[instanceName].frameName
    -- print("Getting frame index for frame name: " .. frameName)
    local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    local sheet = self.characterSheetInfo:getSheet()
    local width = sheet.frames[frameIndex].widthFile - 2
    local height = sheet.frames[frameIndex].heightFile - 2

    local divisor = self:getDivisor()
    local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite)

    local origin = self:getOriginForLayer(spawnPoint.x, spawnPoint.y, spawnPoint.layer)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    self.nodes[instanceName]:setType(spawnPoint.birdType)

    return self.nodes[instanceName]
    -- self.nodes[instanceName].node.movingEntity:getSteeringBehaviors():setPursuitOn(self.theDog.movingEntity)
end

local createProjectileNode = function(self, x, y, type)
    local fileName = projectileTypeToFilename(type)
    local instanceName = self.projectileInstanceCount .. "/" .. fileName
    self.projectileInstanceCount = self.projectileInstanceCount + 1

    local balloonNode = require "balloonNode"

    self.nodes[instanceName] = balloonNode.new(instanceName, self.characterSpriteAtlas, self.characterGeometry, self.theShader)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(njli.World.getInstance():getScene():getRootNode():getCamera())

    local frameName = self.nodes[instanceName].frameName
    local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    local sheet = self.characterSheetInfo:getSheet()
    local width = sheet.frames[frameIndex].widthFile - 2
    local height = sheet.frames[frameIndex].heightFile - 2

    local divisor = self:getDivisor()
    local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    local pp = njli.btVector2( 0.5, 0.5 )
    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite, pp)

    local origin = self:getOriginForLayer(x, y, 4)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    return self.nodes[instanceName]
end

local createDogNode = function(self, points)
    local fileName = dogFilename()
    local instanceName = self.dogInstanceCount .. "/" .. fileName
    self.dogInstanceCount = self.dogInstanceCount + 1

    local dogNode = require "dogNode"

    self.nodes[instanceName] = dogNode.new(instanceName, self.characterSpriteAtlas, self.characterGeometry, points)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(njli.World.getInstance():getScene():getRootNode():getCamera())

    local frameName = self.nodes[instanceName].frameName
    print("Getting frame index for frame name: " .. frameName)
    local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    local sheet = self.characterSheetInfo:getSheet()
    local width = sheet.frames[frameIndex].widthFile - 2
    local height = sheet.frames[frameIndex].heightFile - 2

    local divisor = self:getDivisor()
    local xdim = (width/divisor)*2
    local ydim = ((height/divisor)*2)
    local dimSprite = njli.btVector2( xdim, ydim )
    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite)
    -- self.nodes[instanceName].node:getPhysicsBody():getPhysicsShape():setHalfExtents(njli.btVector3( xdim, ydim, 1 ))
    -- print(self.nodes[instanceName].node:getPhysicsBody():getPhysicsShape())
    local physicsShape = self.nodes[instanceName].node:getPhysicsBody():getPhysicsShape()
    print("check up")

    -- local origin = self:getOriginForLayer(x, y, layer)
    -- origin = self:transformCoordinate(origin)

    

    local origin = points[1]

    -- print(string.format("The origin from the path is %s", origin))
    -- print_r(points)

    
    

    self.nodes[instanceName].node:setOrigin(origin)

    return self.nodes[instanceName]
end

local createTileNode = function(self, x, y, layer, opacity, tile, instanceName, sublayer)
    local instanceName = self.tileInstanceCount .. "/" .. tile.image
    self.tileInstanceCount = self.tileInstanceCount + 1

    local obstacleNode = require "obstacleNode"

    self.nodes[instanceName] = obstacleNode.new(instanceName, self.tileSpriteAtlas, self.tileGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(njli.World.getInstance():getScene():getRootNode():getCamera())

    local origin = self:getOriginForLayer(x, y, layer, sublayer)
    local scaleFactor = (origin:z() / self.LAYER_MAX)

    local width = tile.width * scaleFactor
    local height = tile.height * scaleFactor
    local divisor = self:getDivisor()

    origin = self:transformCoordinate(origin)
    self.nodes[instanceName].node:setOrigin(origin)

    local d = njli.btVector2( (width / divisor) * 2, (height / divisor) * 2 )
    local pp = njli.btVector2( 0, 0 )

    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, d , pp)
end

-- local createBirdSpawnNode = function(self, layer, spawnPoint, opacity, instanceName)
--     local instanceName = self.birdSpawnInstanceCount .. "/" .. spawnPoint.name
--     self.birdSpawnInstanceCount = self.birdSpawnInstanceCount + 1
    
--     local birdSpawnNode = require "birdSpawnNode"

--     self.nodes[instanceName] = birdSpawnNode.new(instanceName, self.birdSpawnGeometry, spawnPoint)
--     njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

--     local width = spawnPoint.width
--     local height = spawnPoint.height
--     local divisor = self:getDivisor()

--     local origin = self:getOriginForLayer(spawnPoint.x, spawnPoint.y, spawnPoint.layer)
--     local scaleFactor = origin:z() / self.LAYER_MAX

--     origin = self:transformCoordinate(origin)
--     self.nodes[instanceName].node:setOrigin(origin)

--     local d = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )

--     self.nodes[instanceName].node:setScale(njli.btVector3(self.scale, self.scale, 0.0))
-- end

-- local createDogWayPointNode = function(self, layer, wayPoint, opacity, instanceName)
--     local origin = self:getOriginForLayer(wayPoint.x, wayPoint.y, layer)
--     print("createDogWayPointNode " .. origin)
-- end

local createTexturePackerSpriteAtlas = function(self, file, shader)
    local image = njli.Image.create()
    local material = njli.Material.create()
    local geometry = njli.Sprite2D.create()

    local imagePath = "images/" .. file .. ".png"
    local luaPath = "scripts/" .. file .. ".lua"

    local sheetInfo = (loadfile(njli.ASSET_PATH(luaPath)))()
    assert(sheetInfo ~= nil, "Unable to load the sheet info for file " .. luaPath)

    local spriteAtlas = create(sheetInfo:getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
    assert(spriteAtlas ~= nil, "Unable to load the spriteatlas for file " .. luaPath)

    njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)

    material:getDiffuse():loadGPU(image)
    njli.World.getInstance():getWorldFactory():destroy(image)
    image = nil

    geometry:addMaterial(material)
    geometry:addShaderProgram(shader)


    return spriteAtlas, sheetInfo, geometry, material
end

local renderHUD = function(self)
    -- print("gameScene renderHUD")
end

local push = function(self)
    njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end


local enter = function(self, scene)

    

    local cameraNode = njli.World.getInstance():getScene():getRootNode()
    cameraNode:getCamera():enableOrthographic(false)
    cameraNode:getCamera():setRenderCategory(RenderCategories.perspective)
    cameraNode:setOrigin(njli.btVector3(0, 0, 0))

    

    self.characterSpriteAtlas, self.characterSheetInfo, self.characterGeometry, self.characterMaterial = self:createTexturePackerSpriteAtlas("gameplay0", self.theShader)

    self.tileSpriteAtlas, self.tileSheetInfo, self.tileGeometry, self.tileMaterial = self:createTexturePackerSpriteAtlas("tilesheet_background_" .. self.level.gameBoard .. "0", self.theShader)
    
    self.level:createNodes(self)

    print("There are " .. self.level:totalBirds() .. " birds to spawn")




    -- njli.World.getInstance():enableDebugDraw(cameraNode:getCamera(), self.theShader)

    
    local points = self:translateDogWayPoints(self.level.dogWayPoints)
    self.theDog = self:createDogNode(points)
    
    
    return self.nodes
end



local update = function(self, scene, timeStep)

    self.level.spawnMachine:tick(timeStep, self)

    if self.theDog:isCaptured() then
        print("The dog is capture")
        self.nodes['You Lose']:show(self.orthoCamera)
        -- njli.World.getInstance():getScene():getStateMachine():pushState(_menuSceneStateNames.levelselect)
        -- PushWorldState(_worldStateNames.game)
        self:push()
    end

    if self.level.spawnMachine:killedAllBirds() then
        print("all birds killed")
        self.nodes['You Win']:show(self.orthoCamera)
        -- njli.World.getInstance():getScene():getStateMachine():pushState(_menuSceneStateNames.levelselect)
        -- PushWorldState(_worldStateNames.game)
        self:push()
    end
end

local exit = function(self, scene)
    -- print(getSceneStateName() .. " exit")

    for k,v in pairs(self.nodes) do
        self.nodes[k].node:getStateMachine():clear(false)
        self.nodes[k]:__gc()
    end
    self.nodes = {}
end

local onMessage = function(self, scene, message)
end

local onMessage = function(self, message)
    print("onMessage")
end

local touchDown = function(self, touches)
    -- print(touches[1]:getPosition())

    local projectile = nil
    if njli.isIOS() then
        projectile = self:createProjectileNode(touches[1]:getPosition():x()*2, touches[1]:getPosition():y()*2, 4)
    elseif njli.isANDROID() then
        projectile = self:createProjectileNode(touches[1]:getPosition():x(), touches[1]:getPosition():y(), 4)
    end


    local direction = njli.btVector3(0, 0, 1)
    local magnitude = self.Prm.Projectile["WaterBalloon"].Magnitude
    local degrees = self.Prm.Projectile["WaterBalloon"].Degrees


    local x = projectile.node:getWorldTransform():getOrigin():x()
    local y = projectile.node:getWorldTransform():getOrigin():y()
    local z = projectile.node:getWorldTransform():getOrigin():z()

    direction = direction:rotate(njli.btVector3(-1,0,0), math.atan(degrees, z))
    direction = direction:rotate(njli.btVector3(0,1,0), math.atan(x, z))
    direction = direction:rotate(njli.btVector3(-1,0,0), math.atan(y, z))

    

    projectile.node:getPhysicsBody():applyForce(direction * magnitude, true)


    -- print(projectile.node:getOrigin())
    -- print(njli.btVector2(0, 0))
    -- print(njli.btVector3(0, 0, 0))
    -- print(njli.btVector4(0, 0, 0, 0))
    -- local localA = njli.btVector3(0, 0, 0)
    -- local localB = njli.btVector3(0, 0, 0)
    -- local normalOnBInWorld = njli.btVector3(1, 0, 0)
    -- local depth = 1
    -- print(njli.btManifoldPoint(localA,localB,normalOnBInWorld,depth))
    -- local axis = njli.btVector3(0,1,0)
    -- local angle = 1
    -- print(njli.btQuaternion(axis, angle))

    -- print(njli.btMatrix3x3(0,1,2,3,4,5,6,7,8))
    -- print(njli.btTransform(njli.btTransform.getIdentity()))
end

local touchUp = function(self, touches)
    -- print(touches[1]:getPosition())
end

local touchMove = function(self, touches)
    -- print(touches[1]:getPosition())
end

local touchCancelled = function(self, touches)
    -- print("touchCancelled")
end




local delete = function(self)

    --delete nodestates
    for k,v in pairs(self.nodes) do
        self.nodes[k].node:getStateMachine():clear(false)
        self.nodes[k]:__gc()
    end
    self.nodes = {}

    --delete scenestate
    njli.World.getInstance():getWorldFactory():destroy(self.sceneState)
end

local methods = 
{
    translateDogWayPoints = translateDogWayPoints,
    getOriginForLayer = getOriginForLayer,
    transformCoordinate = transformCoordinate,
    getDivisor = getDivisor,

    createBirdNode = createBirdNode,
    createProjectileNode = createProjectileNode,
    createDogNode = createDogNode,

    createTileNode = createTileNode,
    -- createBirdSpawnNode = createBirdSpawnNode,
    -- createDogWayPointNode = createDogWayPointNode,
    createTexturePackerSpriteAtlas = createTexturePackerSpriteAtlas,

    renderHUD = renderHUD,
    push = push,
    enter = enter,
    update = update,
    exit = exit,
    onMessage = onMessage,
    
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,

    __gc = delete,

    drawTest = drawTest,
    testPursue = testPursue,
    testEvade = testEvade,
}

local new = function(name, shader)
    local levelLoader = require "levelLoader"
    local level = levelLoader.new(self)

    local gameMode = level.gameModes.ARCADE
    local gameBoard = level.gameBoards.COUNTRY
    local gameLevel = level.gameLevels[1]

    local sceneState = njli.SceneState.create()
    sceneState:setName(name)

    local IMAGE_SCALE = 89.0

    -- local WORLD_YOFFSET = 19.4
    local WORLD_YOFFSET = 19.7
    local WORLD_XOFFSET = 0.0
    local LAYER_DISTANCE = 15.24 --meters (50 feet)
    local LAYER_MAX = 60.96 --meters (200 feet)

    level:loadLevel(gameMode, gameBoard, gameLevel)


    local birdSpawnGeometry = njli.Sprite2D.create()

    local assetPath = njli.ASSET_PATH("scripts/Params.lua")
    local Prm = loadfile(assetPath)()

    local bmf = require('bmf')
    local bmflabel = bmf.loadFont('RetroFont.fnt')
    local fontMaterial = njli.Material.create()
    local fontGeometry = njli.Sprite2D.create()

    local winString, winRect = bmf.newString(bmflabel, 'You Win', fontMaterial, fontGeometry, shader)

    local wordsX = (njli.World.getInstance():getViewportDimensions():x()/2) - (winRect.width / 2)
    local wordsY = (njli.World.getInstance():getViewportDimensions():y()/3)
    wordsY = wordsY * 2

    winString:setOrigin(njli.btVector3(wordsX, wordsY, 0))
    local loseString, loseRect = bmf.newString(bmflabel, 'You Lose', fontMaterial, fontGeometry, shader)
    loseString:setOrigin(njli.btVector3(wordsX, wordsY,0))
    
    local orthoNode = njli.Node.create()
    local orthoCamera = njli.Camera.create()
    orthoCamera:enableOrthographic()
    orthoCamera:setRenderCategory(RenderCategories.orthographic)
    orthoNode:addCamera(orthoCamera)

    local nodes = {}
    nodes['You Win'] = winString
    nodes['You Lose'] = loseString

    


    local properties = 
    {
        sceneState = sceneState,
        nodes = nodes,

        WORLD_YOFFSET = WORLD_YOFFSET,
        WORLD_XOFFSET = WORLD_XOFFSET,
        LAYER_DISTANCE = LAYER_DISTANCE,
        LAYER_MAX = LAYER_MAX,

        characterGeometry = nil, 
        characterMaterial = nil,
        characterSpriteAtlas = nil,
        characterSheetInfo = nil,

        tileGeometry = nil, 
        tileMaterial = nil,
        tileSpriteAtlas = nil,
        tileSheetInfo = nil,

        birdSpawnGeometry = birdSpawnGeometry,

        level = level,
        scale = IMAGE_SCALE,

        birdInstanceCount = 0,
        dogInstanceCount = 0,
        projectileInstanceCount = 0,

        tileInstanceCount = 0,
        birdSpawnInstanceCount = 0,
        backgroundInstanceCount = 0,

        fontMaterial = fontMaterial,
        fontGeometry = fontGeometry,

        --DONT DELETE
        theShader = shader,
        theDog = nil,
        bmflabel = bmflabel,
        Prm = Prm,

        winRect = winRect,
        loseRect = loseRect,

        orthoNode = orthoNode,
        orthoCamera = orthoCamera,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
