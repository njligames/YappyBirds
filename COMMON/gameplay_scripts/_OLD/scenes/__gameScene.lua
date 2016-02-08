local arg={...}





local y_offset_world = 19.4
-- local layer_distance = -0.001
local layer_distance = 15.24
--200 feet away...
local distanceFromCamera = 60.96 --meters

local backgroundLayerZOffset = 0
local tileLayerZOffset = -0.1
local objectLayerZOffset = -0.2

function adjustPosition(oldPosition, newDistance)
    local ret = oldPosition
    local totalDistanceFromCamera = distanceFromCamera - 0.1

    if newDistance ~= totalDistanceFromCamera then
        local theta = math.atan(oldPosition, totalDistanceFromCamera)
        -- print("angle: " .. theta)
        local newPosition = math.tan(theta) * newDistance
        -- print("newPosition: " .. newPosition)
        ret = newPosition
    end

    -- ret = oldPosition

    return ret
end

-- function destroyObject(object)
--     njli.World.getInstance():getWorldFactory():destroy(object)
-- end

local backgroundNode = require "backgroundNode"
local obstacleNode = require "obstacleNode"
local birdNode = require "birdNode"
local dogNode = require "dogNode"
local balloonNode = require "balloonNode"

local theHouseTiles = {}
local theSpawnPoints = {}

function addSpawnPoint(object)
    local id = object.id
    theSpawnPoints[id] = {}
    theSpawnPoints[id].shape = object.shape

    theSpawnPoints[id].x = object.x
    theSpawnPoints[id].y = object.y
    theSpawnPoints[id].width = object.width
    theSpawnPoints[id].height = object.height
    theSpawnPoints[id].rotation = object.rotation
    theSpawnPoints[id].enabled = object.visible

    return theSpawnPoints[id]
end

function addHouseTileProperty(obstacle, tile, id)
    theHouseTiles[id] = {}
    theHouseTiles[id].width = tile.width
    theHouseTiles[id].height = tile.height

    -- print(tile.image)

    local img = string.sub(tile.image, 1, string.find(tile.image, ".png")-1)
    img = string.reverse(img)
    img = string.sub(img, 1,string.find(img, '/')-1)
    img = string.reverse(img)

    -- print_r(tile)

    theHouseTiles[id].image = img
end

function createRandomEllipsePoint()
    --[[
    Generate a random point inside a circle of radius 1. This can be done by taking a random angle phi in the interval [0, 2*pi) and a random value rho in the interval [0, 1) and compute

x = sqrt(rho) * cos(phi)
y = sqrt(rho) * sin(phi)
The square root in the formula ensures a uniform distribution inside the circle.

Scale x and y to the dimensions of the ellipse

x = x * width/2.0
y = y * height/2.0

    ]]
end

-- local balloon_instance = 0
-- function createBalloon(self, x, y)
--     local name = balloon_instance .. "/" .. "WaterBalloon"
--     balloon_instance = balloon_instance + 1
-- end


local balloon_instance = 0
function createBalloon(self, x, y, layer, opacity)

    local width = 256
    local height = 256

    local name = balloon_instance .. "/" .. "WaterBalloon"
    balloon_instance = balloon_instance + 1

    self.nodes[name] = balloonNode.new(name, self.characterSpriteAtlas, self.characterGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

    local scale = self.scale
    local divisor = (2048 / scale)
    local x_offset = (0.5 * scale )
    local y_offset = (0.5 * scale )

    local xx = ((x/divisor)-x_offset) 
    local yy = ((y_offset_world) + (y/divisor)-y_offset) 
    local zz = distanceFromCamera + (0.1 - (layer_distance * (layer - 1))) + objectLayerZOffset

    

    local dimSprite = self.nodes[name].node:getGeometry():getDimensions(self.nodes[name].node)
    local d = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- local pp = njli.btVector2( 0.5,0.5 )

    self.nodes[name].node:getGeometry():setDimensions(self.nodes[name].node, d)--, pp)

    xx = adjustPosition(xx, zz)
    yy = adjustPosition(yy, zz)
    self.nodes[name].node:setOrigin(njli.btVector3(xx, yy, zz)) 
