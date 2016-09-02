local WorldEntity = require "njli.statemachine.worldentity"

local YappyBirdWorldEntity = {}
YappyBirdWorldEntity.__index = YappyBirdWorldEntity

local json = require('json')

setmetatable(YappyBirdWorldEntity, {
    __index = WorldEntity,
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function YappyBirdWorldEntity:className()
  return "YappyBirdWorldEntity"
end

function YappyBirdWorldEntity:class()
  return self
end

function YappyBirdWorldEntity:superClass()
  return WorldEntity
end

function YappyBirdWorldEntity:destroy()
  YappyBirdWorldEntity.__gc(self)

  WorldEntity.destroy(self)
end

function YappyBirdWorldEntity:create(init)
  WorldEntity.create(self, init)

--  print(" YappyBirdWorldEntity:create(init)")

end

function YappyBirdWorldEntity:__gc()

end

function YappyBirdWorldEntity:__tostring()

  return json:stringify(self)
end

function YappyBirdWorldEntity:isLoaded()
  return WorldEntity.isLoaded(self)
end

function YappyBirdWorldEntity:load()
  WorldEntity.load(self)

--  print(" YappyBirdWorldEntity:load()")
end

function YappyBirdWorldEntity:unLoad()
  WorldEntity.unLoad(self)

--  print(" YappyBirdWorldEntity:unLoad()")
end

function YappyBirdWorldEntity:initialize()
  WorldEntity.initialize(self)

--  print(" YappyBirdWorldEntity:initialize()")
end

function YappyBirdWorldEntity:enter()
  WorldEntity.enter(self)

--  print(" YappyBirdWorldEntity:enter()")
end

function YappyBirdWorldEntity:update(timeStep)
  WorldEntity.update(self, timeStep)

--   print(" YappyBirdWorldEntity:update("..timeStep..")")
end

function YappyBirdWorldEntity:exit()
  WorldEntity.exit(self)

--  print(" YappyBirdWorldEntity:exit()")
end

function YappyBirdWorldEntity:onMessage(message)
  WorldEntity.onMessage(self, message)

--  print(" YappyBirdWorldEntity:onMessage(message)")
end

function YappyBirdWorldEntity:touchDown(touches)
  WorldEntity.touchDown(self, touches)

--  print(" YappyBirdWorldEntity:touchDown(touches)")
end

function YappyBirdWorldEntity:touchUp(touches)
  WorldEntity.touchUp(self, touches)

--  print(" YappyBirdWorldEntity:touchUp(touches)")
end

function YappyBirdWorldEntity:touchMove(touches)
  WorldEntity.touchMove(self, touches)

--  print(" YappyBirdWorldEntity:touchMove(touches)")
end

function YappyBirdWorldEntity:touchCancelled(touches)
  WorldEntity.touchCancelled(self, touches)

--  print(" YappyBirdWorldEntity:touchCancelled(touches)")
end

function YappyBirdWorldEntity:renderHUD()
  WorldEntity.renderHUD(self)

--  print(" YappyBirdWorldEntity:renderHUD()")
end

function YappyBirdWorldEntity:keyboardShow()
  WorldEntity.keyboardShow(self)

--  print(" YappyBirdWorldEntity:keyboardShow()")
end

function YappyBirdWorldEntity:keyboardCancel()
  WorldEntity.keyboardCancel(self)

--  print(" YappyBirdWorldEntity:keyboardCancel()")
end

function YappyBirdWorldEntity:keyboardReturn(text)
  WorldEntity.keyboardReturn(self, text)

--  print(" YappyBirdWorldEntity:keyboardReturn(text)")
end

function YappyBirdWorldEntity:receivedMemoryWarning()
  WorldEntity.receivedMemoryWarning(self)

--  print(" YappyBirdWorldEntity:receivedMemoryWarning()")
end

function YappyBirdWorldEntity:pause()
  WorldEntity.pause(self)

--  print(" YappyBirdWorldEntity:pause()")
end

function YappyBirdWorldEntity:unPause()
  WorldEntity.unPause(self)

--  print(" YappyBirdWorldEntity:unPause()")
end

return YappyBirdWorldEntity
