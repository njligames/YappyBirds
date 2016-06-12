--worlds have worldstates
--worldstates have scenes
--scenes have scenestates
--scenestates have nodes
--nodes have nodestates

local YappyBirdWorldEntity = require "yappybirds.worlds.YappyBirdWorldEntity"

local YappyGame = {}
YappyGame.__index = YappyGame

local json = require('JSON')

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
  --TODO: Create and initialize properties...
  assert(type(init) == "table", "The init parameter must be of type table.")
  assert(init.gameInstance, "There must be a game instance inside of the init table.")

  -- self.gameInstance = init.gameInstance

  self._init = 
  {
    name = "name",
    states =
    {
      {
        name = "GameplayWorldEntityState",
        module = require "yappybirds.worlds.states.GameplayWorldEntityState"
      },
      {
        name = "MenuWorldEntityState",
        module = require "yappybirds.worlds.states.MenuWorldEntityState"
      },
      {
        name = "ResultsWorldEntityState",
        module = require "yappybirds.worlds.states.ResultsWorldEntityState"
      },
    },--end states

    startStateName = "MenuWorldEntityState",
    gameInstance = init.gameInstance
  }

  self:getGameInstance():getEntityManager():addWorldEntity(YappyBirdWorldEntity(self._init))
end

function YappyGame:__gc()
  --TODO: Destroy properties
end

function YappyGame:__tostring()
  --TODO: Represent the class as a string...
  return json.encode(self)
end

--TODO: List the Functions for YappyGame

function YappyGame:getGameInstance()
  return self._init.gameInstance
end

function YappyGame:start()
  local worldEntity = self:getGameInstance():getEntityManager():getWorldEntity("name")

  worldEntity:load()
  
  worldEntity:initialize()
end

return YappyGame
