









local ParamInfo = {}

ParamInfo =
{
 World =
 {
 Gravity = bullet.btVector3(0,-60.81,0),
 LayerDistance = 15.24, 
 LayerMax = 60.96, 
 WorldOffset = bullet.btVector2(1.0, 19.7),
 WorldScale = 91.0,

 
 
 },
	Projectile = 
	{
 WaterBalloon =
 {
 Azimuth = 10, 
 Magnitude = 45, 
 DieY = -50, 
 Mass = 1, 

 DeathVariables = {
 FramesPerSecond = 30.0, 
 ShowParticles = false,
 },
 FramesPerSecond = 30.0, 
 
 RelativeLargerScale = 0,
 RelativeSmallerScale = 0,
 Hues = {
 0,
 1,
 },
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
 
 ScalarVariableExample=0,
 ArrayVariableExample={
 Example1 = true,
 Example2 = "hello i'm string",
 Example3 = 1.0,
 Example4 = {
 AnotherVariable = 0
 },

 }
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
 },
 
	},
}

return ParamInfo
