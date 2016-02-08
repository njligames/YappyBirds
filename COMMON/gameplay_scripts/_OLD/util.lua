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
    "iPod Touch (3 Gen)",--3:2
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

_worldStateNames = 
{
    menu = "MenuWorldState",
    game = "GameWorldState",
    results = "ResultsWorldState",
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
    boardselect = "BoardSelectMenuState",
}

_gameSceneStateNames =
{
    -- start = "StartGameSceneState",
    play = "PlayGameSceneState",
    -- pause = "PauseGameSceneState",
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
}

_nodePositions = {}
for k,v in pairs(_menuSceneStateNames) do
    _nodePositions[v] = {}
    for kk,vv in pairs(_menuNodeNames) do
        _nodePositions[v][vv] = {}
        for kkk,vvv in pairs(_deviceNames) do
            _nodePositions[v][vv][vvv] = {x=10,y=100}
        end
    end
end

_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.PLAY]["Simulator"] = { x = 945, y = 193 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.STORE]["Simulator"] = { x = 190, y = 193 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.HIGHSCORES]["Simulator"] = { x = 145, y = 385 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.SETTINGS]["Simulator"] = { x = 1020, y = 385 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.CHARACTERS]["Simulator"] = { x = 570, y = 85 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.logo_yb]["Simulator"] = { x = 570, y = 510 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.SOUND_FX]["Simulator"] = { x = 310, y = 460 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.MUSIC]["Simulator"] = { x = 735, y = 460 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ABOUT]["Simulator"] = { x = 510, y = 310 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.LEADERBOARDS]["Simulator"] = { x = 310, y = 170 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ACHIEVEMENTS]["Simulator"] = { x = 735, y = 170 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.store][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.highScores][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.characters][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.about][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.leaderboards][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.achievements][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_city]["Simulator"] = { x = 800, y = 300 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_country]["Simulator"] = { x = 400, y = 300 }
_nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.BACK]["Simulator"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.ITEM1]["Simulator"] = { x = 600, y = 300 }


_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.PLAY]["16:9"] = { x = 945, y = 193 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.STORE]["16:9"] = { x = 190, y = 193 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.HIGHSCORES]["16:9"] = { x = 145, y = 385 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.SETTINGS]["16:9"] = { x = 1020, y = 385 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.CHARACTERS]["16:9"] = { x = 570, y = 85 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.logo_yb]["16:9"] = { x = 570, y = 510 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.SOUND_FX]["16:9"] = { x = 310, y = 460 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.MUSIC]["16:9"] = { x = 735, y = 460 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ABOUT]["16:9"] = { x = 510, y = 310 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.LEADERBOARDS]["16:9"] = { x = 310, y = 170 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ACHIEVEMENTS]["16:9"] = { x = 735, y = 170 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.store][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.highScores][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.characters][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.about][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.leaderboards][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.achievements][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_city]["16:9"] = { x = 800, y = 300 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_country]["16:9"] = { x = 400, y = 300 }
_nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.BACK]["16:9"] = { x = 110, y = 80 }
_nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.ITEM1]["16:9"] = { x = 600, y = 300 }








-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.PLAY]["iPhone 6+"] = { x = 1836, y = 338 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.STORE]["iPhone 6+"] = { x = 340, y = 305 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.HIGHSCORES]["iPhone 6+"] = { x = 260, y = 764 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.SETTINGS]["iPhone 6+"] = { x = 1924, y = 812 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.CHARACTERS]["iPhone 6+"] = { x = 1128, y = 149 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.logo_yb]["iPhone 6+"] = { x = 1039, y = 1007 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.SOUND_FX]["iPhone 6+"] = { x = 598, y = 864 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.MUSIC]["iPhone 6+"] = { x = 1429, y = 867 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ABOUT]["iPhone 6+"] = { x = 985, y = 602 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.LEADERBOARDS]["iPhone 6+"] = { x = 577, y = 321 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ACHIEVEMENTS]["iPhone 6+"] = { x = 1458, y = 316 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.store][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.highScores][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.characters][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.about][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.leaderboards][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.achievements][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_city]["iPhone 6+"] = { x = 1502, y = 594 }
-- _nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_country]["iPhone 6+"] = { x = 701, y = 603 }
-- _nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.BACK]["iPhone 6+"] = { x = 211, y = 155 }
-- _nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.ITEM1]["iPhone 6+"] = { x = 1105, y = 686 }






