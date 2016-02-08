
local isOn = function(self, behavior_type)
	return (bit.band(self.iFlags, behavior_type) == behavior_type)
end

local turnOn = function(self, behavior_type)
	self.iFlags = bit.bor(self.iFlags, behavior_type)
end

local turnOff = function(self, behavior_type)
	if self:isOn(behavior_type) then
		self.iFlags = bit.bxor(self.iFlags, behavior_type)
	end
end

local accumulateForce = function(self, runningTotal, forceToAdd)
	--calculate how much steering force the vehicle has used so far
	local magnitudeSoFar = runningTotal:length()

	--calculate how much steering force remains to be used by this vehicle
	local magnitudeRemaining = self.pVehicle:getMaxForce() - magnitudeSoFar

	--return false if there is no more force left to use
	if magnitudeRemaining <= 0.0 then
		return false, runningTotal
	end

	--calculate the magnitude of the force we want to add
	local magnitudeToAdd = forceToAdd:length()

	--if the magnitude of the sum of ForceToAdd and the running total
	--does not exceed the maximum force available to this vehicle, just
	--add together. Otherwise add as much of the ForceToAdd vector is
	--possible without going over the max.
	if magnitudeToAdd < magnitudeRemaining then
		runningTotal = runningTotal + forceToAdd
	end

	return true, runningTotal

end

local createFeelers = function(self)
	assert(false, "not implemented...")
end

--- This behavior moves the agent towards a target position
-- @param targetPos The position to seek to of type njli.btVector3
-- @return The normalized seek vector of type: njli.btVector3
local seek = function(self, targetPos)
	-- print("seek")
	local desiredVelocity = (targetPos - self.pVehicle:getPos())
	return desiredVelocity - self.pVehicle:getVelocity()
end

--- This behavior returns a vector that moves the agent away from a target position
-- @param targetPos The position to flee from of type njli.btVector3
-- @return The normalized flee vector of type: njli.btVector3
local flee = function(self, targetPos)
	-- print("flee")
	local desiredVelocity = (self.pVehicle:getPos() - targetPos)
	return desiredVelocity - self.pVehicle:getVelocity()
end

--- This behavior is similar to seek but it attempts to arrive 
--- at the target position with a zero velocity
-- @param targetPos The position to flee from of type njli.btVector3
-- @param deceleration Determine how quickly it should decelerate to it's target
-- @return The normalized arrive vector of type: njli.btVector3
local arrive = function(self, targetPos, deceleration)
	-- print("arrive")
	local toTarget = (targetPos - self.pVehicle:getPos())
	local dist = toTarget:length()

	if dist > 0.2 then

		local decelerationTweaker = 0.3

		local speed = dist / (deceleration * decelerationTweaker)
		speed = math.min(speed, self.pVehicle:getMaxSpeed())

		local desiredVelocity = toTarget * speed / dist

		return desiredVelocity - self.pVehicle:getVelocity()
	end
	
	return njli.btVector3(0,0,0)
end

--- This behavior predicts where an agent will be in time T and seeks
--- towards that point to intercept it.
-- @param evader The entity to pursue of type: MovingEntity
-- @return The normalized pursuit vector of type: njli.btVector3
local pursuit = function(self, evader)
	
	local toEvader = evader:getPos() - self.pVehicle:getPos()

	-- uncomment the following two lines to have Evade only consider pursuers 
	-- within a 'threat range'
	local threatRange = 100.0
	if toEvader:length2() > (threatRange * threatRange) then
		return njli.btVector3(0, 0, 0)
	end

	-- print("pursuit")

	local relativeHeading = self.pVehicle:getHeadingVector():dot(evader:getHeadingVector())

	--acos(0.95)=18 degs
	if toEvader:dot(self.pVehicle:getHeadingVector()) > 0 and relativeHeading < -0.95 then
		return self:seek(evader:getPos())
	end

	local lookAheadTime = toEvader:length() / (self.pVehicle:getMaxSpeed() * evader:getSpeed())

	return self:seek(evader:getPos() + evader:getVelocity() * lookAheadTime)
end

