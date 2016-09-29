local MenuSceneEntity = require "yappybirds.scenes.MenuSceneEntity"

 local WorldEntityState = require "njli.statemachine.worldentitystate"
 
 local MenuWorldEntityState = {}
 MenuWorldEntityState.__index = MenuWorldEntityState
 
 local json = require('JSON')
 
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
 print(" MenuWorldEntityState:destroy()")

 MenuWorldEntityState.__gc(self)
 WorldEntityState.destroy(self)
 end
 
 
local init =
{
 name = "name",
 entityOwner = nil
}

function MenuWorldEntityState:create(init)
 WorldEntityState.create(self, init)
 
 print(" MenuWorldEntityState:create(init)")
 local myInit = 
 {
 name = "MenuScene",
 states =
 {
 {
 name = "LoadingMenuSceneEntityState",
 module = require "yappybirds.scenes.states.LoadingMenuSceneEntityState"
 },
 {
 name = "MainMenuSceneEntityState",
 module = require "yappybirds.scenes.states.MainMenuSceneEntityState"
 },
 {
 name = "SettingsSceneEntityState",
 module = require "yappybirds.scenes.states.SettingsSceneEntityState"
 },
 {
 name = "HighScoresSceneEntityState",
 module = require "yappybirds.scenes.states.HighScoresSceneEntityState"
 },
 {
 name = "CharactersSceneEntityState",
 module = require "yappybirds.scenes.states.CharactersSceneEntityState"
 },
 {
 name = "AboutSceneEntityState",
 module = require "yappybirds.scenes.states.AboutSceneEntityState"
 },
 {
 name = "LeaderboardsSceneEntityState",
 module = require "yappybirds.scenes.states.LeaderboardsSceneEntityState"
 },
 {
 name = "AchievementsSceneEntityState",
 module = require "yappybirds.scenes.states.AchievementsSceneEntityState"
 },
 {
 name = "LevelselectSceneEntityState",
 module = require "yappybirds.scenes.states.LevelselectSceneEntityState"
 },
 {
 name = "ModeselectSceneEntityState",
 module = require "yappybirds.scenes.states.ModeselectSceneEntityState"
 },
 {
 name = "BoardselectSceneEntityState",
 module = require "yappybirds.scenes.states.BoardselectSceneEntityState"
 },
 },

 startStateName = "LoadingMenuSceneEntityState",
 gameInstance = self:getEntityOwner():getGameInstance()
 }

 local sceneEntity = MenuSceneEntity(myInit)
 self:getEntityOwner():getGameInstance():getEntityManager():addSceneEntity(sceneEntity)
end

function MenuWorldEntityState:__gc()
 self:unLoad()
end

function MenuWorldEntityState:__tostring()
 
 return json.encode(self)
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
 print("	MenuWorldEntityState:enter()")

 
 
end

function MenuWorldEntityState:update(timeStep)
 
end

function MenuWorldEntityState:exit()
 print("	MenuWorldEntityState:exit()")
end

function MenuWorldEntityState:onMessage(message)
 print("	MenuWorldEntityState:onMessage()")
end

function MenuWorldEntityState:touchDown(touches)
 print("	MenuWorldEntityState:touchDown()")
end

function MenuWorldEntityState:touchUp(touches)
 print("	MenuWorldEntityState:touchUp()")
end

function MenuWorldEntityState:touchMove(touches)
 print("	MenuWorldEntityState:touchMove()")
end

function MenuWorldEntityState:touchCancelled(touches)
 print("	MenuWorldEntityState:touchCancelled()")
end

function MenuWorldEntityState:renderHUD()
 print("	MenuWorldEntityState:renderHUD()")
end

function MenuWorldEntityState:keyboardShow()
 print("	MenuWorldEntityState:keyboardShow()")
end

function MenuWorldEntityState:keyboardCancel()
 print("	MenuWorldEntityState:keyboardCancel()")
end

function MenuWorldEntityState:keyboardReturn(text)
 print("	MenuWorldEntityState:keyboardReturn()")
end

function MenuWorldEntityState:receivedMemoryWarning()
 print("	MenuWorldEntityState:receivedMemoryWarning()")
end

function MenuWorldEntityState:pause()
 print("	MenuWorldEntityState:pause()")
end

function MenuWorldEntityState:unPause()
 print("	MenuWorldEntityState:unPause()")
end

return MenuWorldEntityState
