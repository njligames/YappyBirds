local menuScene = require "menuScene"
local gameScene = require "gameScene"
local testSliderScene = require "testSliderScene"
local testParticleEmitterScene = require "testParticleEmitterScene"

function getWorldStateName()
    return njli.World.getInstance():getStateMachine():getState():getName()
end

function pushWorldState(state)
    njli.World.getInstance():getStateMachine():pushState(state)
end

local push = function(self)
    pushWorldState(self.worldState)
end

local pushSceneState = function(self, sceneStateName)
    self.sceneStates[sceneStateName]:push()
end

local enter = function(self)
    local stateName = getWorldStateName()

    local firstSceneStateName = ""
    local sceneStates = {}
    if stateName == _worldStateNames.menu then

        self.menuSpriteAtlas = create((loadfile(njli.ASSET_PATH("scripts/interface0.lua")))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
        local image = njli.Image.create()
        self.menuMaterial = njli.Material.create()
        self.menuGeometry = njli.Sprite2D.create()

        njli.World.getInstance():getWorldResourceLoader():load("images/interface0.png", image)

        self.menuMaterial:getDiffuse():loadGPU(image)
        njli.Image.destroy(image)
        self.menuGeometry:addMaterial(self.menuMaterial)
        self.menuGeometry:addShaderProgram(self.shader)
        
        for k,v in pairs(_menuSceneStateNames) do
            sceneStates[v] = menuScene.new(v, self.shader, self.menuSpriteAtlas, self.menuMaterial, self.menuGeometry)
        end

        firstSceneStateName = _menuSceneStateNames.menu

    elseif stateName == _worldStateNames.game then
        for k,v in pairs(_gameSceneStateNames) do
            print(k, v)
            sceneStates[v] = gameScene.new(v, self.shader)
        end

        firstSceneStateName = _gameSceneStateNames.play
    elseif stateName == _worldStateNames.results then
    elseif stateName == _worldStateNames.tests then
        sceneStates["testSliderScene"] = testSliderScene.new("testSliderScene", self.shader)
        sceneStates["testParticleEmitterScene"] = testParticleEmitterScene.new("testParticleEmitterScene", self.shader)

        firstSceneStateName = "testParticleEmitterScene"
    end

    self.sceneStates = sceneStates
    
    if firstSceneStateName ~= "" then
        self:pushSceneState(firstSceneStateName)
    end

    return self.sceneStates;
end

local update = function(self, timeStep)
end

local renderHUD = function(self)
    self.sceneStates[njli.World.getInstance():getScene():getStateMachine():getState():getName()]:renderHUD()
end

local exit = function(self)
    if stateName == _worldStateNames.menu then
        njli.Sprite2D.destroy(self.menuGeometry)
        njli.Material.destroy(self.menuMaterial)

        self.menuGeometry = nil
        self.menuMaterial = nil
    end

    for k,v in pairs(self.sceneStates) do
        self.sceneStates[k]:__gc()
    end
    self.sceneStates = {}
end

local onMessage = function(self, message)
	self.sceneStates[njli.World.getInstance():getScene():getStateMachine():getState():getName()]:onMessage(message)
end

local touchDown = function(self, touches)
    self.sceneStates[njli.World.getInstance():getScene():getStateMachine():getState():getName()]:touchDown(touches)
end

local touchUp = function(self, touches)
	self.sceneStates[njli.World.getInstance():getScene():getStateMachine():getState():getName()]:touchUp(touches)
end

local touchMove = function(self, touches)
    self.sceneStates[njli.World.getInstance():getScene():getStateMachine():getState():getName()]:touchMove(touches)
end

local touchCancelled = function(self, touches)
    self.sceneStates[njli.World.getInstance():getScene():getStateMachine():getState():getName()]:touchCancelled(touches)
end

local delete = function(self)
    for k,v in pairs(self.sceneStates) do
        self.sceneStates[k]:__gc()
    end
    self.sceneStates = {}

    destroyObject(self.worldState)
end

local methods = 
{   
    push = push,
    pushSceneState = pushSceneState,
    enter = enter,
	update = update,
    renderHUD = renderHUD,
	exit = exit,
	onMessage = onMessage,
	touchDown = touchDown,
	touchUp = touchUp,
	touchMove = touchMove,
	touchCancelled = touchCancelled,
	__gc = delete
}

local new = function(name, shader)

    local worldState = njli.WorldState.create()
    worldState:setName(name)

    local sceneStates = {}

    

    local properties = 
    {
    	worldState = worldState,
    	sceneStates = sceneStates,

        menuSpriteAtlas = nil,
        menuMaterial = nil,
        menuGeometry = nil,

        --DONT DELETE
        shader = shader,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