--- This behavior maintains a position, in the direction of offset
--- from the target vehicle.
-- @param leader The entity to pursue of type: MovingEntity
-- @param offset The offset position of type: njli.btVector3
-- @return The normalized offsetPursuit vector of type: njli.btVector3
local offsetPursuit = function(self, leader, offset)

	local offsetTransform = njli.btTransform(njli.btTransform.getIdentity())
	offsetTransform:setOrigin(offset)
	offsetTransform = offsetTransform * leader.node:getWorldTransform()

	local worldOffset = offsetTransform:getOrigin()
	local toOffset = worldOffset - self.pVehicle:getPos()

	-- uncomment the following two lines to have Evade only consider pursuers 
	-- within a 'threat range'
	local threatRange = 100.0
	if toOffset:length2() > (threatRange * threatRange) then
		return njli.btVector3(0, 0, 0)
	end

	local lookAheadTime = toOffset:length() / (self.pVehicle:getMaxSpeed() + leader:getSpeed())

	return self:arrive(worldOffset + leader:getVelocity() * lookAheadTime, self.Deceleration.fast)
end

--- This behavior attempts to evade a pursuer
-- @param pursuer The entity to evade of type: MovingEntity
-- @return The normalized evade vector of type: njli.btVector3
local evade = function(self, pursuer)
	
	local toPursuer = pursuer:getPos() - self.pVehicle:getPos()

	-- uncomment the following two lines to have Evade only consider pursuers 
	-- within a 'threat range'
	local threatRange = 20.0
	if toPursuer:length2() > (threatRange * threatRange) then
		return njli.btVector3(0, 0, 0)
	end

	-- print("evade")

	-- the lookahead time is propotional to the distance between the pursuer
	-- and the pursuer; and is inversely proportional to the sum of the
	-- agents' velocities
	local lookAheadTime = toPursuer:length() / (self.pVehicle:getMaxSpeed() + pursuer:getSpeed())

	return self:flee(pursuer:getPos() + pursuer:getVelocity() * lookAheadTime)
end

--- This behavior makes the agent wander about randomly
-- @return The normalized wander vector of type: njli.btVector3
local wander = function(self)
	assert(false, "not implemented...")
end

--- This returns a steering force which will attempt to keep the agent 
--- away from any obstacles it may encounter
-- @param nodes The nodes to avoid of type: Array of njli.Node
-- @return The normalized obstacle avoidance vector of type: njli.btVector3  
local obstacleAvoidance = function(self, nodes)
	assert(false, "not implemented...")
end

--- Given a series of Vector2Ds, this method produces a force that will
--- move the agent along the waypoints in order
-- @return The normalized followPath vector of type: njli.btVector3  
local followPath = function(self, pathToFollow, deceleration)
	-- print("followPath")
	if pathToFollow:currentWaypoint() ~= nil then
		if pathToFollow:currentWaypoint():distance2(self.pVehicle:getPos()) < self.dWaypointSeekDistSq then
			pathToFollow:setNextWaypoint()
		end

		-- return self:arrive(pathToFollow:currentWaypoint(), deceleration)
		if not pathToFollow:isFinished() then
			return self:seek(pathToFollow:currentWaypoint())
		end
		return self:arrive(pathToFollow:currentWaypoint(), deceleration)
	end

	return njli.btVector3(0, 0, 0)
end

--- This results in a steering force that attempts to steer the vehicle
--- to the center of the vector connecting two moving agents.
-- @param movingEntityA One of the entities to interpose between of type: MovingEntity
-- @param movingEntityA One of the entities to interpose between of type: MovingEntity 
-- @return The normalized interpose vector of type: njli.btVector3
local interpose = function(self, movingEntityA, movingEntityB)
	assert(false, "not implemented...")
end

--- Given another agent position to hide from and a list of BaseGameEntitys this
--- method attempts to put an obstacle between itself and its opponent
-- @param hunter The hunter to hide from of type: MovingEntity
-- @param obstacles The obstacles to use to hide of type: Array of njli.Node 
-- @return The normalized hide vector of type: njli.btVector3
local hide = function(self, hunter, obstacles)
	assert(false, "not implemented...")
end

--- This returns a steering force that will keep the agent away from any
--- walls it may encounter
-- @param walls The walls to avoid: Array of njli.Node
-- @return The normalized wallAvoidance vector of type: njli.btVector3
local wallAvoidance = function(self, walls)
	assert(false, "not implemented...")
end

   -- Group Behaviors --

local cohesion = function(self, movingEntities)
	assert(false, "not implemented...")
