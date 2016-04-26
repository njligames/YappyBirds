_deviceNames = {"iPhone 2G",--3:2
    "iPhone 3G",--3:2
    "iPhone 3GS",--3:2
    "iPhone 4 (GSM)",--3:2
    "iPhone 4 (GSM Rev. A)",--3:2
    "iPhone 4 (CDMA)",--3:2
    "iPhone 4S",--3:2
    "iPhone 5 (GSM)",--16:9
    "iPhone 5 (Global)",--16:9
    "iPhone 5C (GSM)",--16:9
    "iPhone 5C (Global)",--16:9
    "iPhone 5s (GSM)",--16:9
    "iPhone 5s (Global)",--16:9
    "iPhone 6 Plus",--16:9
    "iPhone 6",--16:9
    "iPod Touch (1 Gen)",--3:2
    "iPod Touch (2 Gen)",--3:2

    "iPod Touch (4 Gen)",--3:2
    "iPod Touch (5 Gen)",--16:9
    "iPad (WiFi)",--4:3
    "iPad 3G",--4:3
    "iPad 2 (WiFi)",--4:3
    "iPad 2 (GSM)",--4:3
    "iPad 2 (CDMA)",--4:3
    "iPad 2 (WiFi Rev. A)",--4:3
    "iPad Mini (WiFi)",--4:3
    "iPad Mini (GSM)",--4:3
    "iPad Mini (CDMA)",--4:3
    "iPad 3 (WiFi)",--4:3
    "iPad 3 (CDMA)",--4:3
    "iPad 3 (Global)",--4:3
    "iPad 4 (WiFi)",--4:3
    "iPad 4 (CDMA)",--4:3
    "iPad 4 (Global)",--4:3
    "iPad Air (WiFi)",--4:3
    "iPad Air (WiFi+GSM)",--4:3
    "iPad Air (WiFi+CDMA)",--4:3
    "iPad Mini Retina (WiFi)",--4:3
    "iPad Mini Retina (WiFi+CDMA)",--4:3
    "iPad Mini Retina (Wi-Fi + Cellular CN)",--4:3
    "iPad Mini 3 (Wi-Fi)",--4:3
    "iPad Mini 3 (Wi-Fi + Cellular)",--4:3
    "iPad Air 2 (Wi-Fi)",--4:3
    "iPad Air 2 (Wi-Fi + Cellular)",--4:3
    "Nexus 7",--8:5
    "HTML5",--16:9
    
}

_resolutionDeviceNames =
{
    "3:2",
    "16:9",
    "4:3",
    "8:5",
}


-- http://www.iosres.com/index-legacy.html
-- http://andrew.hedges.name/experiments/aspect_ratio/
-- http://stackoverflow.com/questions/7587854/is-there-a-list-of-screen-resolutions-for-all-android-based-phones-and-tablets/23009368#23009368
-- http://www.emirweb.com/ScreenDeviceStatistics.php#Header248
-- http://handsontable.com/demo/column_freeze.html
function DeviceTouchScale(name, x, y)
    if x and y and name == _deviceNames[14] then
        return (x*2), (y*2)
    end
    return x, y
end

function DeviceNameShouldScale(name)
    if name == _deviceNames[14] then
        return false
    end
    return true
end

function DeviceNameDownsizeAmount(name)
    if name == _deviceNames[14] then
        return 1.15
    end
    return 1.0
end

