local arg={...}

-- function destroyObject(object)
--     njli.World.getInstance():getWorldFactory():destroy(object)
-- end

function getSceneStateName()
    return njli.World.getInstance():getScene():getStateMachine():getState():getName()
end

function pushSceneState(state)
    njli.World.getInstance():getScene():getStateMachine():pushState(state)
end

-- local menuScale = 8

local pushButtonNode = require "pushButtonNode"
local imageNode = require "imageNode"

local renderHUD = function(self)
    -- print("menuScene renderHUD")
end

local push = function(self)
    pushSceneState(self.sceneState)
end

-- local allOff = function(self)
--     -- for k,v in pairs(self.buttonStates) do
--     --     self.buttonStates[k]:off()
--     -- end
-- end
-----------------------------------

-- _menuSceneStateNames =
-- {
--     menu = "MainMenuState",
--     settings = "SettingsMenuState",
--     store = "StoreMenuState",
--     highScores = "HighScoresMenuState",
--     characters = "CharactersMenuState",
--     about = "AboutMenuState",
--     leaderboards = "LeaderboardsMenuState",
--     achievements = "AchievementsMenuState",
--     levelselect = "LevelSelectMenuState",
--     boardselect = "BoardSelectMenuState",
-- }

-- portrait_city = "portrait_city",
--     portrait_country = "portrait_country",
--     ITEM1 = "ITEM1",

local enter = function(self, scene)
    print(getSceneStateName() .. " enter ")

	local stateName = scene:getStateMachine():getState():getName()

    local tbl = {}

    tbl[_menuSceneStateNames.menu] = 
    {
        {name = "PLAY", fun = function()
            PushSceneState(_menuSceneStateNames.levelselect)
        end, toggle = false}, 
        {name = "STORE", fun = function()
            PushSceneState(_menuSceneStateNames.store)
        end, toggle = false}, 
        {name = "HIGHSCORES", fun = function()
            PushSceneState(_menuSceneStateNames.highScores)
        end, toggle = false}, 
        {name = "SETTINGS", fun = function()
            PushSceneState(_menuSceneStateNames.settings)
        end, toggle = false}, 
        {name = "CHARACTERS", fun = function()
            PushSceneState(_menuSceneStateNames.characters)
        end, toggle = false}
    }
    tbl[_menuSceneStateNames.settings] = 
    {
        {name = "SOUND_FX", fun = function()
            -- PushSceneState(_menuSceneStateNames.menu)
        end, toggle = true},
        {name = "MUSIC", fun = function()
            -- PushSceneState(_menuSceneStateNames.menu)
        end, toggle = true},
        {name = "ABOUT", fun = function()
            PushSceneState(_menuSceneStateNames.about)
        end, toggle = false},
        {name = "LEADERBOARDS", fun = function()
            PushSceneState(_menuSceneStateNames.leaderboards)
        end, toggle = false},
        {name = "ACHIEVEMENTS", fun = function()
            PushSceneState(_menuSceneStateNames.achievements)
        end, toggle = false},
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.menu)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.store] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.menu)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.highScores] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.menu)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.characters] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.menu)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.about] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.settings)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.leaderboards] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.settings)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.achievements] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.settings)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.levelselect] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.menu)
        end, toggle = false},
        {name = "portrait_city", fun = function()
            PushSceneState(_menuSceneStateNames.boardselect)
        end, toggle = false},
        {name = "portrait_country", fun = function()
            PushSceneState(_menuSceneStateNames.boardselect)
        end, toggle = false},
    }
    tbl[_menuSceneStateNames.boardselect] = 
    {
        {name = "BACK", fun = function()
            PushSceneState(_menuSceneStateNames.levelselect)
        end, toggle = false},
        {name = "ITEM1", fun = function()
            PushWorldState(_worldStateNames.game)
            -- PushWorldState(_worldStateNames.menu)
        end, toggle = false},
    }

    -- local menuScale = 8

    local name = _menuNodeNames.ui_background
    self.nodes[name] = imageNode.new(name, self.geometry, self.spriteAtlas)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

    local dimScreen = njli.World.getInstance():getViewportDimensions()
    local origin = njli.btVector3(dimScreen:x()*.5, dimScreen:y()*.5, 0)
    self.nodes[name].node:setOrigin(origin)

    local menuScale = self.nodes[name]:shouldScale()
    self.nodes[name]:setScale(menuScale)



    local deviceName = DeviceNameToResolutionDeviceName(njli.World.getInstance():getDeviceName())
    -- deviceName = njli.World.getInstance():getDeviceName()



    if _menuSceneStateNames.menu == stateName then
        name = _menuNodeNames.logo_yb

        self.nodes[name] = imageNode.new(name, self.geometry, self.spriteAtlas)
        njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)
        -- local deviceName = _defaultDeviceName
        -- if _nodePositions[stateName][name][njli.World.getInstance():getDeviceName()] ~= nil then
        --     deviceName = njli.World.getInstance():getDeviceName()
        -- end

        -- -- print("The device name: " .. "'" .. deviceName .. "'")
        
        -- print('the device name is ' .. njli.World.getInstance():getDeviceName())
        local x = _nodePositions[stateName][name][deviceName].x
        local y = _nodePositions[stateName][name][deviceName].y

        self.nodes[name].node:setOrigin(njli.btVector3(x, y, -1))
        self.nodes[name]:setScale(menuScale)
    end

    








    local buttonStates = {}
    if tbl[stateName] then
        for i=1, #tbl[stateName] do

            local name = tbl[stateName][i].name
            local fun = tbl[stateName][i].fun
            local toggle = tbl[stateName][i].toggle


            self.nodes[name] = pushButtonNode.new(name, self.geometry, self.spriteAtlas, menuScale, fun, toggle)
            njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

            -- local deviceName = _defaultDeviceName

            -- if _nodePositions[stateName][name][njli.World.getInstance():getDeviceName()] ~= nil then
            --     deviceName = njli.World.getInstance():getDeviceName()
            -- end

            -- print("The device name: " .. "'" .. deviceName .. "'")
            local x = _nodePositions[stateName][name][deviceName].x
            local y = _nodePositions[stateName][name][deviceName].y

            self.nodes[name].node:setOrigin(njli.btVector3(x, y, -1))

            table.insert(buttonStates, self.nodes[name])
        end
    end
    
    self.buttonStates = buttonStates




    









	return self.nodes
