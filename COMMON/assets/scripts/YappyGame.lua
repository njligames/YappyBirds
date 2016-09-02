local YappyBirdWorldEntity = require "yappybirds.worlds.YappyBirds.YappyBirdWorldEntity"

local YappyGame = {}
YappyGame.__index = YappyGame

local json = require('json')

setmetatable(YappyGame, {
    __call = function (cls, ...)
      local self = setmetatable({}, cls)
      self:create(...)
      return self
    end,
  })

function YappyGame:className()
  return "YappyGame"
end

function YappyGame:class()
  return self
end

function YappyGame:superClass()
  return nil
end

function YappyGame:isa(theClass)
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

function YappyGame:destroy()
  YappyGame.__gc(self)
end

function YappyGame:create(init)

  assert(type(init) == "table", "The init parameter must be of type table.")
  assert(init.gameInstance, "There must be a game instance inside of the init table.")

  self._sharedGameInstance = init.gameInstance
  
  local myInit =
  {
    name = "YappyBirdWorldEntity",
    states =
    {
      {
        name = "GameplayWorldEntityState",
        module = require "yappybirds.worlds.YappyBirds.states.GameplayWorldEntityState"
      },
      {
        name = "MenuWorldEntityState",
        module = require "yappybirds.worlds.YappyBirds.states.MenuWorldEntityState"
      },
      {
        name = "ResultsWorldEntityState",
        module = require "yappybirds.worlds.YappyBirds.states.ResultsWorldEntityState"
      },
    },

    startStateName = "MenuWorldEntityState",
    gameInstance = init.gameInstance,
  }

  self:getGameInstance():getEntityManager():addWorldEntity(YappyBirdWorldEntity(myInit))
end

function YappyGame:__gc()
end

function YappyGame:__tostring()
  return json.stringify(self)
end

function YappyGame:getGameInstance()
  return self._sharedGameInstance
end

function YappyGame:start()
  local worldEntity = self:getGameInstance():getEntityManager():getWorldEntity("YappyBirdWorldEntity")

  worldEntity:load()

  worldEntity:initialize()
end

return YappyGame
