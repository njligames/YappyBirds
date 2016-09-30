Interface = require "NJLI.InterfaceFunctions"

local MyGame = require "YAPPYBIRDS.YappyGame"

local MenuNodes =
{
  entityOwner = nil,
}

local GameplayNodes =
{
  entityOwner = nil,
  {
    class = require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.Balloon",
    --The first state is the start state.
    states =
    {
      require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.STATES.Spawn",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.STATES.Lob",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.STATES.Hit",
    }
  },
  {
    class = require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.Bird",
    --The first state is the start state.
    states =
    {
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Spawn",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Fly",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Grabbed",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Grabbing",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Hit",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Pursue",
    }
  },
  {
    class = require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.BirdBeak",
    --The first state is the start state.
    states =
    {
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Idle",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Grab",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Hit",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Yap",
    }
  },
}

local ResultsNodes =
{
  entityOwner = nil,
}

local MenuScene =
{
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.MENU.Menu",
  --The first state is the start state.
  states =
  {
    require "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Lose",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Pause",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Playing",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Win",
  },
  nodes = MenuNodes
}

local GameplayScene =
{
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
  --The first state is the start state.
  states =
  {
    require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Loading",
    -- require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Lose",
    -- require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Pause",
    -- require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Playing",
    -- require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Win",
  },
  nodes = nil--GameplayNodes
}

local ResultsScene =
{
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.MENU.Menu",
  --The first state is the start state.
  states =
  {
    require "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
    require "YAPPYBIRDS.SCENES.MENU.STATES.About",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Achievements",
    require "YAPPYBIRDS.SCENES.MENU.STATES.BoardSelect",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Characters",
    require "YAPPYBIRDS.SCENES.MENU.STATES.HighScores",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Leaderboards",
    require "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect",
    require "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu",
    require "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect",
    require "YAPPYBIRDS.SCENES.MENU.STATES.Settings",
  },
  nodes = ResultsNodes
}

local Worlds =
{
  yappygame =
  {
    class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
    states =
    {
      --The first state is the start state.
      -- {
      --   class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Menu",
      --   scene = MenuScene,
      -- },
      {
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
        scene = GameplayScene,
      },
      -- {
      --   class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Results",
      --   scene = ResultsScene,
      -- },
    }
  }
}

mygame = MyGame(Worlds.yappygame)
mygame:startStateMachine()

-- local GameplayWorldEntity =
-- {
-- class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
-- states =
-- {
-- {
-- class =
-- }
-- }
-- }
-- mygame = MyGame({

-- world =
-- {
-- --set the world Entity
-- class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
-- states =
-- {
-- --List the worldEntityStates
-- --The first state is the start state.
-- {
-- class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
-- scene =
-- {
-- class = requre "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
-- states =
-- {
-- --List the sceneEntityStates
-- --The first state is the start state.
-- {
-- class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
-- scene =
-- {
-- class = requre "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
-- states =
-- {
-- --List the sceneEntityStates
-- --The first state is the start state.
-- {

-- },
-- }
-- }
-- }
-- }
-- },
-- },

-- sceneEntities =
-- {
-- class = require "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
-- states =
-- {
-- --The first state is the start state.
-- require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Loading",
-- },
-- nodeEntities =
-- {
-- {
-- class = require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.Bird",
-- states =
-- {
-- --The first state is the start state.
-- require "YAPPYBIRDS.NODES.GAMEPLAY.BIRD.STATES.Fly",
-- }
-- },
-- }

-- }
-- }
-- })

