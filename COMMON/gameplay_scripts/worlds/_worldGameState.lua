-- local getDivisor = function(self)
--     return math.floor(2048 / self.scale)
-- end

local translateDogWayPoints = function(self, points)
    local tx = function(x,y,layer, sublayer)
        local origin = self:getOriginForLayer(x, y, layer, sublayer)
        return self:transformCoordinate(origin)
    end
    local translatedPoints = {}
    local idx = 1

    for k,v in pairs(points) do
        translatedPoints[idx] = tx(v.x, v.y, v.layer, v.sublayer)
        idx = idx + 1
    end

    return translatedPoints

end

local getOriginForLayer = function(self, x, y, layer, sublayer)
    local subLayerOffset = -0.1
    local divisor = getGameViewDivisor()--self:getDivisor()
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
local createTileNode = function(self, x, y, layer, opacity, tile, instanceName, sublayer, tileSpriteAtlas, tileGeometry)
    local instanceName = self.tileInstanceCount .. "/" .. tile.image
    self.tileInstanceCount = self.tileInstanceCount + 1

    local obstacleNode = require "nodes.obstacleNode"

    self.nodes[instanceName] = obstacleNode.new(instanceName, tileSpriteAtlas, tileGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    local origin = self:getOriginForLayer(x, y, layer, sublayer)
    local scaleFactor = (origin:z() / self.LAYER_MAX)

    local width = (tile.width - 2) * scaleFactor
    local height = (tile.height - 2) * scaleFactor
    local divisor = getGameViewDivisor()--self:getDivisor()

    origin = self:transformCoordinate(origin)
    self.nodes[instanceName].node:setOrigin(origin)

    local d = njli.btVector2( (width / divisor) * 2, (height / divisor) * 2 )
    local pp = njli.btVector2( 0, 0 )

    self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, d , pp)

    insertNodeObject(self.nodes[instanceName], instanceName)
end

local createDogNode = function(self, points)
    local fileName = dogFilename()
    local instanceName = self.dogInstanceCount .. "/" .. fileName
    self.dogInstanceCount = self.dogInstanceCount + 1

    -- local dogNode = require "nodes.dogNode"
    local dogNode = require "nodes.dogNodeObject"

    self.nodes[instanceName] = dogNode.new(instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, points)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)


    -- local frameName = self.nodes[instanceName].frameName
    -- -- print("Getting frame index for frame name: " .. frameName)
    -- local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    -- local sheet = self.characterSheetInfo:getSheet()
    -- local width = sheet.frames[frameIndex].width - 2
    -- local height = sheet.frames[frameIndex].height - 2

    -- local divisor = getGameViewDivisor()--self:getDivisor()
    -- local xdim = (width/divisor)*2
    -- local ydim = ((height/divisor)*2)
    -- local dimSprite = njli.btVector2( xdim, ydim )
    -- self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite)

    local physicsShape = self.nodes[instanceName].node:getPhysicsBody():getPhysicsShape()
    

    

    local origin = points[1]

    self.nodes[instanceName].node:setOrigin(origin)

    insertNodeObject(self.nodes[instanceName], instanceName)

    return self.nodes[instanceName]
end

local destroyBirdNode = function(self, birdNode)

    self.level.spawnMachine:killBird()

    for k,v in pairs(self.birdNodes) do
        v:removeOtherBird(self.birdNodes[birdNode.instanceName])
    end
    
    self.nodes[birdNode.instanceName] = nil
    removeNodeObject(birdNode)

    

    self.birdNodes[birdNode.instanceName] = nil

end

local createBirdNode = function(self, spawnPoint)
    -- print("Spawning " .. spawnPoint.birdType)

    local fileName = birdTypeToFilename(spawnPoint.birdType)
    local instanceName = self.birdInstanceCount .. "/" .. fileName
    self.birdInstanceCount = self.birdInstanceCount + 1

    -- local birdNode = require "nodes.birdNode"
    local birdNode = require "nodes.birdNodeObject"

    self.nodes[instanceName] = birdNode.new(self, instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, self.theDog, self.level, spawnPoint.birdType)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    self.nodes[instanceName].node:show(getPerspectiveCamera())

    -- local frameName = self.nodes[instanceName].frameName
    -- local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    -- local sheet = self.characterSheetInfo:getSheet()
    -- local width = sheet.frames[frameIndex].width - 2
    -- local height = sheet.frames[frameIndex].height - 2

    -- local divisor = getGameViewDivisor()
    -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite)

    local origin = self:getOriginForLayer(spawnPoint.x, spawnPoint.y, spawnPoint.layer, spawnPoint.sublayer)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    -- self.nodes[instanceName]:setType(spawnPoint.birdType)

    insertNodeObject(self.nodes[instanceName], instanceName)

    for k,v in pairs(self.birdNodes) do
        self.nodes[instanceName]:addOtherBird(v)
    end
    
    self.birdNodes[instanceName] = self.nodes[instanceName]













    


    




















    return self.nodes[instanceName]
    -- self.nodes[instanceName].node.movingEntity:getSteeringBehaviors():setPursuitOn(self.theDog.movingEntity)
