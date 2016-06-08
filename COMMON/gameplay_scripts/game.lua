--worlds have worldstates
--worldstates have scenes
--scenes have scenestates
--scenestates have nodes
--nodes have nodestates

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

  self.gameInstance = init.gameInstance

  local YappyBirdWorldEntity = require "YappyBirdWorldEntity"
  self.yappyBirdWorldEntity = YappyBirdWorldEntity()

  self.yappyBirdWorldEntity:load()
end

function YappyGame:__gc()
  --TODO: Destroy properties
  self.yappyBirdWorldEntity:destroy()
end

function YappyGame:__tostring()
  --TODO: Represent the class as a string...
  -- return "YappyGame"
  return json.encode(self)
end

--TODO: List the Functions for YappyGame

function YappyGame:start()
  self.yappyBirdWorldEntity:initialize()
end

return YappyGame