function DeviceNameToResolutionDeviceName(name)
    if name == "Simulator" then
        return "Simulator"
    end

    local _3_2_condition = (name == _deviceNames[1] or
                            name == _deviceNames[2] or
                            name == _deviceNames[3] or
                            name == _deviceNames[4] or
                            name == _deviceNames[5] or
                            name == _deviceNames[6] or
                            name == _deviceNames[16] or
                            name == _deviceNames[17] or
                            name == _deviceNames[18] or
                            name == _deviceNames[19] or
                            name == _deviceNames[7])

    local _16_9_condition = (name == _deviceNames[8] or
                            name == _deviceNames[9] or
                            name == _deviceNames[10] or
                            name == _deviceNames[11] or
                            name == _deviceNames[12] or
                            name == _deviceNames[13] or
                            name == _deviceNames[14] or
                            name == _deviceNames[15] or
                            name == _deviceNames[20] or
                            name == _deviceNames[47])

    local _4_3_condition = (name == _deviceNames[21] or
                            name == _deviceNames[22] or
                            name == _deviceNames[23] or
                            name == _deviceNames[24] or
                            name == _deviceNames[25] or
                            name == _deviceNames[26] or
                            name == _deviceNames[27] or
                            name == _deviceNames[28] or
                            name == _deviceNames[29] or
                            name == _deviceNames[30] or
                            name == _deviceNames[31] or
                            name == _deviceNames[32] or
                            name == _deviceNames[33] or
                            name == _deviceNames[34] or
                            name == _deviceNames[35] or
                            name == _deviceNames[36] or
                            name == _deviceNames[37] or
                            name == _deviceNames[38] or
                            name == _deviceNames[39] or
                            name == _deviceNames[40] or
                            name == _deviceNames[41] or
                            name == _deviceNames[42] or
                            name == _deviceNames[43] or
                            name == _deviceNames[44] or
                            name == _deviceNames[45])

    local _8_5_condition = (name == _deviceNames[46])

    if _3_2_condition then
        return _resolutionDeviceNames[1]
    elseif _16_9_condition then
        return _resolutionDeviceNames[2]
    elseif _4_3_condition then
        return _resolutionDeviceNames[3]
    elseif _8_5_condition then
        return _resolutionDeviceNames[4]
    end
end

_defaultDeviceName = "Simulator"

_gameModes = {
    ARCADE = "arcade",
    SURVIVAL = "survival",
    TIMEATTACK = "time_attack",
}

_gameBoards = {
    COUNTRY = "country",
    CITY = "city",
}

_gameLevels = {
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
}

_worldStateNames = 
{
    menu = "MenuWorldState",
    game = "GameWorldState",
    results = "ResultsWorldState",
    yappyGame = "YappyGameWorldState",
    
    tests = "TestsWorldState",
}

_menuSceneStateNames =
{
    menu = "MainMenuState",
    settings = "SettingsMenuState",
    store = "StoreMenuState",
    highScores = "HighScoresMenuState",
    characters = "CharactersMenuState",
    about = "AboutMenuState",
    leaderboards = "LeaderboardsMenuState",
    achievements = "AchievementsMenuState",
    levelselect = "LevelSelectMenuState",
    modeselect = "ModeSelectMenuState",
    boardselect = "BoardSelectMenuState",
}

_gameSceneStateNames =
{
    play = "PlayGameSceneState",
    pause = "PauseGameSceneState",
    win = "WinGameSceneState",
    lose = "LoseGameSceneState",
}

_resultsSceneStateNames =
{
    display = "DisplayResults",
}

_testsSceneStateNames = 
{
    basic = "BasicTestSceneState",
    particleEmitter = "ParticleEmitterTestSceneState",
}



_menuNodeNames =
{
    PLAY = "PLAY",
    STORE = "STORE",
    HIGHSCORES = "HIGHSCORES",
    SETTINGS = "SETTINGS",
    CHARACTERS = "CHARACTERS",
    SOUND_FX = "SOUND_FX",
    MUSIC = "MUSIC",
    ABOUT = "ABOUT",
    LEADERBOARDS = "LEADERBOARDS",
    ACHIEVEMENTS = "ACHIEVEMENTS",
    BACK = "BACK",
    ui_background = "ui_background",
    -- ui_background = "ui_levelselect_flat",
    logo_yb = "logo_yb",
    portrait_city = "portrait_city",
    portrait_country = "portrait_country",
    ITEM1 = "ITEM1",
    stage1 = "stage1",
    stage2 = "stage2",
    stage3 = "stage3",
    stage4 = "stage4",
    stage5 = "stage5",

    stage6 = "stage6",
    stage7 = "stage7",
    stage8 = "stage8",
    stage9 = "stage9",
    stage10 = "stage10",

    stage11 = "stage11",
    stage12 = "stage12",
    stage13 = "stage13",
    stage14 = "stage14",
    stage15 = "stage15",
    
    TIME_ATTACK = "TIME_ATTACK",
    SURVIVAL = "SURVIVAL",
    ARCADE = "ARCADE",
}

_pauseMenuNodeNames = 
{
    PLAY = "CONTINUE",
    QUIT = "QUIT",
    NEXT_LEVEL = "NEXT_LEVEL",
}