end









local dog_instance = 0
function createDog(self, x, y)
    -- local name = 'puffyBirdFront_00000'
    -- local name = dog_instance .. "/" .. "puffyBirdFront_00000"
    local name = dog_instance .. "/" .. "dog"
    dog_instance = dog_instance + 1

    local layer = 1

    local width = 256
    local height = 256
    self.nodes[name] = dogNode.new(name, self.characterSpriteAtlas, self.characterGeometry)
    -- self.nodes["backgroundNode"].node:addChildNode(self.nodes[name].node)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

    local scale = self.scale
    local divisor = (2048 / scale)
    local x_offset = (0.5 * scale )
    local y_offset = (0.5 * scale )
    -- local zz = (-0.1 * layer)
    local zz = distanceFromCamera + (-0.1 - (layer_distance * (layer - 1)))
    self.nodes[name].node:setOrigin(njli.btVector3((x/divisor)-x_offset, y_offset_world + (y/divisor)-y_offset,zz))

    local dimSprite = self.nodes[name].node:getGeometry():getDimensions(self.nodes[name].node)
    local d = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    local pp = njli.btVector2( 0.5,0.5 )

    self.nodes[name].node:getGeometry():setDimensions(self.nodes[name].node, d, pp)

    return self.nodes[name].node    
end


-- local bird_instance = 0
-- function createBird(self, x, y)
--     -- local name = 'puffyBirdFront_00000'
--     -- local name = bird_instance .. "/" .. "puffyBirdFront_00000"
--     local name = bird_instance .. "/" .. "puffyBird"
--     bird_instance = bird_instance + 1

--     local layer = 1

--     local width = 256
--     local height = 256
--     self.nodes[name] = birdNode.new(name, self.characterSpriteAtlas, self.characterGeometry)
--     -- self.nodes["backgroundNode"].node:addChildNode(self.nodes[name].node)
--     njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

--     local scale = self.scale
--     local divisor = (2048 / scale)
--     local x_offset = (0.5 * scale )
--     local y_offset = (0.5 * scale )
--     -- local zz = (-0.1 * layer)
--     local zz = distanceFromCamera + (-0.1 - (layer_distance * (layer - 1)))
--     self.nodes[name].node:setOrigin(njli.btVector3((x/divisor)-x_offset, y_offset_world + (y/divisor)-y_offset,zz))

--     local dimSprite = self.nodes[name].node:getGeometry():getDimensions(self.nodes[name].node)
--     local d = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
--     local pp = njli.btVector2( 0.5,0.5 )

--     self.nodes[name].node:getGeometry():setDimensions(self.nodes[name].node, d, pp)
--     -- local shape = self.nodes[name].node:getPhysicsBody():getPhysicsShape()
--     -- shape:setHalfExtends(d)

--     return self.nodes[name].node
-- end

local bird_instance = 0
function createBird(self, x, y, layer, opacity)

    local width = 256
    local height = 256

    local name = bird_instance .. "/" .. "puffyBird"
    bird_instance = bird_instance + 1

    self.nodes[name] = birdNode.new(name, self.characterSpriteAtlas, self.characterGeometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

    local scale = self.scale
    local divisor = (2048 / scale)
    local x_offset = (0.5 * scale )
    local y_offset = (0.5 * scale )

    local xx = ((x/divisor)-x_offset) 
    local yy = ((y_offset_world) + (y/divisor)-y_offset) 
    local zz = distanceFromCamera + (0.1 - (layer_distance * (layer - 1))) + objectLayerZOffset

    

    local dimSprite = self.nodes[name].node:getGeometry():getDimensions(self.nodes[name].node)
    local d = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    -- local pp = njli.btVector2( 0.5,0.5 )

    self.nodes[name].node:getGeometry():setDimensions(self.nodes[name].node, d)--, pp)

    xx = adjustPosition(xx, zz)
    yy = adjustPosition(yy, zz)
    self.nodes[name].node:setOrigin(njli.btVector3(xx, yy, zz)) 
