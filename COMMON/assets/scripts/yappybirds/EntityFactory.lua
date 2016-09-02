local EntityFactory = {}
EntityFactory.__index = EntityFactory

local json = require('json')

setmetatable(EntityFactory, {
 __call = function (cls, ...)
 local self = setmetatable({}, cls)
 self:create(...)
 return self
 end,
})

function EntityFactory:className()
 return "EntityFactory"
end

function EntityFactory:class()
 return self
end

function EntityFactory:superClass()
 return nil
end

function EntityFactory:isa(theClass)
 local b_isa = false
 local cur_class = theClass:class()
 while ( nil ~= cur_class ) and ( false == b_isa ) do
 if cur_class == theClass then
 b_isa = true
 else
 cur_class = cur_class:superClass()
 end
 end

 return b_isa
end

function EntityFactory:destroy()
 EntityFactory.__gc(self)
end

function EntityFactory:create(init)
 
 
 
-- self._nodeEntityTable = {}
-- self._sceneEntityTable = {}
-- self._worldEntityTable = {}
 

 if init then
 
 end
end

function EntityFactory:__gc()
 
-- for k,v in pairs(self._nodeEntityTable) do
-- v:destroy()
-- end

-- for k,v in pairs(self._sceneEntityTable) do
-- v:destroy()
-- end

-- for k,v in pairs(self._worldEntityTable) do
-- v:destroy()
-- end
end

function EntityFactory:__tostring()
  return json:stringify(self)
end

function EntityFactory:createMenuScene(theGameInstance)
  local myInit =
  {
    name = "MenuScene",
    states =
    {
      {
        name = "AboutSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.AboutSceneEntityState"
      },
      {
        name = "AchievementsSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.AchievementsSceneEntityState"
      },
      {
        name = "BoardselectSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.BoardselectSceneEntityState"
      },
      {
        name = "CharactersSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.CharactersSceneEntityState"
      },
      {
        name = "HighScoresSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.HighScoresSceneEntityState"
      },
      {
        name = "LeaderboardsSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.LeaderboardsSceneEntityState"
      },
      {
        name = "LevelselectSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.LevelselectSceneEntityState"
      },
      {
        name = "LoadingMenuSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.LoadingMenuSceneEntityState"
      },
      {
        name = "MainMenuSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.MainMenuSceneEntityState"
      },
      {
        name = "ModeselectSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.ModeselectSceneEntityState"
      },
      {
        name = "SettingsSceneEntityState",
        module = require "yappybirds.scenes.MenuScene.states.SettingsSceneEntityState"
      },
    },

    startStateName = "LoadingMenuSceneEntityState",
--    gameInstance = self:getEntityOwner():getGameInstance()
    gameInstance = theGameInstance
  }

  local MenuSceneEntity = require "yappybirds.scenes.MenuScene.MenuSceneEntity"
  assert(MenuSceneEntity, "SceneEntity class is nil")
  --self:getEntityOwner():getGameInstance():getEntityManager():addSceneEntity(MenuSceneEntity(myInit))
  theGameInstance:getEntityManager():addSceneEntity(MenuSceneEntity(myInit))

  --local sceneEntity = self:getEntityOwner():getGameInstance():getEntityManager():getSceneEntity(myInit.name)
  local sceneEntity = theGameInstance:getEntityManager():getSceneEntity(myInit.name)
  assert(sceneEntity, "SceneEntity is nil")
  sceneEntity:load()
  sceneEntity:initialize()
end

return EntityFactory