
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
        --update world state.
        -- print("update (" .. self.worldState:getName() .. ")")
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

    for k,v in pairs(self.nodes) do
        removeNodeObject(self.nodes[k])
    end
    self.nodes = {}

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

    -- self:exit()
    njli.World.getInstance():getStateMachine():pushState(nil)

    njli.WorldState.destroy(self.worldState)
    self.worldState = nil

    print("delete (" .. stateName .. ")")
end

local methods = 
{   
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

    local loadingFunctions =
    {
        function(self)
            local key = _testsSceneStateNames.basic

            local scene = require "scenes.testScene_Basic"
            self.sceneStates[key] = scene.new(key)

        end,
        function(self)
            local key = _testsSceneStateNames.particleEmitter

            local scene = require "scenes.testScene_ParticleEmitter"
            self.sceneStates[key] = scene.new(key)
        end,
        function(self)
            self.startSceneName = _testsSceneStateNames.particleEmitter
        end,
        function(self)
            self.sceneStates[self.startSceneName]:push()
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