_currentLevel = {
    gameMode = _gameModes.ARCADE,
    gameBoard = _gameBoards.COUNTRY,
    gameLevel = _gameLevels[1],
    gameLevelNumber = 1
}

function getNextLevel()
    gameMode = _currentLevel.gameMode
    gameBoard = _currentLevel.gameBoard
    gameLevelNumber = _currentLevel.gameLevelNumber

    

    gameLevelNumber = gameLevelNumber + 1
    if gameLevelNumber > 5 then
        gameLevelNumber = 1
    end
    
    return gameMode, gameBoard, gameLevelNumber
end

_menuNodePositions = {}
for k,v in pairs(_menuSceneStateNames) do
    _menuNodePositions[v] = {}
    for kk,vv in pairs(_menuNodeNames) do
        _menuNodePositions[v][vv] = {}
        for kkk,vvv in pairs(_deviceNames) do
            _menuNodePositions[v][vv][vvv] = {x=10,y=100}
        end
    end
end

_pauseMenuNodePositions = {}
for k, v in pairs(_pauseMenuNodeNames) do
    _pauseMenuNodePositions[v] = {}
    for kk, vv in pairs(_deviceNames) do
        _pauseMenuNodePositions[v][vv] = {x=0, y=0}
    end
end

function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

function Truncate(vector, max)
    if vector:length() > max then
        return vector:normalized() * max
    end

    return vector
end

CollisionGroups =
{
    none               = bit.tobit(0x00000),
    bird               = bit.tobit(0x00002),
    dog                = bit.tobit(0x00004),
    projectile         = bit.tobit(0x00008),
    tile               = bit.tobit(0x00010),
    anotherType2       = bit.tobit(0x00020),
    anotherType3       = bit.tobit(0x00040),
    anotherType4       = bit.tobit(0x00080),
    anotherType5       = bit.tobit(0x00100),
    anotherType6       = bit.tobit(0x00200),
    anotherType7       = bit.tobit(0x00400),
    anotherType8       = bit.tobit(0x00800),
    anotherType9       = bit.tobit(0x01000),
    anotherType10      = bit.tobit(0x02000),
    anotherType11      = bit.tobit(0x04000),
    anotherType12      = bit.tobit(0x08000),
    anotherType13      = bit.tobit(0x10000),
}

CollisionMasks = 
{
    bird               = bit.bor(CollisionGroups.projectile, CollisionGroups.dog, CollisionGroups.bird),
    dog                = bit.bor(CollisionGroups.projectile, CollisionGroups.bird),
    projectile         = bit.bor(CollisionGroups.bird, CollisionGroups.dog),
    tile               = bit.bor(CollisionGroups.none),
    dead               = bit.bor(CollisionGroups.none),
    birdDead           = bit.bor(CollisionGroups.projectile),
    birdGrabbing       = bit.bor(CollisionGroups.projectile),
    dogCaught          = bit.bor(CollisionGroups.projectile),
    none               = bit.bor(CollisionGroups.none),
}

RenderCategories =
{
    none               = bit.tobit(0x00000),
    orthographic       = bit.tobit(0x00002),
    perspective        = bit.tobit(0x00004),
    anotherType1       = bit.tobit(0x00008),
    anotherType2       = bit.tobit(0x00010),
    anotherType2       = bit.tobit(0x00020),
    anotherType3       = bit.tobit(0x00040),
    anotherType4       = bit.tobit(0x00080),
    anotherType5       = bit.tobit(0x00100),
    anotherType6       = bit.tobit(0x00200),
    anotherType7       = bit.tobit(0x00400),
    anotherType8       = bit.tobit(0x00800),
    anotherType9       = bit.tobit(0x01000),
    anotherType10      = bit.tobit(0x02000),
    anotherType11      = bit.tobit(0x04000),
    anotherType12      = bit.tobit(0x08000),
    anotherType13      = bit.tobit(0x10000),
}

-- function destroyObject(object)
--     njli.World.getInstance():getWorldFactory():destroy(object)
--     object = nil
--     return nil
-- end

function createPerspectiveCameraNode(name)
    local node = njli.Node.create()
    node:setName(name)

    local camera = njli.Camera.create()
    camera:enableOrthographic(false)
    camera:setRenderCategory(RenderCategories.perspective)
    camera:setName("perspectiveCamera")

    node:addCamera(camera)

    return node
end

