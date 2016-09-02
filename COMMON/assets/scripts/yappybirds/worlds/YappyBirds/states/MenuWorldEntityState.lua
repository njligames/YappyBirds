local WorldEntityState = require "njli.statemachine.worldentitystate"

local MenuWorldEntityState = {}
MenuWorldEntityState.__index = MenuWorldEntityState

local json = require('json')

setmetatable(MenuWorldEntityState, {
    __index = WorldEntityState,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function MenuWorldEntityState:className()
  return "MenuWorldEntityState"
end

function MenuWorldEntityState:class()
  return self
end

function MenuWorldEntityState:superClass()
  return WorldEntityState
end

function MenuWorldEntityState:destroy()
  MenuWorldEntityState.__gc(self)
  WorldEntityState.destroy(self)

  print(" MenuWorldEntityState:destroy()")
end

local init =
{
  name = "name",
  entityOwner = nil
}

function MenuWorldEntityState:create(init)
  print("MenuWorldEntityState:create(init)")

  WorldEntityState.create(self, init)

  local sceneInit =
  {
    name = "MenuScene",
    gameInstance = self:getEntityOwner():getGameInstance()
  }

  local MenuSceneEntity = require "yappybirds.scenes.MenuScene.MenuSceneEntity"
  self:getEntityOwner():getGameInstance():getEntityManager():addSceneEntity(MenuSceneEntity(sceneInit))

  local sceneEntity = self:getEntityOwner():getGameInstance():getEntityManager():getSceneEntity(sceneInit.name)
  sceneEntity:load()
  
end

function MenuWorldEntityState:__gc()
  self:unLoad()
end

function MenuWorldEntityState:__tostring()

  return json:stringify(self)
end

function MenuWorldEntityState:isLoaded()
  return WorldEntityState.isLoaded(self)
end

function MenuWorldEntityState:load()
  WorldEntityState.load(self)

   print(" MenuWorldEntityState:load()")
end

function MenuWorldEntityState:unLoad()
  WorldEntityState.unLoad(self)

   print(" MenuWorldEntityState:unLoad()")
end

function MenuWorldEntityState:enter()
  print(" MenuWorldEntityState:enter()")
end

function MenuWorldEntityState:update(timeStep)
  print(" MenuWorldEntityState:update("..timeStep..")")

  -- self:push()
end

function MenuWorldEntityState:exit()
  print(" MenuWorldEntityState:exit()")
end

function MenuWorldEntityState:onMessage(message)
   print(" MenuWorldEntityState:onMessage()")
end

function MenuWorldEntityState:touchDown(touches)
   print(" MenuWorldEntityState:touchDown()")
end

function MenuWorldEntityState:touchUp(touches)
   print(" MenuWorldEntityState:touchUp()")
end

function MenuWorldEntityState:touchMove(touches)
   print(" MenuWorldEntityState:touchMove()")
end

function MenuWorldEntityState:touchCancelled(touches)
   print(" MenuWorldEntityState:touchCancelled()")
end

function MenuWorldEntityState:renderHUD()
   print(" MenuWorldEntityState:renderHUD()")
end

function MenuWorldEntityState:keyboardShow()
   print(" MenuWorldEntityState:keyboardShow()")
end

function MenuWorldEntityState:keyboardCancel()
   print(" MenuWorldEntityState:keyboardCancel()")
end

function MenuWorldEntityState:keyboardReturn(text)
   print(" MenuWorldEntityState:keyboardReturn()")
end

function MenuWorldEntityState:receivedMemoryWarning()
   print(" MenuWorldEntityState:receivedMemoryWarning()")
end

function MenuWorldEntityState:pause()
   print(" MenuWorldEntityState:pause()")
end

function MenuWorldEntityState:unPause()
   print(" MenuWorldEntityState:unPause()")
end

return MenuWorldEntityState