end

local destroyProjectileNode = function(self, projectile)
    self.nodes[projectile.instanceName] = nil
    removeNodeObject(projectile)
end

local createProjectileNode = function(self, x, y, type)
    local fileName = projectileTypeToFilename(type)
    local instanceName = self.projectileInstanceCount .. "/" .. fileName
    self.projectileInstanceCount = self.projectileInstanceCount + 1

    local balloonNode = require "nodes.balloonNode"

    -- local xx = self.level.spawnMachine:getPoint(59).spawnPoint.x
    -- local yy = self.level.spawnMachine:getPoint(59).spawnPoint.y
    -- local layerlayer = self.level.spawnMachine:getPoint(59).spawnPoint.layer
    -- local po = self:transformCoordinate(self:getOriginForLayer(xx, yy, layerlayer))

    --  po = getPerspectiveCamera():unProject(njli.btVector2(xx, yy))

    -- print(self:transformCoordinate(self:getOriginForLayer(xx, yy, 1)))
    -- print(self:transformCoordinate(self:getOriginForLayer(xx, yy, 4)))

    -- po:setZ(200)

    self.nodes[instanceName] = balloonNode.new(self, instanceName, self.characterSheetInfo, self.characterSpriteAtlas, self.characterGeometry, self.particleGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[instanceName].node)

    

    -- local frameName = self.nodes[instanceName].frameName
    -- local frameIndex = self.characterSheetInfo:getFrameIndex(frameName)

    -- local sheet = self.characterSheetInfo:getSheet()
    -- local width = sheet.frames[frameIndex].width - 2
    -- local height = sheet.frames[frameIndex].height - 2

    -- local divisor = getGameViewDivisor()--self:getDivisor()
    -- local dimSprite = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- local pp = njli.btVector2( 0.5, 0.5 )
    -- self.nodes[instanceName].node:getGeometry():setDimensions(self.nodes[instanceName].node, dimSprite, pp)

    local origin = self:getOriginForLayer(x, y, 4)
    origin = self:transformCoordinate(origin)

    self.nodes[instanceName].node:setOrigin(origin)

    insertNodeObject(self.nodes[instanceName], instanceName)






    

    -- self.nodes[instanceName].node:setOrigin(self.nodes[instanceName].particleOrigin)



    return self.nodes[instanceName]
end

--################################################################

local addUserData = function(self, key, value)
    self.userdata[key] = value
end

local getUserData = function(self, key)
    return self.userdata[key]
end

local currentState = function(self)
    local scene = njli.World.getInstance():getScene()
    if scene then
        local sceneState = scene:getStateMachine():getState()
        if sceneState then
            return self.sceneStates[sceneState:getName()]
        end
    end

    return nil
end

local push = function(self)
    njli.World.getInstance():getStateMachine():pushState(self.worldState)
end

local enter = function(self)
    print_r(self:getUserData("userdata"))
    print("enter (" .. self.worldState:getName() .. ") - START")

    self.currentFunctionIndex = 1

    print("enter (" .. self.worldState:getName() .. ") - END")


    -- local camera = getPerspectiveCamera()
    -- local shader = getShaderProgram()
    -- njli.World.getInstance():enableDebugDraw(camera, shader)

    -- njli.World.getInstance():setBackgroundColor(njli.btVector4(0.52, 0.86, 0.99, 1.0))
    
    return self.sceneStates
end