function createOrthoCameraNode(name)
    local node = njli.Node.create()
    node:setName(name)

    local camera = njli.Camera.create()
    camera:enableOrthographic()
    camera:setRenderCategory(RenderCategories.orthographic)
    camera:setName("orthoCamera")

    node:addCamera(camera)

    return node
end

-- function destroyCameraNode(cameraNode)
--     destroyObject(cameraNode:getCamera())
--     destroyObject(cameraNode)
-- end

function getSceneStateName()
    return njli.World.getInstance():getScene():getStateMachine():getState():getName()
end

function createTexturePackerSpriteAtlas(file, shader)

    local function fileExists(name)
        if name ~= nil then
            local f=io.open(name,"r")
            if f~=nil then io.close(f) return true else return false end
        end
        return false
    end

    local _spriteAtlas = {}
    local _sheetInfo = {}
    local _geometry = {}
    local _material = {}

    local maxFiles = 8

    for i=1,maxFiles do
        local currentFile = file .. tostring(i-1)
        local imagePath = "images/" .. currentFile .. ".png"
        local luaPath = "scripts/" .. currentFile .. ".lua"


        local path = njli.ASSET_PATH(luaPath)
        
        if fileExists(njli.ASSET_PATH(imagePath)) and fileExists(path) then
            local image = njli.Image.create()
            local material = njli.Material.create()
            local geometry = njli.Sprite2D.create()
            geometry:setName(currentFile)
            material:setName(currentFile)

            print(path)
            local sheetInfo = (loadfile(path))()
            assert(sheetInfo ~= nil, "Unable to load the sheet info for file " .. path)

            local spriteAtlas = njli.buildType(sheetInfo:getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
            assert(spriteAtlas ~= nil, "Unable to load the spriteatlas for file " .. njli.ASSET_PATH(imagePath))
            spriteAtlas:setName(currentFile)

            njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)

            material:getDiffuse():loadGPU(image)
            njli.Image.destroy(image)
            image = nil

            geometry:addMaterial(material)
            geometry:addShaderProgram(shader)

            -- table.insert(_spriteAtlas, i, spriteAtlas)
            -- table.insert(_sheetInfo, i, sheetInfo)
            -- table.insert(_geometry, i, geometry)
            -- table.insert(_material, i, material)

            _spriteAtlas[i] = spriteAtlas
            _sheetInfo[i] = sheetInfo
            _geometry[i] = geometry
            _material[i] = material

        end
    end


    return _spriteAtlas, _sheetInfo, _geometry, _material
end

function birdTypeToFilename(type)
    local fileName = "character_" .. type
    return (fileName)
end

function projectileTypeToFilename(type)
    -- math.randomseed( os.time() )
    -- local colorIndex = math.random(1, 5)

    -- local color = "Red"

    -- if colorIndex == 1 then
    --     color = "Blue"
    -- elseif colorIndex == 2 then
    --     color = "Green"
    -- elseif colorIndex == 3 then
    --     color = "Purple"
    -- elseif colorIndex == 4 then
    --     color = "Red"
    -- elseif colorIndex == 5 then
    --     color = "Yellow"
    -- end

    -- return "projectile_waterBalloon" .. color .. "_thrown_front"
    return "projectile_waterBalloon"
end

function dogFilename()
    return "character_dog"
end

-- particleGeometry, particleMaterial = createParticleGeometryAndMaterial("particle_water_splash.png")
function createParticleGeometryAndMaterial(particleImage, shader)
    local material = njli.Material.create()
    local geometry = njli.Sprite2D.create()
    local image = njli.Image.create()
    local imagePath = "particles/" .. particleImage
    njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)
    geometry:addMaterial(material, image)
    geometry:addShaderProgram(shader)
    material:getDiffuse():loadGPU(image)
    njli.Image.destroy(image)

    return geometry, material
end

function getGameViewDivisor()
    local scale = 89.0
    return math.floor(2048 / scale)
end