end

-- local i = 1
local update = function(self, scene, timeStep)
    -- print(getSceneStateName() .. " update")

    -- test the statemachine cycle...
    -- pushSceneState(self.sceneState)
    -- if i % 2 == 0 then
    --     PushSceneState(_menuSceneStateNames.settings)
    -- else
        -- PushSceneState(_menuSceneStateNames.menu)
    -- end
    
    -- i = i + 1
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
    -- print(getSceneStateName() .. " onMessage")
end









local touchDown = function(self, touches)
    -- print(touches[1]:getPosition())
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
    print("delete " .. self.sceneState:getName())

    --delete nodestates
    for k,v in pairs(self.nodes) do
        self.nodes[k].node:getStateMachine():clear(false)
        self.nodes[k]:__gc()
    end
    self.nodes = {}

    --delete scenestate
    destroyObject(self.sceneState)
end

local methods = 
{
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
	__gc = delete
}

local new = function(name, shader, spriteAtlas, material, geometry)
    -- print("new  " .. name)

    local cameraNode = njli.World.getInstance():getScene():getRootNode()
    -- njli.World.getInstance():enableDebugDraw(cameraNode:getCamera(), shader)

	local sceneState = njli.SceneState.create()
    sceneState:setName(name)

    local nodes = {}

    -- local spriteAtlas = create((loadfile(njli.ASSET_PATH("scripts/interface0.lua")))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
    -- local image = njli.Image.create()
    -- local material = njli.Material.create()
    -- local geometry = njli.Sprite2D.create()

    -- njli.World.getInstance():getWorldResourceLoader():load("images/interface0.png", image)

    -- material:getDiffuse():loadGPU(image)
    -- geometry:addMaterial(material)
    -- geometry:addShaderProgram(shader)

    local properties = 
    {
    	sceneState = sceneState,
        nodes = nodes,
        

        --DONT DELETE
        shader = shader,
        spriteAtlas = spriteAtlas,
        material = material,
        geometry = geometry,
        buttonStates = {},
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
