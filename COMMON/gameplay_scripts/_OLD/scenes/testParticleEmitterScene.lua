local arg={...}


local renderHUD = function(self)
end

local push = function(self)
    njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end


local enter = function(self, scene)

    local cameraNode = njli.World.getInstance():getScene():getRootNode()
    cameraNode:getCamera():enableOrthographic(true)
    cameraNode:setOrigin(njli.btVector3(0, 0, 0))

    -- njli.World.getInstance():enableDebugDraw(cameraNode:getCamera(), self.theShader)

    


    
    local material = njli.Material.create()
    local geometry = njli.Sprite2D.create()

    local touch_nodes = {}

    for i=1,1 do
        local node = njli.Node.create()
        node:show(cameraNode:getCamera())


        node:getStateMachine():pushState(njli.NodeState.create())
        njli.World.getInstance():getScene():getRootNode():addChildNode(node)
        
        local particleEmitter = njli.ParticleEmitter.create()
        if njli.World.getInstance():getWorldResourceLoader():load("particles/particle_water_splash.pex", particleEmitter) then
            node:addParticleEmitter(particleEmitter)

            local image = njli.Image.create()
            local imagePath = "particles/" .. particleEmitter:getTextureFilename()
            njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)

            geometry:addMaterial(material, image)
            geometry:addShaderProgram(self.shader)

            
            material:getDiffuse():loadGPU(image)
            njli.World.getInstance():getWorldFactory():destroy(image)
            image = nil

            

            particleEmitter:setup(njli.World.getInstance():getScene():getRootNode(), geometry)
            
        end

        node:setOrigin(njli.btVector3(0, 0, 0))
        

        self.nodes["pe" .. tostring(i)] = node
        touch_nodes[i] = node

        particleEmitter:setScale(.5)
    end

    self.touch_nodes = touch_nodes
    



    -- local particleEmitterNode = require "particleEmitter"

    -- self.material = njli.Material.create()
    -- self.geometry = njli.Sprite2D.create()

    -- local imagePath = "images/Fire.png"

    -- local image = njli.Image.create()
    -- njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)
    -- self.material:getDiffuse():loadGPU(image)
    -- njli.World.getInstance():getWorldFactory():destroy(image)
    -- image = nil

    -- self.geometry:removeMaterial()
    -- self.geometry:addMaterial(self.material)
    -- self.geometry:addShaderProgram(self.shader)



    -- self.nodes["particleEmitter"] = particleEmitterNode.new("particleEmitterNode", "Fire.json", self.material, self.geometry, self.shader)
    -- self.nodes["particleEmitter"].node:setOrigin(njli.btVector3(0, 0, 0))
    -- self.nodes["particleEmitter"]:start()


    return self.nodes
end



local update = function(self, scene, timeStep)
    -- for k,v in pairs(self.nodes) do
    --     if self.nodes[k] then
    --         self.nodes[k]:update(timeStep)
    --     end
    -- end
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
-- print("number of touches " .. #touches)
-- njli.World.getInstance():getWorldInput():showKeyboard("dick")

    -- if self.nodes["myslider"] then
    --     self.nodes["myslider"]:checkTouch(touches[1]:getPosition())
    -- end

    self.touch_nodes[1]:setOrigin(njli.btVector3(touches[1]:getPosition():x(), touches[1]:getPosition():y(), 0))
    self.touch_nodes[1]:getParticleEmitter(0):reset()
    self.touch_nodes[1]:getParticleEmitter(0):start()
end

local touchUp = function(self, touches)
    -- if self.nodes["myslider"] then
    --     self.nodes["myslider"].isTouching = false
    -- end
end

local touchMove = function(self, touches)
    -- if self.nodes["myslider"] then
    --     self.nodes["myslider"]:checkTouch(touches[1]:getPosition())
    -- end

    
end

local touchCancelled = function(self, touches)
    -- if self.nodes["myslider"] then
    --     self.nodes["myslider"].isTouching = false
    -- end
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

        material = nil, 
        geometry = nil,

        --DONT DELETE
        shader = shader,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