local update = function(self, timeStep)
    if self.currentFunctionIndex <= #self.loadingFunctions then
        -- print(self.currentFunctionIndex .. " of " .. #self.loadingFunctions)
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1
    else
        --update menu.
    end

    return self.sceneStates
end

local renderHUD = function(self)
    local state = self:currentState()
    if state ~= nil then
        state:renderHUD()
    end
end

local pause = function(self)
    local state = self:currentState()
    if state ~= nil then
        state:pause()
    end
end

local unPause = function(self)
    local state = self:currentState()
    if state ~= nil then
        state:pause()
    end
end

local exit = function(self)
    local stateName = self.worldState:getName()

    self.soundBackground:stop()

    print("exit (" .. stateName .. ") - START")

    for k,v in pairs(self.nodes) do
        removeNodeObject(self.nodes[k])
    end
    self.nodes = {}

    self.birdNodes = {}

    njli.Material.destroy(self.fontMaterial)
    self.fontMaterial = nil

    njli.Geometry.destroy(self.fontGeometry)
    self.fontGeometry = nil


    njli.Geometry.destroy(self.particleGeometry)
    njli.Material.destroy(self.particleMaterial)
    

    for k,v in pairs(self.characterSpriteAtlas) do
        njli.SpriteFrameAtlas.destroy(v)
    end
    self.characterSpriteAtlas = nil

    for k,v in pairs(self.characterGeometry) do
        njli.Geometry.destroy(v)
    end
    self.characterGeometry = nil

    for k,v in pairs(self.characterMaterial) do
        njli.Material.destroy(v)
    end
    self.characterMaterial = nil
    

    njli.SpriteFrameAtlas.destroy(self.tileSpriteAtlas)
    njli.Geometry.destroy(self.tileGeometry)
    njli.Material.destroy(self.tileMaterial)

    

    for k,v in pairs(self.sceneStates) do
        self.sceneStates[k]:__gc()
    end

    self.sceneStates = {}

    print("exit (" .. stateName .. ") - END")

    return self.sceneStates
end

local onMessage = function(self, message)
    local state = self:currentState()
    if state ~= nil then
        state:onMessage(message)
    end
end

local touchDown = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchDown(touches)
    end
end

local touchUp = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchUp(touches)
    end
end

local touchMove = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchMove(touches)
    end
end

local touchCancelled = function(self, touches)
    local state = self:currentState()
    if state ~= nil then
        state:touchCancelled(touches)
    end
end

local delete = function(self)
    local stateName = self.worldState:getName()

    njli.Sound.destroy(self.soundBackground)

    print("delete (" .. stateName .. ") - START")

    -- self:exit()
    njli.World.getInstance():getStateMachine():pushState(nil)

    njli.WorldState.destroy(self.worldState)
    self.worldState = nil

    print("delete (" .. stateName .. ") - END")
end

local methods = 
{  
    -- getDivisor = getDivisor,
    translateDogWayPoints = translateDogWayPoints,
    getOriginForLayer = getOriginForLayer,
    transformCoordinate = transformCoordinate,
    createTileNode = createTileNode,
    createDogNode = createDogNode,

    destroyBirdNode = destroyBirdNode,
    createBirdNode = createBirdNode,

    destroyProjectileNode = destroyProjectileNode,
    createProjectileNode = createProjectileNode,

--####################################################################

    addUserData = addUserData,
    getUserData = getUserData,
       
    currentState = currentState,
    push = push,
    pushSceneState = pushSceneState,
    enter = enter,
    update = update,
    renderHUD = renderHUD,
    pause = pause,
    unPause = unPause,
    exit = exit,
    onMessage = onMessage,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,
    __gc = delete
}

local new = function(name)
    print("new (" .. name .. ") - START")

    local worldState = njli.WorldState.create()
    worldState:setName(name)

    local loadingFunctions =
    {
        function(self)
            self.characterSpriteAtlas, self.characterSheetInfo, self.characterGeometry, self.characterMaterial = createTexturePackerSpriteAtlas("gameplay", getShaderProgram())
        end,
        function(self)
            local tileSpriteAtlas, tileSheetInfo, tileGeometry, tileMaterial = createTexturePackerSpriteAtlas("tilesheet_background_" .. self.gameBoard, getShaderProgram())

            self.tileSpriteAtlas = tileSpriteAtlas[1]
            self.tileSheetInfo   = tileSheetInfo[1]
            self.tileGeometry    = tileGeometry[1]
            self.tileMaterial    = tileMaterial[1]
        end,
        function(self)
            self.particleGeometry, self.particleMaterial = createParticleGeometryAndMaterial("particle_water_splash.png", getShaderProgram())
        end,
        

        function(self)
            local bmf = require 'bitmapFontLoader'
            local pushButtonNode = require "nodes.pushButtonNode"
            local textNode = require "nodes.textNode"

            local bmflabel = bmf.loadFont('RetroFont.fnt')

            self.fontMaterial = njli.Material.create()
            self.fontGeometry = njli.Sprite2D.create()


            local winNode = textNode.new("You Win", 
                                            bmflabel, 
                                            self.fontMaterial, 
                                            self.fontGeometry, 
                                            getShaderProgram())
            local wordsX = (njli.World.getInstance():getViewportDimensions():x()/2) - (winNode.rect.width / 2)
            local wordsY = (njli.World.getInstance():getViewportDimensions():y()/3)
            wordsY = wordsY * 2
            winNode.node:setOrigin(njli.btVector3(wordsX, wordsY, 0))

            local loseNode = textNode.new("You Lose", 
                                            bmflabel, 
                                            self.fontMaterial, 
                                            self.fontGeometry, 
                                            getShaderProgram())
            wordsX = (njli.World.getInstance():getViewportDimensions():x()/2) - (loseNode.rect.width / 2)
            wordsY = (njli.World.getInstance():getViewportDimensions():y()/3)
            wordsY = wordsY * 2
            loseNode.node:setOrigin(njli.btVector3(wordsX, wordsY,0))

            self.nodes['You Win'] = winNode
            self.nodes['You Lose'] = loseNode

            insertNodeObject(winNode, 'You Win')
            insertNodeObject(loseNode, 'You Lose')
        end,

        








        function(self)
            local assetPath = njli.ASSET_PATH("scripts/Params.lua")
            if njli.World.getInstance():isDebug() then
                assetPath = njli.DOCUMENT_PATH("scripts/Params.lua")
            end
            
            self.Prm = loadfile(assetPath)()
        end,
        function(self)
            local yappyBirdLevelLoader = require "yappyBirdLevelLoader"
            self.level = yappyBirdLevelLoader.new(self)

            -- print_r(self:getUserData("userdata"))
        --     gameMode = _gameModes.ARCADE,
        -- gameBoard = _gameBoards.COUNTRY,
        -- gameLevel = _gameLevels[1],

        

            local gameMode = nil
            local gameBoard = nil
            local gameLevelNumber = nil

-- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
--             print_r(self:getUserData("userdata"))
--             print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

            if self:getUserData("userdata") ~= nil then

                gameMode = self:getUserData("userdata").gameMode
                gameBoard = self:getUserData("userdata").gameBoard
                gameLevelNumber = self:getUserData("userdata").gameLevelNumber

            else

                gameMode = _currentLevel.gameMode
                gameBoard = _currentLevel.gameBoard
                gameLevelNumber = _currentLevel.gameLevelNumber

                gameLevelNumber = gameLevelNumber + 1
                if gameLevelNumber > 5 then
                    gameLevelNumber = 1
                end
                
            end

            _currentLevel.gameMode = gameMode
            _currentLevel.gameBoard = gameBoard
            _currentLevel.gameLevelNumber = gameLevelNumber

            local gameLevel = _gameLevels[gameLevelNumber]

-- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
-- print(gameMode, gameBoard, gameLevelNumber, gameLevel)
-- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

            self.level:loadLevel(gameMode, gameBoard, gameLevel)
            self.level:createNodes(self, self.tileSpriteAtlas, self.tileGeometry)

            -- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
            -- print_r(self.level.backgroundColor)
            -- njli.World.getInstance():setBackgroundColor(self.level.backgroundColor)
            -- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        end,
        function(self)
            local points = self:translateDogWayPoints(self.level.dogWayPoints)
            self.theDog = self:createDogNode(points)
        end,
        function(self)
            for k,v in pairs(self.nodes) do
                self.nodes[k].node:show(getPerspectiveCamera())
            end
        end,

        function(self)

            local gamePlayScene = require "scenes.gamePlayScene"
            self.sceneStates[_gameSceneStateNames.play] = gamePlayScene.new(_gameSceneStateNames.play, self)

            local gamePauseScene = require "scenes.gamePauseScene"
            self.sceneStates[_gameSceneStateNames.pause] = gamePauseScene.new(_gameSceneStateNames.pause)

            local gameWinScene = require "scenes.gameWinScene"
            self.sceneStates[_gameSceneStateNames.win] = gameWinScene.new(_gameSceneStateNames.win)

            local gameLoseScene = require "scenes.gameLoseScene"
            self.sceneStates[_gameSceneStateNames.lose] = gameLoseScene.new(_gameSceneStateNames.lose)

        end,

        function(self)
            self.soundBackground = njli.Sound.create()
            njli.World.getInstance():getWorldResourceLoader():load("sounds/interface/interface_gameplay-theme.wav", self.soundBackground)
        end,


        function(self)
            self.soundBackground:play();
            self.sceneStates[_gameSceneStateNames.play]:push()
        end,
    }

    local properties = 
    {
        worldState = worldState,
        loadingFunctions = loadingFunctions,
        sceneStates = {},
        userdata = {},
        nodes = {},
        gameBoard = "country",


        WORLD_YOFFSET = 19.7,
        WORLD_XOFFSET = 0.0,
        LAYER_DISTANCE = 15.24, --meters (50 feet)
        LAYER_MAX = 60.96, --meters (200 feet)
        scale = 89.0,

        birdInstanceCount = 0,
        dogInstanceCount = 0,
        projectileInstanceCount = 0,

        tileInstanceCount = 0,
        birdSpawnInstanceCount = 0,
        backgroundInstanceCount = 0,
        
        characterSpriteAtlas = {},
        characterSheetInfo = {},
        characterSheetInfoCount = 0,
        characterGeometry = {},
        characterMaterial = {},


        birdNodes = {},
        projectileNodes = {},
    }

    print("new (" .. name .. ") - END")
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