end
  
local separation = function(self, neighbors)
	local steeringForce = njli.btVector3(0, 0, 0)

	for i=1,#neighbors do
		if neighbors[i].node ~= self.pVehicle.node and neighbors[i].movingEntity:isTagged() then
			local toAgent = self.pVehicle:getPos() - neighbors[i].movingEntity:getPos()

			local force = toAgent:normalized() / toAgent:length()
			steeringForce = steeringForce + force
		end
	end

	return steeringForce
end

local alignment = function(self, movingEntities)
	assert(false, "not implemented...")
end

local cohesionPlus = function(self, movingEntities)
	assert(false, "not implemented...")
end
  
local separationPlus = function(self, movingEntities)
	assert(false, "not implemented...")
end

local alignmentPlus = function(self, movingEntities)
	assert(false, "not implemented...")
end

local calculateWeightedSum = function(self)
	-- print(string.format("self.vSteeringForce\t\t%s", self.vSteeringForce))

	if self:isOn(self.BehaviorType.seek) then
		self.vSteeringForce = self.vSteeringForce + self:seek(self.seekPosition) * self.dWeightSeek
	end

	if self:isOn(self.BehaviorType.flee) then
		self.vSteeringForce = self.vSteeringForce + self:flee(self.fleePosition) * self.dWeightFlee
	end

	if self:isOn(self.BehaviorType.arrive) then
		self.vSteeringForce = self.vSteeringForce + self:arrive(self.arrivePosition, self.deceleration) * self.dWeightArrive
	end

	if self:isOn(self.BehaviorType.wander) then
		self.vSteeringForce = self.vSteeringForce + self:wander() * self.dWeightWander
	end

	if not self:isSpacePartitioningOn() then
		if self:isOn(self.BehaviorType.cohesion) then
			self.vSteeringForce = self.vSteeringForce + self:cohesion(self.cohesionMovingEntities) * self.dWeightCohesion
		end

		if self:isOn(self.BehaviorType.separation) then
			self.vSteeringForce = self.vSteeringForce + self:separation(self.separationMovingEntities) * self.dWeightSeparation
		end

		if self:isOn(self.BehaviorType.alignment) then
			self.vSteeringForce = self.vSteeringForce + self:alignment(self.alignmentMovingEntities) * self.dWeightAlignment
		end
	else
		if self:isOn(self.BehaviorType.cohesion) then
			self.vSteeringForce = self.vSteeringForce + self:cohesionPlus(self.cohesionMovingEntities) * self.dWeightCohesion
		end

		if self:isOn(self.BehaviorType.separation) then
			self.vSteeringForce = self.vSteeringForce + self:separationPlus(self.separationMovingEntities) * self.dWeightSeparation
		end

		if self:isOn(self.BehaviorType.alignment) then
			self.vSteeringForce = self.vSteeringForce + self:alignmentPlus(self.alignmentMovingEntities) * self.dWeightAlignment
		end
	end

	if self:isOn(self.BehaviorType.obstacleAvoidance) then
		self.vSteeringForce = self.vSteeringForce + self:obstacleAvoidance(self.obstaclesToAvoid) * self.dWeightObstacleAvoidance
	end

	if self:isOn(self.BehaviorType.wallAvoidance) then
		self.vSteeringForce = self.vSteeringForce + self:wallAvoidance(self.wallsToAvoid) * self.dWeightWallAvoidance
	end

	if self:isOn(self.BehaviorType.followPath) then
		self.vSteeringForce = self.vSteeringForce + self:followPath(self.pathToFollow, self.deceleration) * self.dWeightFollowPath
	end

	if self:isOn(self.BehaviorType.pursuit) then
		self.vSteeringForce = self.vSteeringForce + self:pursuit(self.pursuitTarget) * self.dWeightPursuit
	end

	if self:isOn(self.BehaviorType.evade) then
		self.vSteeringForce = self.vSteeringForce + self:evade(self.evadeTarget) * self.dWeightEvade
	end

	if self:isOn(self.BehaviorType.interpose) then
		self.vSteeringForce = self.vSteeringForce + self:interpose(self.interposeEntityA, self.interposeEntityB) * self.dWeightInterpose
	end

	if self:isOn(self.BehaviorType.hide) then
		self.vSteeringForce = self.vSteeringForce + self:hide(self.hunterToHideFrom, self.hideObstacles) * self.dWeightHide
	end

	if self:isOn(self.BehaviorType.offsetPursuit) then
		self.vSteeringForce = self.vSteeringForce + self:offsetPursuit(self.offsetPursueTarget, self.offsetPursuePosition) * self.dWeightOffsetPursuit
	end

	self.vSteeringForce = Truncate(self.vSteeringForce, self.pVehicle:getMaxForce())

	-- print(string.format("self.vSteeringForce\t\t%s\n", self.vSteeringForce))
	return self.vSteeringForce
