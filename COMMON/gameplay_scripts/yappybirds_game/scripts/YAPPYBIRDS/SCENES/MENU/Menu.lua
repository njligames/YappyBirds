local BaseClass = require "NJLI.STATEMACHINE.SceneEntity"

local Menu = {}
Menu.__index = Menu

--#############################################################################
--DO NOT EDIT ABOVE
--#############################################################################

--#############################################################################
--Begin Custom Code
--Required local functions:
-- __ctor()
-- __dtor()
-- __load()
-- __unLoad()
--#############################################################################

local __ctor = function(self, init)
    local spriteAtlasPath = njli.ASSET_PATH("scripts/generated/texturepacker/interface0.lua")
    self._spriteAtlas = njli.build((loadfile(spriteAtlasPath))():getSheet(), njli.JLI_OBJECT_TYPE_SpriteFrameAtlas)

    local image = njli.Image.create()
    njli.World.getInstance():getWorldResourceLoader():load("images/generated/interface0.png", image)
    Geometry2D:getMaterial():getDiffuse():loadGPU(image)
    njli.Image.destroy(image)

    self:getScene():getRootNode():addChildNode(OrthographicCameraNode)
    self:getScene():getRootNode():addChildNode(PerspectiveCameraNode)

    local nodeEntity = NJLIButton.class({
        name = "PLAY",
        states = NJLIButton.states,
        entityOwner = self,
        atlas = self._spriteAtlas,
        geometry = Geometry2D,
        scale = 25,
      })
      self:addNodeEntity(nodeEntity)

      nodeEntity:hide(PerspectiveCameraNode:getCamera())
      nodeEntity:show(OrthographicCameraNode:getCamera())

      nodeEntity:getNode():setOrigin(bullet.btVector3(400, 400, -1))
end

local __dtor = function(self)
    njli.SpriteFrameAtlas.destroy(self._spriteAtlas)
    self._spriteAtlas = nil
end

local __load = function(self)
  --TODO: load this Entity
    
end

local __unLoad = function(self)
  --TODO: unload this Entity
end

--#############################################################################

function Menu:enter()
  BaseClass.enter(self)
end

function Menu:update(timeStep)
  BaseClass.update(self, timeStep)
end

function Menu:exit()
  BaseClass.exit(self)
end

function Menu:onMessage(message)
  BaseClass.onMessage(self, message)
end

function Menu:touchDown(touches)
  BaseClass.touchDown(self, touches)
end

function Menu:touchUp(touches)
  BaseClass.touchUp(self, touches)
end

function Menu:touchMove(touches)
  BaseClass.touchMove(self, touches)
end

function Menu:touchCancelled(touches)
  BaseClass.touchCancelled(self, touches)
end

function Menu:renderHUD()
  BaseClass.renderHUD(self)
end

function Menu:pause()
  BaseClass.pause(self)
end

function Menu:unPause()
  BaseClass.unPause(self)
end

function Menu:willResignActive()
  BaseClass.willResignActive(self)
end

function Menu:didBecomeActive()
  BaseClass.didBecomeActive(self)
end

function Menu:didEnterBackground()
  BaseClass.didEnterBackground(self)
end

function Menu:willEnterForeground()
  BaseClass.willEnterForeground(self)
end

function Menu:willTerminate()
  BaseClass.willTerminate(self)
end

function Menu:interrupt()
  BaseClass.interrupt(self)
end

function Menu:resumeInterrupt()
  BaseClass.resumeInterrupt(self)
end

function Menu:receivedMemoryWarning()
  BaseClass.receivedMemoryWarning(self)
end

--#############################################################################
--End Custom Code
--#############################################################################

--#############################################################################
--DO NOT EDIT BELOW
--#############################################################################

setmetatable(Menu, {
    __index = BaseClass,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      --Create the base first
      BaseClass._create(self, ...)
      self:_create(...)
      return self
    end,
  })

function Menu:className()
  return "Menu"
end

function Menu:class()
  return self
end

function Menu:superClass()
  return BaseClass
end

function Menu:__gc()
  --Destroy derived class first
  Menu._destroy(self)
  --Destroy base class after derived class
  BaseClass._destroy(self)
end

function Menu:__tostring()
  local ret = self:className() .. " =\n{\n"

  for pos,val in pairs(self) do
    ret = ret .. "\t" .. "["..pos.."]" .. " => " .. type(val) .. " = " .. tostring(val) .. "\n"
  end

  ret = ret .. "\n\t" .. tostring_r(BaseClass) .. "\n}"
  return ret .. "\n\t" .. tostring_r(getmetatable(self)) .. "\n}"
end

function Menu:_destroy()
  assert(not self.__MenuCalledLoad, "Must unload before you destroy")
  __dtor(self)
end

function Menu:_create(init)
  self.__MenuCalledLoad = false
  __ctor(self, init)
end

function Menu:load()
  --load base first
  BaseClass.load(self)

  --load derived last...
  __load(self)

  self.__MenuCalledLoad = true
end

function Menu:unLoad()
  assert(self.__MenuCalledLoad, "Must load before unloading")

  --unload derived first...
  __unLoad(self)
  self.__MenuCalledLoad = false

  --unload base last...
  BaseClass.unLoad(self)
end

return Menu