-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.PLAY]["iPhone 6"] = { x = 1153, y = 180 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.STORE]["iPhone 6"] = { x = 194, y = 180 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.HIGHSCORES]["iPhone 6"] = { x = 157, y = 432 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.SETTINGS]["iPhone 6"] = { x = 1205, y = 432 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.CHARACTERS]["iPhone 6"] = { x = 648, y = 88 }
-- _nodePositions[_menuSceneStateNames.menu][_menuNodeNames.logo_yb]["iPhone 6"] = { x = 637, y = 592 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.SOUND_FX]["iPhone 6"] = { x = 322, y = 534 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.MUSIC]["iPhone 6"] = { x = 1012, y = 534 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ABOUT]["iPhone 6"] = { x = 644, y = 352 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.LEADERBOARDS]["iPhone 6"] = { x = 367, y = 217 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ACHIEVEMENTS]["iPhone 6"] = { x = 1017, y = 194 }
-- _nodePositions[_menuSceneStateNames.settings][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.store][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.highScores][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.characters][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.about][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.leaderboards][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.achievements][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_city]["iPhone 6"] = { x = 892, y = 403 }
-- _nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_country]["iPhone 6"] = { x = 459, y = 403 }
-- _nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.BACK]["iPhone 6"] = { x = 144, y = 102 }
-- _nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.ITEM1]["iPhone 6"] = { x = 690, y = 389 }







_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.PLAY]["8:5"] = { x = 1656, y = 279 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.STORE]["8:5"] = { x = 263, y = 268 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.HIGHSCORES]["8:5"] = { x = 235, y = 667 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.SETTINGS]["8:5"] = { x = 1652, y = 661 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.CHARACTERS]["8:5"] = { x = 960, y = 132 }
_nodePositions[_menuSceneStateNames.menu][_menuNodeNames.logo_yb]["8:5"] = { x = 980, y = 878 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.SOUND_FX]["8:5"] = { x = 485, y = 783 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.MUSIC]["8:5"] = { x = 1482, y = 780 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ABOUT]["8:5"] = { x = 959, y = 492 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.LEADERBOARDS]["8:5"] = { x = 489, y = 290 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.ACHIEVEMENTS]["8:5"] = { x = 1425, y = 296 }
_nodePositions[_menuSceneStateNames.settings][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.store][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.highScores][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.characters][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.about][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.leaderboards][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.achievements][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_city]["8:5"] = { x = 1280, y = 530 }
_nodePositions[_menuSceneStateNames.levelselect][_menuNodeNames.portrait_country]["8:5"] = { x = 600, y = 530 }
_nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.BACK]["8:5"] = { x = 179, y = 125 }
_nodePositions[_menuSceneStateNames.boardselect][_menuNodeNames.ITEM1]["8:5"] = { x = 996, y = 548 }


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

function createTexturePackerSpriteAtlas(shader, material, geometry, image, file)
    local imagePath = "images/generated/" .. file .. ".png"
    local luaPath = "scripts/generated/" .. file .. ".lua"

    -- local image = njli.Image.create()
    -- local material = njli.Material.create()
    -- local geometry = njli.Sprite2D.create()
    local spriteAtlas = create((loadfile(njli.ASSET_PATH(luaPath)))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
    njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)
    -- material:getDiffuse():loadGPU(image)
    -- geometry:addMaterial(material)
    -- geometry:addShaderProgram(shader)

    return spriteAtlas
end

function Truncate(vector, max)
    if vector:length() > max then
        return vector:normalized() * max
    end

    return vector
end

CollisionGroups =
{
    none               = (0x00000),
    bird               = (0x00002),
    dog                = (0x00004),
    projectile         = (0x00008),
    tile               = (0x00010),
    anotherType2       = (0x00020),
    anotherType3       = (0x00040),
    anotherType4       = (0x00080),
    anotherType5       = (0x00100),
    anotherType6       = (0x00200),
    anotherType7       = (0x00400),
    anotherType8       = (0x00800),
    anotherType9       = (0x01000),
    anotherType10      = (0x02000),
    anotherType11      = (0x04000),
    anotherType12      = (0x08000),
    anotherType13      = (0x10000),
}

CollisionMasks = 
{
    bird               = bit.bor(CollisionGroups.projectile, CollisionGroups.dog),
    dog                = bit.bor(CollisionGroups.projectile, CollisionGroups.bird),
    projectile         = bit.bor(CollisionGroups.bird, CollisionGroups.dog),
    tile               = bit.bor(CollisionGroups.none),
}

RenderCategories =
{
    none               = (0x00000),
    orthographic       = (0x00002),
    perspective        = (0x00004),
    anotherType1       = (0x00008),
    anotherType2       = (0x00010),
    anotherType2       = (0x00020),
    anotherType3       = (0x00040),
    anotherType4       = (0x00080),
    anotherType5       = (0x00100),
    anotherType6       = (0x00200),
    anotherType7       = (0x00400),
    anotherType8       = (0x00800),
    anotherType9       = (0x01000),
    anotherType10      = (0x02000),
    anotherType11      = (0x04000),
    anotherType12      = (0x08000),
    anotherType13      = (0x10000),
}

function destroyObject(object)
    njli.World.getInstance():getWorldFactory():destroy(object)
    object = nil
end