function processDimensions(x, y)
    local function ProcessLuaCode(code)
        local ret = 0
        if code and code ~= "" then
            local pre_code = [[return (]]
            local in_code = tostring(code)
            local post_code = [[)]]

            local _code = pre_code .. in_code .. post_code
            f = load(_code)
            assert(f, "Invalid expression: " .. code)
            if nil ~= f then
                ret = tonumber(f())
            end
        end
        return ret
    end

    local function ProcessPercent(d, total)
        if d then
            local _d = tonumber(ProcessLuaCode(d))
            
            if nil ~= _d then

                if _d > 1.0 then
                    _d = 1.0
                elseif _d < 0.0 then
                    _d = 0.0
                end
            else
                _d = 0.0
            end

            return _d * total
        end
        return 0
    end
    local function ProcessDimension(d, total)   
        
        local dd = d
        local ret = 0
        local code = ""

        local end_pattern = "%%"

        -- local start_pattern = "[%d+]?[.]?[%d+]?%%"
        -- local start_pattern = [[^[-+]?[0-9]*\.?[0-9]+$%%]]
        -- local start_pattern = [[(?[-+/*]?%d+\\.?%d+?)?[-+/*](?[-+/*]?%d+)?%%]]
        -- local start_pattern = [[[(]?[+-]?%d+[)]?[.]?%%]]
        local decimal_number_match = [[%(?[+-]?%d*%.%d+%)?]]
        local start_pattern = decimal_number_match .. end_pattern
        -- local start_pattern = "%d+%%"

        
        local theStart = string.find(dd, start_pattern)
        local theEnd = string.find(dd, end_pattern)

        while theStart do
            if theStart > 1 then
                code = code .. string.sub(dd, 1, theStart - 1)
            end
            -- print(code, "there")


            local percentageString = string.sub(dd, theStart, theEnd - 1)
            -- print(dd, theStart, theEnd - 1, "=>", percentageString)
            local percentageValue = ProcessPercent(percentageString, total)
            code = code .. percentageValue


            theStart = theEnd + 1
            theEnd = string.len(dd)
            dd = string.sub(dd, theStart, theEnd)

            theStart = string.find(dd, start_pattern)
            theEnd = string.find(dd, end_pattern)
        end


        if code ~= "" then
            d = code
        end

        
        ret = ProcessLuaCode(d)

        if ret > total then
            print("input value " .. d .. " returning a value (" .. ret .. ") larger than the total dimensions (" .. total .. ").")
            ret = total
        end

        return ret
    end

    local width = njli.World.getInstance():getViewportDimensions():x()
    local height = njli.World.getInstance():getViewportDimensions():y()
print(width)
    -- return ProcessDimension(tostring(x), width), ProcessDimension(tostring(y), height)
    return ProcessLuaCode(x), ProcessLuaCode(y)
end


function setupSpriteFrame(frameName, node, characterSheetInfo, spriteAtlas, geometry)
    for k,v in pairs(characterSheetInfo) do
        if v:getFrameIndex(frameName) then
            local frameIndex = v:getFrameIndex(frameName)
            local width = v:getSheet().frames[frameIndex].width - 2
            local height = v:getSheet().frames[frameIndex].height - 2
            local divisor = getGameViewDivisor()
            local dimSprite = bullet.btVector2( (width/divisor)*2, (height/divisor)*2 )

            node:addGeometry(geometry[k])

            node:getGeometry():setSpriteAtlasFrame(node, spriteAtlas[k], frameName, false)
            node:getGeometry():setDimensions(node, dimSprite)
        end
    end
end

function math.Clamp(val, lower, upper)
    assert(val and lower and upper, "not very useful error message here")
    if lower > upper then lower, upper = upper, lower end -- swap if boundaries supplied the wrong way
    return math.max(lower, math.min(upper, val))
end

function brightnessForNode(node, initialTransform)
    function brightnessForDistance(z)
        function getParam()
            local assetPath = njli.ASSET_PATH("scripts/Params.lua")
            return loadfile(assetPath)()
        end
        local layerMaxDistance = getParam().World.LayerMax
        local minBrightnessForDistance = getParam().World.MinBrightnessForDistance
        assert(minBrightnessForDistance >= 0.0 and minBrightnessForDistance <= 1)
        local brightness = 1.0 - (z * (1.0 - minBrightnessForDistance))/layerMaxDistance
        --local brightness = 1.0 - (z / layerMaxDistance)
        brightness = math.max(brightness, minBrightnessForDistance)
        --print("brightness", brightness)
        
        return brightness
    end

    if initialTransform == nil then
        initialTransform = bullet.btTransform.getIdentity()
    end
    
    local transform = njli.ColorUtil.createBrightnessMatrix(brightnessForDistance(node:getOrigin():z()))
    node:setColorTransform(transform)
end

