local arg={...}

-- function destroyObject(object)
--     njli.World.getInstance():getWorldFactory():destroy(object)
-- end


function printLevelInformation(lvl)
    print("version = " .. lvl.version)
    print("luaversion = " .. lvl.luaversion)
    print("tiledversion = " .. lvl.tiledversion)
    print("orientation = " .. lvl.orientation)
    print("width = " .. lvl.width)
    print("height = " .. lvl.height)
    print("tilewidth = " .. lvl.tilewidth)
    print("tileheight = " .. lvl.tileheight)
    print("nextobjectid = " .. lvl.nextobjectid)
    print("number of properties = " .. #lvl.properties)
    
    for i=1,#lvl.tilesets do
        print("tilesets[" .. i .. "].name = " .. lvl.tilesets[i].name)
        print("tilesets[" .. i .. "].firstgid = " .. lvl.tilesets[i].firstgid)
        print("tilesets[" .. i .. "].tilewidth = " .. lvl.tilesets[i].tilewidth)
        print("tilesets[" .. i .. "].tileheight = " .. lvl.tilesets[i].tileheight)
        print("tilesets[" .. i .. "].spacing = " .. lvl.tilesets[i].spacing)
        print("tilesets[" .. i .. "].margin = " .. lvl.tilesets[i].margin)
        print("tilesets[" .. i .. "].tileoffset.x = " .. lvl.tilesets[i].tileoffset.x)
        print("tilesets[" .. i .. "].tileoffset.y = " .. lvl.tilesets[i].tileoffset.y)
        print("number of properties = " .. #lvl.tilesets[i].properties)
        print("number of terrains = " .. #lvl.tilesets[i].terrains)
        print("number of tiles = " .. #lvl.tilesets[i].tiles)
        for j=1,#lvl.tilesets[i].tiles do
            print("lvl.tilesets[" .. i .. "].tiles[" .. j .. "].id = " .. lvl.tilesets[i].tiles[j].id)
            print("lvl.tilesets[" .. i .. "].tiles[" .. j .. "].image = " .. lvl.tilesets[i].tiles[j].image)
            print("lvl.tilesets[" .. i .. "].tiles[" .. j .. "].width = " .. lvl.tilesets[i].tiles[j].width)
            print("lvl.tilesets[" .. i .. "].tiles[" .. j .. "].height = " .. lvl.tilesets[i].tiles[j].height)
        end

    end

    for i=1,#lvl.layers do
        if lvl.layers[i].type == "imagelayer" then
            print("layers[" .. i .. "].type = " .. lvl.layers[i].type)
            print("layers[" .. i .. "].name = " .. lvl.layers[i].name)
            print("layers[" .. i .. "].x = " .. lvl.layers[i].x)
            print("layers[" .. i .. "].y = " .. lvl.layers[i].y)
            -- print("layers[" .. i .. "].visible = " .. lvl.layers[i].visible)
            print("layers[" .. i .. "].opacity = " .. lvl.layers[i].opacity)
            print("layers[" .. i .. "].image = " .. lvl.layers[i].image)
            print("number of properties " .. #lvl.layers[i].properties)
        end

        if lvl.layers[i].type == "objectgroup" then
            print("layers[" .. i .. "].type = " .. lvl.layers[i].type)
            print("layers[" .. i .. "].name = " .. lvl.layers[i].name)
            -- print("layers[" .. i .. "].visible = " .. lvl.layers[i].visible)
            print("layers[" .. i .. "].opacity = " .. lvl.layers[i].opacity)
            print("number of properties " .. #lvl.layers[i].properties)
            print("number of objects " .. #lvl.layers[i].objects)

            for j=1,#lvl.layers[i].objects do
                print("layers[" .. i .. "].objects[" .. j .. "].id = " .. lvl.layers[i].objects[j].id)
                print("layers[" .. i .. "].objects[" .. j .. "].name = " .. lvl.layers[i].objects[j].name)
                print("layers[" .. i .. "].objects[" .. j .. "].type = " .. lvl.layers[i].objects[j].type)
                print("layers[" .. i .. "].objects[" .. j .. "].shape = " .. lvl.layers[i].objects[j].shape)
                print("layers[" .. i .. "].objects[" .. j .. "].x = " .. lvl.layers[i].objects[j].x)
                print("layers[" .. i .. "].objects[" .. j .. "].y = " .. lvl.layers[i].objects[j].y)
                print("layers[" .. i .. "].objects[" .. j .. "].width = " .. lvl.layers[i].objects[j].width)
                print("layers[" .. i .. "].objects[" .. j .. "].height = " .. lvl.layers[i].objects[j].height)
                print("layers[" .. i .. "].objects[" .. j .. "].rotation = " .. lvl.layers[i].objects[j].rotation)
                -- print("layers[" .. i .. "].objects[" .. j .. "].visible = " .. lvl.layers[i].objects[j].visible)
                print("number of properties = " .. #lvl.layers[i].objects[j].properties)
            end
        end
        if lvl.layers[i].type == "tilelayer" then
            print("lvl.layers[" .. i .. "].type = " .. lvl.layers[i].type)
            print("lvl.layers[" .. i .. "].name = " .. lvl.layers[i].name)
            print("lvl.layers[" .. i .. "].x = " .. lvl.layers[i].x)
            print("lvl.layers[" .. i .. "].y = " .. lvl.layers[i].y)
            print("lvl.layers[" .. i .. "].width = " .. lvl.layers[i].width)
            print("lvl.layers[" .. i .. "].height = " .. lvl.layers[i].height)
            -- print("lvl.layers[" .. i .. "].visible = " .. lvl.layers[i].visible)
            print("lvl.layers[" .. i .. "].opacity = " .. lvl.layers[i].opacity)
            print("number of properties = " .. #lvl.layers[i].properties)
            print("lvl.layers[" .. i .. "].encoding = " .. lvl.layers[i].encoding)
            print("number of data points = " .. #lvl.layers[i].data)

            local x = 0
            local y = 0
            for j=1,#lvl.layers[i].data do

                if lvl.layers[i].data[j] ~= 0 then
                    print(lvl.layers[i].data[j] .. " : {" .. x .. ", " .. ((lvl.height * lvl.tileheight) - y) .. "}")
                end

                x = x + lvl.tilewidth
                if x > (lvl.width * lvl.tilewidth) then
                    x = 0
                    y = y + lvl.tileheight
                end
            end
        end
    end
end


local backgroundNode = require "backgroundNode"
local obstacleNode = require "obstacleNode"

local renderHUD = function(self)
end

local push = function(self)
    njli.World.getInstance():getScene():getStateMachine():pushState(self.sceneState)
end

local enter = function(self, scene)
    print(getSceneStateName() .. " enter")

    printLevelInformation(self.level())

    

 
    self.shared.cameraNode:getCamera():enableOrthographic(false)
    self.shared.cameraNode:setOrigin(njli.btVector3(0, 0, 0))
    

    self.nodes["backgroundNode"] = backgroundNode.new("backgroundNode", self.shared.geometry)
    njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes["backgroundNode"].node)


    -- self.nodes["512_house0001"] = obstacleNode.new("512_house0001", self.shared.geometry, self.spriteAtlas[2])
    -- njli.World.getInstance():getScene():getRootNode():addChildNode(self.nodes["512_house0001"].node)





    -- self.nodes[name]:hide(self.shared.cameraNode:getCamera())

    return self.nodes
end

local update = function(self, scene, timeStep)
end

local exit = function(self, scene)
    print(getSceneStateName() .. " exit")

    for k,v in pairs(self.nodes) do
        self.nodes[k].node:getStateMachine():clear(false)
        self.nodes[k]:__gc()
    end
    self.nodes = {}

    -- njli.World.getInstance():getScene():addRootNode(self.shared.orthoCameraNode)
end

local onMessage = function(self, scene, message)
    print(getSceneStateName() .. " onMessage")
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
    __gc = delete
}

local new = function(name, shared, spriteAtlas)
    print("new  " .. name)

    local level = loadfile(njli.ASSET_PATH("scripts/generated/level_country00.lua"))

    local sceneState = njli.SceneState.create()
    sceneState:setName(name)

    
    -- shared.orthoCameraNode:setOrigin(njli.btVector3(0, 0, 5))
    

    
    -- njli.World.getInstance():getScene():addRootNode(shared.perspectiveCameraNode)


    local nodes = {}

    local properties = 
    {
        level = level,
        sceneState = sceneState,
        nodes = nodes,

        --DONT DELETE
        shared = shared,
        spriteAtlas = spriteAtlas



    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