end

local calculatePrioritized = function(self)

	assert(false, "not implemented...")

end

local calculateDithered = function(self)

	assert(false, "not implemented...")
end

--- Helper method for Hide. Returns a position located on the other
--- side of an obstacle to the pursuer
-- @param posOb type: njli.btVector3  
-- @param radiusOb type: number
-- @param posHunter type: njli.btVector3  
-- @return The normalized hide vector of type: njli.btVector3
local getHidingPosition = function(self, posOb, radiusOb, posHunter)
	assert(false, "not implemented...")
end













-- #####################################################################
-- Public Functions
-- #####################################################################

--- Calculates and sums the steering forces from any active behaviors
-- @return The calculated steering vector of type: njli.btVector3
local calculate = function(self)
	self.vSteeringForce = njli.btVector3(0, 0, 0)

	if self:isSpacePartitioningOn() then
		if self:isSeparationOn() or self:isAlignmentOn() or self:isCohesionOn() then
			-- m_pVehicle->World()->TagVehiclesWithinViewRange(m_pVehicle, m_dViewDistance);
			assert(false, "not implemented...")
		end
	else
		if self:isSeparationOn() or self:isAlignmentOn() or self:isCohesionOn() then
			-- m_pVehicle->World()->CellSpace()->CalculateNeighbors(m_pVehicle->Pos(), m_dViewDistance);
			-- assert(false, "not implemented...")
		end
	end

	if self.summingMethod == self.SummingMethod.weightedAverage then
		self.vSteeringForce = self:calculateWeightedSum()
	elseif self.summingMethod == self.SummingMethod.prioritized then
		self.vSteeringForce = self:calculatePrioritized()
	elseif self.summingMethod == self.SummingMethod.dithered then
		self.vSteeringForce = self:calculateDithered()
	else
		self.vSteeringForce = njli.btVector3(0, 0, 0)
	end

	return self.vSteeringForce
end

--- Calculates the component of the steering force that is parallel
--- with the vehicle heading
-- @return The forward component of type: number
local forwardComponent = function(self)
	assert(false, "not implemented...")
end

--- Calculates the component of the steering force that is perpendicuar
--- with the vehicle heading
-- @return The side hide vector of type: number
local sideComponent = function(self)
	assert(false, "not implemented...")
end

-- local setTarget = function(self, targetPosition)
-- 	assert(false, "not implemented...")
-- end

-- local setTargetAgent1 = function(self, movingEntity)
-- 	assert(false, "not implemented...")
-- end

-- local setTargetAgent2 = function(self, movingEntity)
-- 	assert(false, "not implemented...")
-- end

-- local setOffset = function(self, offsetPosition)
-- 	assert(false, "not implemented...")
-- end

-- local getOffset = function(self)
-- 	assert(false, "not implemented...")
-- end

local getForce = function(self)
	return self.vSteeringForce
end

local toggleSpacePartitioningOnOff = function(self)
	self.bCellSpaceOn = not self.bCellSpaceOn
end

local isSpacePartitioningOn = function(self)
	return self.bCellSpaceOn
end

local setSummingMethod = function(self, summing_method)
	self.summingMethod = summing_method
end


















local setFleeOn = function(self, fleePosition)
	self:turnOn(self.BehaviorType.flee)

	if fleePosition ~= nil then
		self.fleePosition = fleePosition
	end
end

local setSeekOn = function(self, seekPosition)
	self:turnOn(self.BehaviorType.seek)

	if seekPosition ~= nil then
		self.seekPosition = seekPosition
	end
end

local setArriveOn = function(self, arrivePosition, deceleration)
	self:turnOn(self.BehaviorType.arrive)

	if arrivePosition ~= nil then
		self.arrivePosition = arrivePosition
	end
	
	if deceleration ~= nil then
		self.deceleration = deceleration
	end
