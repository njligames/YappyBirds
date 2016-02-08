local arg={...}


local renderHUD = function(self)
    -- print("scene:renderHUD")
    for k,v in pairs(self.nodes) do
        self.nodes[k]:renderHUD()
    end
end

local push = function(self)
    njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end


local enter = function(self, scene)

    local cameraNode = njli.World.getInstance():getScene():getRootNode()
    cameraNode:getCamera():enableOrthographic(true)
    cameraNode:setOrigin(njli.btVector3(0, 0, 0))

    njli.World.getInstance():enableDebugDraw(cameraNode:getCamera(), self.theShader)

    local _x = 60
    local _y = 95

    local _width = 300
    local _height = 60

    local sliderNode = require "hudSliderNode"
    self.nodes["myslider"] = sliderNode.new("myslider", _x, _y, _width, _height, self.theShader)


    -- local editBox = require "hudEditBoxNode"
    -- self.nodes["myeditbox"] = editBox.new("myeditbox")


    return self.nodes
end



local update = function(self, scene, timeStep)

    if self.nodes["myslider"] then
        self.nodes["myslider"]:update(timeStep)
    end

    if self.nodes["myeditbox"] then
        self.nodes["myeditbox"]:update(timeStep)
    end
end

local exit = function(self, scene)

    for k,v in pairs(self.nodes) do
        self.nodes[k].node:getStateMachine():clear(false)
        self.nodes[k]:__gc()
    end
    self.nodes = {}
end

local onMessage = function(self, scene, message)
end

local onMessage = function(self, message)
    -- print("onMessage")
end

local touchDown = function(self, touches)
-- njli.World.getInstance():getWorldInput():showKeyboard("dick")

    if self.nodes["myslider"] then
        self.nodes["myslider"]:checkTouch(touches[1]:getPosition())
    end
end

local touchUp = function(self, touches)
    if self.nodes["myslider"] then
        self.nodes["myslider"].isTouching = false
    end
end

local touchMove = function(self, touches)
    if self.nodes["myslider"] then
        self.nodes["myslider"]:checkTouch(touches[1]:getPosition())
    end
end

local touchCancelled = function(self, touches)
    if self.nodes["myslider"] then
        self.nodes["myslider"].isTouching = false
    end
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
    renderHUD = renderHUD,
    push = push,
    enter = enter,
    update = update,
    exit = exit,
    onMessage = onMessage,

    onMessage = onMessage,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,

    __gc = delete,
}

local new = function(name, shader)

    local sceneState = njli.SceneState.create()
    sceneState:setName(name)


    local properties = 
    {
        sceneState = sceneState,
        nodes = {},

        --DONT DELETE
        theShader = shader,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
