local isFinished = function(self)
end

local addArcadeSpawnPoint = function(self, spawnPoint)
	-- print("added spawn point...")
	local point = {}
	point.spawnPoint = spawnPoint
	point.currentTick = spawnPoint.timeFrequency

	table.insert(self.arcadeSpawnPoints, point)

	-- print_r(point)
end

local tick = function(self, timeStep, scene)
	self.totalTicks = self.totalTicks + timeStep

	for k,v in pairs(self.arcadeSpawnPoints) do
		-- print_r(self.arcadeSpawnPoints[k])

		if self.totalTicks > self.arcadeSpawnPoints[k].spawnPoint.timeStart then
			self.arcadeSpawnPoints[k].currentTick = self.arcadeSpawnPoints[k].currentTick - timeStep
			if self.arcadeSpawnPoints[k].currentTick <= 0 then
				-- print("spawn")
				if self.arcadeSpawnPoints[k].spawnPoint.spawnAmount > 0 then
					scene:createBirdNode(self.arcadeSpawnPoints[k].spawnPoint)

					self.arcadeSpawnPoints[k].spawnPoint.spawnAmount = self.arcadeSpawnPoints[k].spawnPoint.spawnAmount - 1
					self.arcadeSpawnPoints[k].currentTick = self.arcadeSpawnPoints[k].spawnPoint.timeFrequency
					if self.arcadeSpawnPoints[k].spawnPoint.spawnAmount <= 0 then
						table.remove(self.arcadeSpawnPoints, k)
					end
				end
			end
		end
	end
	-- print(#self.arcadeSpawnPoints)
end

local birdsKilled = function(self)
	return self.totalBirdsKilled
end

local killBird = function(self)
	self.totalBirdsKilled = self.totalBirdsKilled + 1
end

local killedAllBirds = function(self)
	return self.totalBirdsKilled >= self.numberBirdsToSpawn
end

local delete = function(self)
    --TODO: clean up memory
end

local methods = 
{
    --TODO: Add functions here...
    addArcadeSpawnPoint = addArcadeSpawnPoint,
    tick = tick,
    birdsKilled = birdsKilled,
    killBird = killBird,
    killedAllBirds = killedAllBirds,
    __gc = delete,
}

local new = function()
    --TODO: Implement the constructor for this object.

    local properties = 
    {
        --TODO: Add variables here...
        arcadeSpawnPoints = {},
        totalTicks = 0,
        totalBirdsKilled = 0,
        numberBirdsToSpawn = 0,
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}