end

local setWanderOn = function(self)
	self:turnOn(self.BehaviorType.wander)
end

local setPursuitOn = function(self, pursuitTarget)
	self:turnOn(self.BehaviorType.pursuit)
	
	if pursuitTarget ~= nil then
		self.pursuitTarget = pursuitTarget
	end
end

local setEvadeOn = function(self, evadeTarget)
	self:turnOn(self.BehaviorType.evade)
	
	if evadeTarget ~= nil then
		self.evadeTarget = evadeTarget
	end
end

local setCohesionOn = function(self, cohesionMovingEntities)
	self:turnOn(self.BehaviorType.cohesion)
	
	if cohesionMovingEntities ~= nil then
		self.cohesionMovingEntities = cohesionMovingEntities
	end
end

local setSeparationOn = function(self, separationMovingEntities)
	self:turnOn(self.BehaviorType.separation)
	
	if separationMovingEntities ~= nil then
		self.separationMovingEntities = separationMovingEntities
	end
end

local setAlignmentOn = function(self, alignmentMovingEntities)
	self:turnOn(self.BehaviorType.alignment)
	
	if alignmentMovingEntities ~= nil then
		self.alignmentMovingEntities = alignmentMovingEntities
	end
end

local setObstacleAvoidanceOn = function(self, obstaclesToAvoid)
	self:turnOn(self.BehaviorType.obstacleAvoidance)
	
	if obstaclesToAvoid ~= nil then
		self.obstaclesToAvoid = obstaclesToAvoid
	end
end

local setWallAvoidanceOn = function(self, wallsToAvoid)
	self:turnOn(self.BehaviorType.wallAvoidance)
	
	if wallsToAvoid ~= nil then
		self.wallsToAvoid = wallsToAvoid
	end
end

local setFollowPathOn = function(self, pathToFollow, deceleration)
	self:turnOn(self.BehaviorType.followPath)
	
	if pathToFollow ~= nil then
		self.pathToFollow = pathToFollow
	end

	if deceleration ~= nil then
		self.deceleration = deceleration
	end
end

local setInterposeOn = function(self, interposeEntityA, interposeEntityB)
	self:turnOn(self.BehaviorType.interpose)
	
	if interposeEntityA ~= nil then
		self.interposeEntityA = interposeEntityA
	end
	
	if interposeEntityB ~= nil then
		self.interposeEntityB = interposeEntityB
	end
end

local setHideOn = function(self, hunterToHideFrom, hideObstacles)
	self:turnOn(self.BehaviorType.hide)
	
	if hunterToHideFrom ~= nil then
		self.hunterToHideFrom = hunterToHideFrom
	end
	
	if hideObstacles ~= nil then
		self.hideObstacles = hideObstacles
	end
end

local setOffsetPursuitOn = function(self, offsetPursueTarget, offsetPursuePosition)
	self:turnOn(self.BehaviorType.offsetPursuit)
	
	if offsetPursueTarget ~= nil then
		self.offsetPursueTarget = offsetPursueTarget
	end
	
	if offsetPursuePosition ~= nil then
		self.offsetPursuePosition = offsetPursuePosition
	end
end

local setFlockingOn = function(self)
	self:setCohesionOn()
	self:setAlignmentOn()
	self:setSeparationOn()
end

local setFleeOff = function(self)
	self:turnOff(self.BehaviorType.flee)
end

local setSeekOff = function(self)
	self:turnOff(self.BehaviorType.seek)
end

local setArriveOff = function(self)
	self:turnOff(self.BehaviorType.arrive)
end

local setWanderOff = function(self)
	self:turnOff(self.BehaviorType.wander)
end

local setPursuitOff = function(self)
	self:turnOff(self.BehaviorType.pursuit)
end

local setEvadeOff = function(self)
	self:turnOff(self.BehaviorType.evade)
end

local setCohesionOff = function(self)
	self:turnOff(self.BehaviorType.cohesion)
end

local setSeparationOff = function(self)
	self:turnOff(self.BehaviorType.separation)
end

local setAlignmentOff = function(self)
	self:turnOff(self.BehaviorType.alignment)
end

local setObstacleAvoidanceOff = function(self)
	self:turnOff(self.BehaviorType.obstacleAvoidance)