end



































































function createSpawnPoints(self, objects, layer, likelyhood)
    local scale = self.scale
    local divisor = (2048 / scale)
    local x_offset = (0.5 * scale )
    local y_offset = (0.5 * scale )

    for i = 1, #objects do
        local object = objects[i]

        theSpawnPoints[object.id] = {}
        theSpawnPoints[object.id].shape = object.shape

        local x = object.x
        local y = object.y
        local width = object.width
        local height = object.height
        theSpawnPoints[object.id].rotation = object.rotation
        theSpawnPoints[object.id].enabled = object.visible







        local xx = ((x/divisor)-x_offset) 
        local yy = ((y_offset_world) + (y/divisor)-y_offset) 
        local zz = distanceFromCamera + (0.1 - (layer_distance * (layer - 1))) + objectLayerZOffset

        local scale_factor = zz / distanceFromCamera

        theSpawnPoints[object.id].x = adjustPosition(xx, zz)
        theSpawnPoints[object.id].y = adjustPosition(yy, zz)
        theSpawnPoints[object.id].z = zz

        theSpawnPoints[object.id].width = width * scale_factor
        theSpawnPoints[object.id].height = height * scale_factor

        -- print_r(theSpawnPoints[object.id])
    end

    -- print("Object "  .. layer)
end

function createBackground(self, name, x, y, layer, opacity)
    -- local name = "bg_country0000"
    self.nodes[name] = backgroundNode.new(name, self.shader)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)


    local imageDimension = 2048

    local scale = self.scale
    local divisor = (imageDimension / scale)
    local x_offset = (0.5 * scale )
    local y_offset = (0.5 * scale )

    local xx = (((x + (imageDimension * 0.5))/divisor)-x_offset) 
    local yy = ((y_offset_world) + ((y + (imageDimension * 0.5))/divisor)-y_offset) 
    local zz = distanceFromCamera + (0.1 - (layer_distance * (layer - 1))) + backgroundLayerZOffset

    local scale_factor = zz / distanceFromCamera

    xx = adjustPosition(xx, zz)
    yy = adjustPosition(yy, zz)
    -- self.nodes[name].node:setOrigin(njli.btVector3(xx, yy, zz))







    -- local scale = self.scale
    local verticesTransform = njli.btTransform(njli.btTransform.getIdentity())
    local basis = verticesTransform:getBasis():scaled(njli.btVector3(scale * scale_factor, scale * scale_factor, 0.0))
    verticesTransform:setBasis(basis)

    self.nodes[name].node:transformVertices(verticesTransform)
    self.nodes[name].node:setOrigin(njli.btVector3(xx,yy,zz))
    self.nodes[name].node:setScale(njli.btVector3(scale, scale, 0.0))

    -- print("Background " .. layer)
end

local tile_instance = 0
function createTile(self, id, x, y, layer, opacity)

    -- print("the layer: " .. layer .. " " .. theHouseTiles[id].image)
    -- print("the id..................... " .. id)

    local tile = theHouseTiles[id]

    local name = tile_instance .. "/" .. tile.image
    tile_instance = tile_instance + 1

    local width = tile.width
    local height = tile.height

    self.nodes[name] = obstacleNode.new(name, self.obstacleSpriteAtlas, self.obstacleGeometry)

    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes[name].node)

    local scale = self.scale
    local divisor = (2048 / scale)
    local x_offset = (0.5 * scale )
    local y_offset = (0.5 * scale )

    local xx = ((x/divisor)-x_offset) 
    local yy = ((y_offset_world) + (y/divisor)-y_offset) 
    local zz = distanceFromCamera + (0.1 - (layer_distance * (layer - 1))) + tileLayerZOffset

    local scale_factor = zz / distanceFromCamera

    xx = adjustPosition(xx, zz)
    yy = adjustPosition(yy, zz)
    self.nodes[name].node:setOrigin(njli.btVector3(xx, yy, zz))
    -- print(self.nodes[name].node:getOrigin())

    local dimSprite = self.nodes[name].node:getGeometry():getDimensions(self.nodes[name].node)
    local d = njli.btVector2( (width/divisor)*2, (height/divisor)*2 )
    local pp = njli.btVector2( 0,0 )

    self.nodes[name].node:getGeometry():setDimensions(self.nodes[name].node, d * scale_factor, pp)
    self.nodes[name].node:setScale(njli.btVector3(self.scale, self.scale, 0.0))

    -- print("Tile " .. layer)
