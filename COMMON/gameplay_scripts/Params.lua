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
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (6 * 1000),
			StealSpeed = .1,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		garuBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (5 * 1000),
			StealSpeed = .2,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		momiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (4 * 1000),
			StealSpeed = .3,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		puffyBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (3 * 1000),
			StealSpeed = .4,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		weboBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (2 * 1000),
			StealSpeed = .5,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		zuruBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (1 * 1000),
			StealSpeed = .6,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		
	},
	Projectile = 
	{
		WaterBalloon =
		{
			Azimuth = 10,
			Magnitude = 45,
			DieY = -50,
		},
	},
}

return ParamInfo