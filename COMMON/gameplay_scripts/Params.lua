--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2b1f311020c071bdcbd0f79dc168406c:0dfdc75a0105a5197a0402fce265a34c:e5221e08a01648a6cecb05e53395f223$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local ParamInfo = {}

ParamInfo =
{
    World =
    {
        --Negative Y is down in the game
        Gravity = bullet.btVector3(0.0, -60.81, 0.0), --Only effects the balloon

        --Still have to make htese variables live...
        LayerDistance = 15.24, --meters (50 feet), How far each layer is from eachother
        LayerMax = 60.96, --meters (200 feet), How far the 4th (farthest) layer is from the camera
        WorldOffset = bullet.btVector2(1.0, 19.7),
        WorldScale = 91.0,
        --Entity  darker param by distance
    },
	Projectile = 
	{
		WaterBalloon =
		{
			Azimuth = 10, --Angle from the ground, up.
			Magnitude = 45, --How fast the balloon goes when you tap the screen.
			DieY = -50, --Y position for then the balloon cleans up the memory.
            Mass = 1, --The mass of the balloon.

            --Still have to make these variables live...
            FrameRate = 0, --How fast the balloon animates
            RelativeLargerScale = 0,
            RelativeSmallerScale = 0,
            Hues = {
                --A list of hues for the balloons. Number in the range from -180 to +180
            },
            DeathVariables =
            {
                FrameRate = 0,
                Particles = false,
            }

		},
	},
	Dog = 
	{
		MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
		MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),		
		DazedTime = (0.5 * 1000),
		CapturedHeight = 20,
	},
	Bird =
	{
		chubiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = 1,
            PursueTime = (6 * 1000),
			StealSpeed = 1,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
            --[[
            --DAvid add your variables here..

            variable1 = 0,
            variable2 = 0,

            ]]--
		},
		garuBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (5 * 1000),
			StealSpeed = 2,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		momiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (4 * 1000),
			StealSpeed = 3,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		puffyBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (3 * 1000),
			StealSpeed = 4,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		weboBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (2 * 1000),
			StealSpeed = 5,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		zuruBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (1 * 1000),
			StealSpeed = 6,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		}
	}
}

return ParamInfo
