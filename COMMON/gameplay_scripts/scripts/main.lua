Interface = require "NJLI.InterfaceFunctions"

local MyGame = require "YAPPYBIRDS.YappyGame"

local BalloonNodeEntity = 
{
    class = require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.Balloon",
    --The first state is the start state.
    states =
    {
      require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.STATES.Spawn",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.STATES.Lob",
      require "YAPPYBIRDS.NODES.GAMEPLAY.BALLOON.STATES.Hit",
    },
    nodes = {} --The childe Nodes for the Node.
}

local BirdBeakNodeEntity =
{
  class = require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.BirdBeak",
  --The first state is the start state.
  states =
  {
    require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Idle",
    require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Grab",
    require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Hit",
    require "YAPPYBIRDS.NODES.GAMEPLAY.BIRDBEAK.STATES.Yap",
  },
  nodes = {} --The childe Nodes for the Node.
}

local BirdNodeEntity = 
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
    },
    nodes = {
      BirdBeakNodeEntity,
    } --The childe Nodes for the Node.
  }

local MenuNodeEntityTable =
{
  entityOwner = nil,
  nodes = 
  {
    --TODO: Add NodeEntities
  }
}

local GameplayNodeEntityTable =
{
  entityOwner = nil,
  nodes = 
  {
    BalloonNodeEntity,
    BirdNodeEntity,
  }
}

local ResultNodeEntityTable =
{
  entityOwner = nil,
  nodes =
  {
    
  }
}

local MenuScene =
{
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.MENU.Menu",
  --The first state is the start state.
  states =
  {
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.About",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Achievements",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.BoardSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Characters",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.HighScores",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Leaderboards",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Settings",
      nodes = {}, --The nodes for the SceneState.
    }
  },
  nodes = MenuNodeEntityTable --The nodes for the Scene.
}

local GameplayScene =
{
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
  --The first state is the start state.
  states =
  {
    {
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Lose",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Pause",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Playing",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Win",
      nodes = {}, --The nodes for the SceneState.
    },
  },
  nodes = GameplayNodeEntityTable --The nodes for the Scene.
}

local ResultsScene =
{
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.MENU.Menu",
  --The first state is the start state.
  states =
  {
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.About",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Achievements",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.BoardSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Characters",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.HighScores",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Leaderboards",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Settings",
      nodes = {}, --The nodes for the SceneState.
    },
  },
  nodes = ResultNodeEntityTable  --The nodes for the Scene.
}

local Worlds =
{
  yappygame =
  {
    class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
    states =
    {
      --The first state is the start state.
      {
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Menu",
        scene = MenuScene,
        nodes = {}, --The nodes for the worldstate.
      },
      {
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
        scene = GameplayScene,
        nodes = {}, --The nodes for the worldstate.
      },
      {
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Results",
        scene = ResultsScene,
        nodes = {}, --The nodes for the worldstate.
      },
    },
    nodes = {}, --The nodes for the world.
  }
}

mygame = MyGame(Worlds.yappygame)
mygame:startStateMachine()

