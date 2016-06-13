local SceneEntity = require "njli.statemachine.sceneentity"

local MenuSceneEntity = {}
MenuSceneEntity.__index = MenuSceneEntity

local json = require('JSON')

setmetatable(MenuSceneEntity, {
  __index = SceneEntity,
  __call = function (cls, ...)
    local self = setmetatable({}, cls)
    self:create(...)
    return self
  end,
})

function MenuSceneEntity:className()
  return "MenuSceneEntity"
end

function MenuSceneEntity:class()
  return self
end

function MenuSceneEntity:superClass()
  return SceneEntity
end

function MenuSceneEntity:destroy()
  print(" MenuSceneEntity:destroy()")

  MenuSceneEntity.__gc(self)
  SceneEntity.destroy(self)
end

function MenuSceneEntity:create(init)
  SceneEntity.create(self, init)

  --TODO: Create and initialize properties...
  print(" MenuSceneEntity:create(init)")
end

function MenuSceneEntity:__gc()
  --TODO: Destroy properties
end

function MenuSceneEntity:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

--TODO: List the Functions for MenuSceneEntity

function MenuSceneEntity:isLoaded()
  return SceneEntity.isLoaded(self)
end

function MenuSceneEntity:load()
  SceneEntity.load(self)

  print(" MenuSceneEntity:load()")
end

function MenuSceneEntity:unLoad()
  SceneEntity.unLoad(self)

  print(" MenuSceneEntity:unLoad()")
end

function MenuSceneEntity:initialize()
  SceneEntity.initialize(self)

  print(" MenuSceneEntity:initialize()")
end

function MenuSceneEntity:enter()
  SceneEntity.enter(self)

  print(" MenuSceneEntity:enter()")
end

function MenuSceneEntity:update(timeStep)
  SceneEntity.update(self, timeStep)

  print(" MenuSceneEntity:update()")
end

function MenuSceneEntity:exit()
  SceneEntity.exit(self)

  print(" MenuSceneEntity:exit()")
end

function MenuSceneEntity:onMessage(message)
  SceneEntity.onMessage(self, message)

  print(" MenuSceneEntity:onMessage()")
end

function MenuSceneEntity:touchDown(touches)
  SceneEntity.touchDown(self, touches)

  print(" MenuSceneEntity:touchDown()")
end

function MenuSceneEntity:touchUp(touches)
  SceneEntity.touchUp(self, touches)

  print(" MenuSceneEntity:touchUp()")
end

function MenuSceneEntity:touchMove(touches)
  SceneEntity.touchMove(self, touches)

  print(" MenuSceneEntity:touchMove()")
end

function MenuSceneEntity:touchCancelled(touches)
  SceneEntity.touchCancelled(self, touches)

  print(" MenuSceneEntity:touchCancelled()")
end

function MenuSceneEntity:renderHUD()
  SceneEntity.renderHUD(self)

  print(" MenuSceneEntity:renderHUD()")
end

function MenuSceneEntity:pause()
  SceneEntity.pause(self)

  print(" MenuSceneEntity:pause()")
end

function MenuSceneEntity:unPause()
  SceneEntity.unPause(self)

  print(" MenuSceneEntity:unPause()")
end

return MenuSceneEntity
