Interface = require "NJLI.InterfaceFunctions"

local MyGame = require "YAPPYBIRDS.YappyGame"

local BalloonNodeEntity =
{
    name = "Balloon",
  class = require "YAPPYBIRDS.NODES.BALLOON.Balloon",
  --The first state is the start state.
  states =
  {
      {
          class = require "YAPPYBIRDS.NODES.BALLOON.STATES.Spawn",
          name = "BalloonSpawn"
      },
      {
          class = require "YAPPYBIRDS.NODES.BALLOON.STATES.Lob",
          name = "BalloonLob"
      },
      {
          class = require "YAPPYBIRDS.NODES.BALLOON.STATES.Hit",
          name = "BalloonHit"
      },
  },
  nodes = {} --The childen Nodes for the Node.
}

local BirdBeakNodeEntity =
{
    name = "BirdBeak",
  class = require "YAPPYBIRDS.NODES.BIRDBEAK.BirdBeak",
  --The first state is the start state.
  states =
  {
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Idle",
          name = "BirdBeakIdle"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Grab",
          name = "BirdBeakGrab"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Hit",
          name = "BirdBeakHit"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRDBEAK.STATES.Yap",
          name = "BirdBeakYap"
      },
  },
  nodes = {} --The childen Nodes for the Node.
}

local BirdNodeEntity =
{
    name = "Bird",
  class = require "YAPPYBIRDS.NODES.BIRD.Bird",
  --The first state is the start state.
  states =
  {
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Spawn",
          name = "BirdSpawn"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Fly",
          name = "BirdFly",
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Grabbed",
          name = "BirdGrabbed"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Grabbing",
          name = "BirdGrabbing"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Hit",
          name = "BirdHit"
      },
      {
          class = require "YAPPYBIRDS.NODES.BIRD.STATES.Pursue",
          name = "BirdPursue"
      }
  },
  nodes = {
    BirdBeakNodeEntity,
  } --The childe Nodes for the Node.
}

local MenuScene =
{
    name = "MenuScene",
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.MENU.Menu",
  --The first state is the start state.
  states =
  {
    {
        name = "MenuLoadingScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuAboutScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.About",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuAchievementsScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Achievements",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuBoardSelectScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.BoardSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuCharactersScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Characters",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuHighScoresScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.HighScores",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuLeaderboardsScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Leaderboards",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuLevelSelectScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.LevelSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuMainMenuScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.MainMenu",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuModeSelectScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.ModeSelect",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "MenuSettingsScene",
      class = require "YAPPYBIRDS.SCENES.MENU.STATES.Settings",
      nodes = {}, --The nodes for the SceneState.
    }
  },
  nodes = {} --The nodes for the Scene.
}

local GameplayScene =
{
    name = "GameplayScene",
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.GAMEPLAY.Gameplay",
  --The first state is the start state.
  states =
  {
    {
        name = "GameplayLoadingScene",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Loading",
      nodes = {} --The nodes for the SceneState.
    },
    {
        name = "GameplayLoseScene",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Lose",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "GameplayPauseScene",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Pause",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "GameplayPlayingScene",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Playing",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "GameplayWinScene",
      class = require "YAPPYBIRDS.SCENES.GAMEPLAY.STATES.Win",
      nodes = {}, --The nodes for the SceneState.
    },
  },
  nodes = {
      BalloonNodeEntity,
      BirdNodeEntity,
    }
 --The nodes for the Scene.
}

local ResultsScene =
{
    name = "ResultsScene",
  entityOwner = nil,
  class = require "YAPPYBIRDS.SCENES.RESULTS.Results",
  --The first state is the start state.
  states =
  {
    {
        name = "ResultsLoadingScene",
      class = require "YAPPYBIRDS.SCENES.RESULTS.STATES.Loading",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "ResultsLoseScene",
      class = require "YAPPYBIRDS.SCENES.RESULTS.STATES.Lose",
      nodes = {}, --The nodes for the SceneState.
    },
    {
        name = "ResultsWinScene",
      class = require "YAPPYBIRDS.SCENES.RESULTS.STATES.Win",
      nodes = {}, --The nodes for the SceneState.
    },
  },
  nodes = {} --The nodes for the Scene.
}

local Worlds =
{
  yappygame =
  {
      name = "YappyBirds",
    class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.YappyBirdWorldEntity",
    states =
    {
      --The first state is the start state.
--      {
--        name = "WorldMenu",
--        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Menu",
--        scene = MenuScene
--      },
      {
          name = "WorldGameplay",
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Gameplay",
        scene = GameplayScene
      },
      {
          name = "WorldResults",
        class = require "YAPPYBIRDS.WORLDS.YAPPYBIRDS.STATES.Results",
        scene = ResultsScene
      },
    }
  }
}

mygame = MyGame(Worlds.yappygame)
mygame:startStateMachine()