end

local setWallAvoidanceOff = function(self)
	self:turnOff(self.BehaviorType.wallAvoidance)
end

local setFollowPathOff = function(self)
	self:turnOff(self.BehaviorType.followPath)
end

local setInterposeOff = function(self)
	self:turnOff(self.BehaviorType.interpose)
end

local setHideOff = function(self)
	self:turnOff(self.BehaviorType.hide)
end

local setOffsetPursuitOff = function(self)
	self:turnOff(self.BehaviorType.offsetPursuit)
end

local setFlockingOff = function(self)
	self:setCohesionOff()
	self:setAlignmentOff()
	self:setSeparationOff()
end

local isFleeOn = function(self)
	return self:isOn(self.BehaviorType.flee)
end

local isSeekOn = function(self)
	return self:isOn(self.BehaviorType.seek)
end

local isArriveOn = function(self)
	return self:isOn(self.BehaviorType.arrive)
end

local isWanderOn = function(self)
	return self:isOn(self.BehaviorType.wander)
end

local isPursuitOn = function(self)
	return self:isOn(self.BehaviorType.pursuit)
end

local isEvadeOn = function(self)
	return self:isOn(self.BehaviorType.evade)
end

local isCohesionOn = function(self)
	return self:isOn(self.BehaviorType.cohesion)
end

local isSeparationOn = function(self)
	return self:isOn(self.BehaviorType.separation)
end

local isAlignmentOn = function(self)
	return self:isOn(self.BehaviorType.alignment)
end

local isObstacleAvoidanceOn = function(self)
	return self:isOn(self.BehaviorType.obstacleAvoidance)
end

local isWallAvoidanceOn = function(self)
	return self:isOn(self.BehaviorType.wallAvoidance)
end

local isFollowPathOn = function(self)
	return self:isOn(self.BehaviorType.followPath)
end

local isInterposeOn = function(self)
	return self:isOn(self.BehaviorType.interpose)
end

local isHideOn = function(self)
	return self:isOn(self.BehaviorType.hide)
end

local isOffsetPursuitOn = function(self)
	return self:isOn(self.BehaviorType.offsetPursuit)
end



local dBoxLength = function(self)
	assert(false, "not implemented...")
end

local getFeelers = function(self)
	assert(false, "not implemented...")
end

local wanderJitter = function(self)
	assert(false, "not implemented...")
end

local wanderDistance = function(self)
	assert(false, "not implemented...")
end

local wanderRadius = function(self)
	assert(false, "not implemented...")
end

local separationWeight = function(self)
	assert(false, "not implemented...")
end

local alignmentWeight = function(self)
	assert(false, "not implemented...")
end

local cohesionWeight = function(self)
	assert(false, "not implemented...")
end

local addSeparationEntity = function(self, movingEntity)
	self:removeSeparationEntity(movingEntity)

	table.insert(self.separationMovingEntities, movingEntity)
end

local removeSeparationEntity = function(self, movingEntity)
	local pos = self.separationMovingEntities[movingEntity]

	if pos ~= nil then
		table.remove(self.separationMovingEntities, pos)
	end
end



local delete = function(self)
    --TODO: clean up memory
end

