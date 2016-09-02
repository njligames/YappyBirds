local SceneEntity = require "njli.statemachine.sceneentity"

local ResultsSceneEntity = {}
ResultsSceneEntity.__index = ResultsSceneEntity

local json = require('json')

setmetatable(ResultsSceneEntity, {
 __index = SceneEntity,
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function ResultsSceneEntity:className()
 return "ResultsSceneEntity"
end

function ResultsSceneEntity:class()
 return self
end

function ResultsSceneEntity:superClass()
 return SceneEntity
end

function ResultsSceneEntity:destroy()
 print(" ResultsSceneEntity:destroy()")

 ResultsSceneEntity.__gc(self)
 SceneEntity.destroy(self)
end

function ResultsSceneEntity:create(init)
 SceneEntity.create(self, init)

 
 print(" ResultsSceneEntity:create(init)")
end

function ResultsSceneEntity:__gc()
 
end

function ResultsSceneEntity:__tostring()
 
 return json:stringify(self)
end



function ResultsSceneEntity:isLoaded()
 return SceneEntity.isLoaded(self)
end

function ResultsSceneEntity:load()
 SceneEntity.load(self)

 print(" ResultsSceneEntity:load()")
end

function ResultsSceneEntity:unLoad()
 SceneEntity.unLoad(self)

 print(" ResultsSceneEntity:unLoad()")
end

function ResultsSceneEntity:initialize()
 SceneEntity.initialize(self)

 print(" ResultsSceneEntity:initialize()")
end

function ResultsSceneEntity:enter()
 SceneEntity.enter(self)

 print(" ResultsSceneEntity:enter()")
end

function ResultsSceneEntity:update(timeStep)
 SceneEntity.update(self, timeStep)

 print(" ResultsSceneEntity:update()")
end

function ResultsSceneEntity:exit()
 SceneEntity.exit(self)

 print(" ResultsSceneEntity:exit()")
end

function ResultsSceneEntity:onMessage(message)
 SceneEntity.onMessage(self, message)

 print(" ResultsSceneEntity:onMessage()")
end

function ResultsSceneEntity:touchDown(touches)
 SceneEntity.touchDown(self, touches)

 print(" ResultsSceneEntity:touchDown()")
end

function ResultsSceneEntity:touchUp(touches)
 SceneEntity.touchUp(self, touches)

 print(" ResultsSceneEntity:touchUp()")
end

function ResultsSceneEntity:touchMove(touches)
 SceneEntity.touchMove(self, touches)

 print(" ResultsSceneEntity:touchMove()")
end

function ResultsSceneEntity:touchCancelled(touches)
 SceneEntity.touchCancelled(self, touches)

 print(" ResultsSceneEntity:touchCancelled()")
end

function ResultsSceneEntity:renderHUD()
 SceneEntity.renderHUD(self)

 print(" ResultsSceneEntity:renderHUD()")
end

function ResultsSceneEntity:pause()
 SceneEntity.pause(self)

 print(" ResultsSceneEntity:pause()")
end

function ResultsSceneEntity:unPause()
 SceneEntity.unPause(self)

 print(" ResultsSceneEntity:unPause()")
end

return ResultsSceneEntity