end

local renderHUD = function(self)
end

local push = function(self)
    njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end

function createPointToPointConstraint(nodeA, nodeB)
    local constraint = njli.PhysicsConstraintPointToPoint.create()

    local nodeAMin, nodeAMax = nodeA:getAabb()
    local nodBMin, nodeBMax = nodeB:getAabb()

    constraint:setNodes(nodeA, nodeB)
    constraint:setPivotInA(njli.btVector3(0,nodeAMin:y(),0))
    constraint:setPivotInB(njli.btVector3(0,0,0))

    return constraint
end

local enter = function(self, scene)

    local cameraNode = njli.World.getInstance():getScene():getRootNode()
    cameraNode:getCamera():enableOrthographic(false)
    cameraNode:setOrigin(njli.btVector3(0, 0, 0))
    

    local layer = 4
    local x = 2048 * .5 --njli.World.getInstance():getViewportDimensions():x()-- / 2
    local y = 2048 * .5 --njli.World.getInstance():getViewportDimensions():y()-- / 2
    local z = distanceFromCamera + (0.1 - (layer_distance * (layer - 1))) + objectLayerZOffset
    -- x = adjustPosition(x, z)
    -- y = adjustPosition(y, z)

    -- print('walking dead '  .. njli.World.getInstance():getViewportDimensions():x() .. ' ' .. y)

    -- x,y = 0,0

    -- local nodeA = createBird(self, x, y, layer, 1)
    -- local nodeB = createDog(self, x, y)
    -- local nodeC = createBalloon(self, x, y, layer, 1)

    -- createPointToPointConstraint(nodeA, nodeB)
    
    local currentBackgroundLayer = 1
    local currentTileLayer = 1
    local currentObjectLayer = 1

    for i=1,#self.level.layers do

        local layer = self.level.layers[i]

        if layer.visible then
            if layer.type == "imagelayer" then
                local x = layer.x
                local y = layer.y * -1
                local opacity = layer.opacity

                local name = string.sub(layer.image, 1, string.find(layer.image, ".png")-1)
                name = string.reverse(name)
                name = string.sub(name, 1,string.find(name, '/')-1)
                name = string.reverse(name)

                createBackground(self, name, x, y, currentBackgroundLayer, opacity)
                currentBackgroundLayer = currentBackgroundLayer + 1
            elseif layer.type == "objectgroup" then
                --For the objectgroup layer, opacity means likely hood to spawn from this layer
                local likelyhood = layer.opacity

                createSpawnPoints(self, layer.objects, currentObjectLayer, likelyhood)
                currentObjectLayer = currentObjectLayer + 1
            elseif layer.type == "tilelayer" then
                local x = layer.x
                local y = layer.y + ((layer.height * self.level.tileheight) - (self.level.tilewidth))
                local opacity = layer.opacity
                for j=1,#layer.data do
                    if layer.data[j] ~= 0 then 
                        createTile(self, layer.data[j], x, y, currentTileLayer, opacity)
                    end
                    x = x + (self.level.tilewidth)
                    if x >= (layer.width * self.level.tilewidth) then
                        x = layer.x
                        y = y - (self.level.tileheight)
                    end
                end
                currentTileLayer = currentTileLayer + 1
            end
        end
    end

    createBalloon(self, x, y, layer, 1)

    return self.nodes