local methods = 
{
    --TODO: Add functions here...

    isOn = isOn,
    turnOn = turnOn,
    turnOff = turnOff, 

    accumulateForce = accumulateForce,
    createFeelers = createFeelers,
    seek = seek,
    flee = flee,
    arrive = arrive,
    pursuit = pursuit,
    offsetPursuit = offsetPursuit,
    evade = evade,
    wander = wander,
    obstacleAvoidance = obstacleAvoidance,
    followPath = followPath,
    interpose = interpose,
    hide = hide,
    wallAvoidance = wallAvoidance,
    cohesion = cohesion,
    separation = separation,
    alignment = alignment,
    cohesionPlus = cohesionPlus,
    separationPlus = separationPlus,
    alignmentPlus = alignmentPlus,
    calculateWeightedSum = calculateWeightedSum,
    calculatePrioritized = calculatePrioritized,
    calculateDithered = calculateDithered,
    getHidingPosition = getHidingPosition,
    calculate = calculate,
    forwardComponent = forwardComponent,
    sideComponent = sideComponent,
    -- setTarget = setTarget,
    -- setTargetAgent1 = setTargetAgent1,
    -- setTargetAgent2 = setTargetAgent2,
    -- setOffset = setOffset,
    -- getOffset = getOffset,
    getForce = getForce,
    toggleSpacePartitioningOnOff = toggleSpacePartitioningOnOff,
    isSpacePartitioningOn = isSpacePartitioningOn,
    setSummingMethod = setSummingMethod,

    setFleeOn = setFleeOn,
    setSeekOn = setSeekOn,
    setArriveOn = setArriveOn,
    setWanderOn = setWanderOn,
    setPursuitOn = setPursuitOn,
    setEvadeOn = setEvadeOn,
    setCohesionOn = setCohesionOn,
    setSeparationOn = setSeparationOn,
    setAlignmentOn = setAlignmentOn,
    setObstacleAvoidanceOn = setObstacleAvoidanceOn,
    setWallAvoidanceOn = setWallAvoidanceOn,
    setFollowPathOn = setFollowPathOn,
    setInterposeOn = setInterposeOn,
    setHideOn = setHideOn,
    setOffsetPursuitOn = setOffsetPursuitOn,

    setFlockingOn = setFlockingOn,
    setFleeOff = setFleeOff,
    setSeekOff = setSeekOff,
    setArriveOff = setArriveOff,
    setWanderOff = setWanderOff,
    setPursuitOff = setPursuitOff,
    setEvadeOff = setEvadeOff,
    setCohesionOff = setCohesionOff,
    setSeparationOff = setSeparationOff,
    setAlignmentOff = setAlignmentOff,
    setObstacleAvoidanceOff = setObstacleAvoidanceOff,
    setWallAvoidanceOff = setWallAvoidanceOff,
    setFollowPathOff = setFollowPathOff,
    setInterposeOff = setInterposeOff,
    setHideOff = setHideOff,
    setOffsetPursuitOff = setOffsetPursuitOff,
    setFlockingOff = setFlockingOff,

    isFleeOn = isFleeOn,
    isSeekOn = isSeekOn,
    isArriveOn = isArriveOn,
    isWanderOn = isWanderOn,
    isPursuitOn = isPursuitOn,
    isEvadeOn = isEvadeOn,
    isCohesionOn = isCohesionOn,
    isSeparationOn = isSeparationOn,
    isAlignmentOn = isAlignmentOn,
    isObstacleAvoidanceOn = isObstacleAvoidanceOn,
    isWallAvoidanceOn = isWallAvoidanceOn,
    isFollowPathOn = isFollowPathOn,
    isInterposeOn = isInterposeOn,
    isHideOn = isHideOn,
    isOffsetPursuitOn = isOffsetPursuitOn,

    dBoxLength = dBoxLength,
    getFeelers = getFeelers,
    wanderJitter = wanderJitter,
    wanderDistance = wanderDistance,
    wanderRadius = wanderRadius,
    separationWeight = separationWeight,
    alignmentWeight = alignmentWeight,
    cohesionWeight = cohesionWeight,

    __gc = delete
}

