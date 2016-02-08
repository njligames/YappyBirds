local playTitleSong = function(self)
    -- print(self.soundMenuTheme:getVolume())
    -- self.soundMenuTheme:setLoopCount(-1)
    if self:isMenuSongPlaying() then
        self.soundMenuTheme:stop()
    end
    if not self:isTitleSongPlaying() then
        self.soundTitleTheme:play()
    end
    
end

local playMenuSong = function(self)
    if self:isTitleSongPlaying() then
        self.soundTitleTheme:stop()
    end

    if not self:isMenuSongPlaying() then
        self.soundMenuTheme:play()
        self.soundMenuTheme:setLoopCount(-1)
    end
end

local isTitleSongPlaying = function(self)
    return self.soundTitleTheme:isPlaying()
end

local isMenuSongPlaying = function(self)
    return self.soundMenuTheme:isPlaying()
end


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

    print("enter (" .. self.worldState:getName() .. ")")

    self.currentFunctionIndex = 1



    return self.sceneStates
end

local update = function(self, timeStep)

    if self.currentFunctionIndex <= #self.loadingFunctions then
        self.loadingFunctions[self.currentFunctionIndex](self)
        self.currentFunctionIndex = self.currentFunctionIndex + 1
    else

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
    self.soundMenuTheme:stop()
    self.soundTitleTheme:stop()
    
    local stateName = self.worldState:getName()

    for k,v in pairs(self.nodes) do
        removeNodeObject(self.nodes[k])
    end
    self.nodes = {}

    njli.Material.destroy(self.menuMaterial)
    njli.Geometry.destroy(self.menuGeometry)
    njli.SpriteFrameAtlas.destroy(self.menuSpriteAtlas)
    njli.WorldState.destroy(self.worldState)

    for k,v in pairs(self.sceneStates) do
        self.sceneStates[k]:__gc()
    end
    self.sceneStates = {}

    print("exit (" .. stateName .. ")")

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

    njli.Sound.destroy(self.soundMenuTheme)
    njli.Sound.destroy(self.soundTitleTheme)

    -- self:exit()
    njli.World.getInstance():getStateMachine():pushState(nil)
    
    njli.WorldState.destroy(self.worldState)
    self.worldState = nil

    print("delete (" .. stateName .. ")")
end

local methods = 
{   
    playTitleSong = playTitleSong,
    playMenuSong = playMenuSong,

    isTitleSongPlaying = isTitleSongPlaying,
    isMenuSongPlaying = isMenuSongPlaying,

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
    print("new (" .. name .. ")")

    local worldState = njli.WorldState.create()
    worldState:setName(name)

    local menuScene = require "scenes.menuScene"

    local loadingFunctions =
    {
        function(self)
            local path = njli.ASSET_PATH("scripts/interface0.lua")
            if njli.World.getInstance():isDebug() then
                path = njli.DOCUMENT_PATH("scripts/interface0.lua")
            end
            
            self.menuSpriteAtlas = create((loadfile(path))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
        end,
        function(self)
            self.menuMaterial = njli.Material.create()
            local image = njli.Image.create()
            njli.World.getInstance():getWorldResourceLoader():load("images/interface0.png", image)
            self.menuMaterial:getDiffuse():loadGPU(image)
            njli.Image.destroy(image)

            
            self.menuGeometry = njli.Sprite2D.create()
            self.menuGeometry:addMaterial(self.menuMaterial)
            self.menuGeometry:addShaderProgram(getShaderProgram())
        end,
        function(self)
            for k,v in pairs(_menuSceneStateNames) do
                self.sceneStates[v] = menuScene.new(v, self.menuSpriteAtlas, self.menuMaterial, self.menuGeometry, self)
            end
        end,
        function(self)
            self.soundMenuTheme = njli.Sound.create()
            njli.World.getInstance():getWorldResourceLoader():load("sounds/interface/interface_menu-theme.ogg", self.soundMenuTheme)

            self.soundTitleTheme = njli.Sound.create()
            njli.World.getInstance():getWorldResourceLoader():load("sounds/interface/interface_title-theme.wav", self.soundTitleTheme)
        end,    
        function(self)
            njli.World.getInstance():setTouchCamera(getOrthoCamera())
        end,
        function(self)
            -- print(self.soundMenuTheme:getVolume())
            -- self.soundTitleTheme:setLoopCount(-1)
            -- self.soundTitleTheme:play()
            self.sceneStates[_menuSceneStateNames.menu]:push()
        end,
    }

    local properties = 
    {
        worldState = worldState,

        loadingFunctions = loadingFunctions,
        sceneStates = {},
        userdata = {},
        nodes = {},
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