end



local update = function(self, scene, timeStep)
end

local exit = function(self, scene)
    -- print(getSceneStateName() .. " exit")

    for k,v in pairs(self.nodes) do
        self.nodes[k].node:getStateMachine():clear(false)
        self.nodes[k]:__gc()
    end
    self.nodes = {}

    -- njli.World.getInstance():getScene():addRootNode(self.shared.orthoCameraNode)
end

local onMessage = function(self, scene, message)
    -- print(getSceneStateName() .. " onMessage")
end

local delete = function(self)
    -- print("delete " .. self.sceneState:getName())

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
    __gc = delete
}

function createImageMaterialGeometrySpriteAtlas(shader, file)
    local imagePath = "images/generated/" .. file .. ".png"
    local luaPath = "scripts/generated/" .. file .. ".lua"

    local image = njli.Image.create()
    local material = njli.Material.create()
    local geometry = njli.Sprite2D.create()
    local spriteAtlas = create((loadfile(njli.ASSET_PATH(luaPath)))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)
    njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)
    material:getDiffuse():loadGPU(image)
    geometry:addMaterial(material)
    geometry:addShaderProgram(shader)

    return image, material, geometry, spriteAtlas
end




local new = function(name, shader)
    -- print("new  " .. name)

    local sceneState = njli.SceneState.create()
    sceneState:setName(name)

    local nodes = {}



    -- local name = "bg_country0000"
    -- nodes[name] = backgroundNode.new(name, shader)
    -- njli.World.getInstance():getScene():getRootNode():addChildNode(nodes[name].node)

    local scale = 90
    -- local verticesTransform = njli.btTransform(njli.btTransform.getIdentity())
    -- local basis = verticesTransform:getBasis():scaled(njli.btVector3(scale, scale, 0.0))
    -- verticesTransform:setBasis(basis)

    -- nodes[name].node:transformVertices(verticesTransform)
    -- nodes[name].node:setOrigin(njli.btVector3(0,y_offset_world,distanceFromCamera))
    -- nodes[name].node:setScale(njli.btVector3(scale, scale, 0.0))

    
    local characterImage, characterMaterial, characterGeometry, characterSpriteAtlas = createImageMaterialGeometrySpriteAtlas(shader, "gameplay0")
    -- local obstacleImage, obstacleMaterial, obstacleGeometry, obstacleSpriteAtlas = createImageMaterialGeometrySpriteAtlas(shader, "gameplay_world0")
    local obstacleImage, obstacleMaterial, obstacleGeometry, obstacleSpriteAtlas = createImageMaterialGeometrySpriteAtlas(shader, "gameplay_first_real_level0")


    -- local luaPath = "scripts/generated/level_country00.lua"
    local luaPath = "scripts/generated/arcade_level_country_00.lua"
    local level = loadfile(njli.ASSET_PATH(luaPath))()

    -- print("#level.tilesets " .. #level.tilesets)

    local offset = 0
    for j=1,#level.tilesets do
        -- for i=1,#level.tilesets[j].tiles do
        --     print_r(level.tilesets[j].tiles[i])
        -- end
        -- print(level.tilesets[j].firstgid)
        local id = level.tilesets[j].firstgid
        
        for i=1,#level.tilesets[j].tiles do
            addHouseTileProperty(self, level.tilesets[j].tiles[i], id)
            id = id + 1
        end

        offset = offset + 1
    end

    

    local properties = 
    {
        sceneState = sceneState,
        nodes = nodes,

        characterImage = characterImage,
        characterMaterial = characterMaterial,
        characterGeometry = characterGeometry,
        characterSpriteAtlas = characterSpriteAtlas,

        obstacleImage = obstacleImage,
        obstacleMaterial = obstacleMaterial,
        obstacleGeometry = obstacleGeometry,
        obstacleSpriteAtlas = obstacleSpriteAtlas,

        scale = scale,

        --DONT DELETE
        shader = shader,
        level = level,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