local new = function(movingEntity)
    --TODO: Implement the constructor for this object.

    njli.World.getInstance():getWorldLuaVirtualMachine():getMinNumber()

    local assetPath = njli.ASSET_PATH("scripts/steering/Params.lua")
    -- print(assetPath)
    local Prm = loadfile(assetPath)()

    local BehaviorType =
    {
	    none               = (0x00000),
	    seek               = (0x00002),
	    flee               = (0x00004),
	    arrive             = (0x00008),
	    wander             = (0x00010),
	    cohesion           = (0x00020),
	    separation         = (0x00040),
	    alignment          = (0x00080),
	    obstacleAvoidance  = (0x00100),
	    wallAvoidance      = (0x00200),
	    followPath         = (0x00400),
	    pursuit            = (0x00800),
	    evade              = (0x01000),
	    interpose          = (0x02000),
	    hide               = (0x04000),
	    flock              = (0x08000),
	    offsetPursuit      = (0x10000)
	}

	local Deceleration = 
	{
		slow = 3, 
		normal = 2, 
		fast = 1
	}

	local SummingMethod = 
	{
		weightedAverage = 0, 
		prioritized = 1, 
		dithered = 2
	}


	--the steering force created by the combined effect of all
	--the selected behaviors
	local vSteeringForce = njli.btVector3(0, 0, 0)
	-- local targetAgent1 = nil
	-- local targetAgent2 = nil
	-- local target = njli.btVector3(0, 0, 0)
	local dDBoxLength = Prm.MinDetectionBoxLength
	local feelers = {}
	local dWallDetectionFeelerLength = Prm.WallDetectionFeelerLength

	local dWanderRadius = Prm.WanderRad
	local vWanderTarget = njli.btVector3(0.0, 0.0, -1.0)

	local dWanderJitter = Prm.WanderJitterPerSec
	
	local dWanderDistance = Prm.WanderDist
	local dWeightSeparation = Prm.SeparationWeight
	local dWeightCohesion = Prm.CohesionWeight
	local dWeightAlignment = Prm.AlignmentWeight
	local dWeightWander = Prm.WanderWeight
	local dWeightObstacleAvoidance = Prm.ObstacleAvoidanceWeight
	local dWeightWallAvoidance = Prm.WallAvoidanceWeight
	local dWeightSeek = Prm.SeekWeight
	local dWeightFlee = Prm.FleeWeight
	local dWeightArrive = Prm.ArriveWeight
	local dWeightPursuit = Prm.PursuitWeight
	local dWeightOffsetPursuit = Prm.OffsetPursuitWeight
	local dWeightInterpose = Prm.InterposeWeight
	local dWeightHide = Prm.HideWeight
	local dWeightEvade = Prm.EvadeWeight
	local dWeightFollowPath = Prm.FollowPathWeight
	local dViewDistance = Prm.ViewDistance
	local dWaypointSeekDistSq = (Prm.WaypointSeekDist * Prm.WaypointSeekDist)
	local iFlags = BehaviorType.none

	local bCellSpaceOn = false
	local summingMethod = SummingMethod.weightedAverage

    local properties = 
    {
        --TODO: Add variables here...
        Prm = Prm,
        BehaviorType = BehaviorType,
        Deceleration = Deceleration,
        SummingMethod = SummingMethod,

        pVehicle = movingEntity,
        vSteeringForce = vSteeringForce,
        -- targetAgent1 = targetAgent1,
        -- targetAgent2 = targetAgent2,
        target = target,
        dDBoxLength = dDBoxLength,
        feelers = feelers,
        dWallDetectionFeelerLength = dWallDetectionFeelerLength,
        vWanderTarget = vWanderTarget,
        dWanderJitter = dWanderJitter,
        dWanderRadius = dWanderRadius,
        dWanderDistance = m_dWanderDistance,
        dWeightSeparation = dWeightSeparation,
        dWeightCohesion = dWeightCohesion,
        dWeightAlignment = dWeightAlignment,
        dWeightWander = dWeightWander,
        dWeightObstacleAvoidance = dWeightObstacleAvoidance,
        dWeightWallAvoidance = dWeightWallAvoidance,
        dWeightSeek = dWeightSeek,
        dWeightFlee = dWeightFlee,
        dWeightArrive = dWeightArrive,
        dWeightPursuit = dWeightPursuit,
        dWeightOffsetPursuit = dWeightOffsetPursuit,
        dWeightInterpose = dWeightInterpose,
        dWeightHide = dWeightHide,
        dWeightEvade = dWeightEvade,
        dWeightFollowPath = dWeightFollowPath,
        dViewDistance = dViewDistance,
        dWaypointSeekDistSq = dWaypointSeekDistSq,
        iFlags = iFlags,

        bCellSpaceOn = bCellSpaceOn,
        summingMethod = summingMethod,


        seekPosition = movingEntity:getPos(),
        fleePosition = movingEntity:getPos(),
        arrivePosition = movingEntity:getPos(),
        deceleration = Deceleration.normal,
        obstaclesToAvoid = {},
        pathToFollow = {},
        pursuitTarget = movingEntity,
        evadeTarget = movingEntity,

        cohesionMovingEntities = {},
        separationMovingEntities = {},
		alignmentMovingEntities = {},

		interposeEntityA = interposeEntityA,
		interposeEntityB = interposeEntityB,

		hunterToHideFrom = movingEntity,
		hideObstacles = {},

		offsetPursueTarget = movingEntity,
		offsetPursuePosition = njli.btVector3(0, 0, 0),
		wallsToAvoid = {}
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}