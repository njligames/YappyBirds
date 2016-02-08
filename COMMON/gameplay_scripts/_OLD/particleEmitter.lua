



local start = function(self)
	self.params.user.active = true
end

local stop = function(self)
	self.params.user.active = false
	self.params.user.elapsedTime = 0
	self.params.user.emitCount = 0
end

local reset = function(self)
	self.params.user.active = false
	self.params.user.elapsedTime = 0
	for i=1,self.params.user.particleCount do
		self.particles[i].timeToLive = 0
	end
	self.params.user.emitCounter = 0
	self.params.user.emissionRate = params.maxParticles / params.particleLifespan
end

local actionUpdate = function(action, timeStep)
end

local actionComplete = function(action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
	
end

local update = function(self, timeStep)
	local function addParticle()
	
		local function createParticle(origin)
			local particle =
			{
				position = njli.btVector3(0, 0, 0),
				direction = njli.btVector3(0, 0, 0),
				startPos = njli.btVector3(0, 0, 0),
				color = njli.btVector4(0, 0, 0, 0),
				deltaColor = njli.btVector4(0, 0, 0, 0),
				rotation = 0,
				rotationDelta = 0,
				radialAcceleration = 0,
				tangentialAcceleration = 0,
				radius = 0,
				radiusDelta = 0,
				angle = 0,
				degreesPerSecond = 0,
				particleSize = 0,
				particleSizeDelta = 0,
				timeToLive = 0,
			}

			particle.position:setX(origin:x() + self.params.sourcePositionVariancex * math.random(-1, 1))
			particle.position:setY(origin:y() + self.params.sourcePositionVariancey * math.random(-1, 1))

			particle.startPos:setX(origin:x())
			particle.startPos:setY(origin:y())

			local newAngle = njli.btRadians(self.params.angle + self.params.angleVariance * math.random(-1, 1))
			local vector = njli.btVector3(math.cos(newAngle), math.sin(newAngle), 0)
			local vectorSpeed = self.params.speed + self.params.speedVariance * math.random(-1, 1)

			particle.direction = vector * vectorSpeed

			particle.timeToLive = math.max(0, self.params.particleLifespan + self.params.particleLifespanVariance * math.random(-1, 1))

			local startRadius = self.params.maxRadius + self.params.maxRadiusVariance * math.random(-1, 1)
			local endRadius = self.params.minRadius + self.params.minRadiusVariance * math.random(-1, 1)

			particle.radius = startRadius
			particle.radiusDelta = (endRadius - startRadius) / particle.timeToLive
			particle.angle = njli.btRadians(self.params.angle + self.params.angleVariance * math.random(-1, 1))
			particle.degreesPerSecond = njli.btRadians(self.params.rotatePerSecond + self.params.rotatePerSecondVariance * math.random(-1, 1))

			particle.radialAcceleration = self.params.radialAcceleration + self.params.radialAcceleration * math.random(-1, 1)
			particle.tangentialAcceleration = self.params.tangentialAcceleration + self.params.tangentialAcceleration * math.random(-1, 1)

			local particleStartSize = self.params.startParticleSize + self.params.startParticleSizeVariance * math.random(-1, 1)
			local particleFinishSize = self.params.finishParticleSize + self.params.finishParticleSizeVariance * math.random(-1, 1)
			particle.particleSizeDelta = ((particleFinishSize - particleStartSize) / particle.timeToLive)
			particle.particleSize = math.max(0, particleStartSize)

			local start = njli.btVector4(0, 0, 0, 0)
			start:setX(self.params.startColorRed   + self.params.startColorVarianceRed   * math.random(-1, 1))
			start:setY(self.params.startColorGreen + self.params.startColorVarianceGreen * math.random(-1, 1))
			start:setZ(self.params.startColorBlue  + self.params.startColorVarianceBlue  * math.random(-1, 1))
			start:setW(self.params.startColorAlpha + self.params.startColorVarianceAlpha * math.random(-1, 1))

			local finish = njli.btVector4(0, 0, 0, 0)
			finish:setX(self.params.finishColorRed   + self.params.finishColorVarianceRed   * math.random(-1, 1))
			finish:setY(self.params.finishColorGreen + self.params.finishColorVarianceGreen * math.random(-1, 1))
			finish:setZ(self.params.finishColorBlue  + self.params.finishColorVarianceBlue  * math.random(-1, 1))
			finish:setW(self.params.finishColorAlpha + self.params.finishColorVarianceAlpha * math.random(-1, 1))

			particle.color = start
			particle.deltaColor:setX((finish:x() - start:x()) / particle.timeToLive)
			particle.deltaColor:setY((finish:y() - start:y()) / particle.timeToLive)
			particle.deltaColor:setZ((finish:z() - start:z()) / particle.timeToLive)
			particle.deltaColor:setW((finish:w() - start:w()) / particle.timeToLive)

			local startA = self.params.rotationStart + self.params.rotationStartVariance * math.random(-1, 1)
			local endA = self.params.rotationEnd + self.params.rotationEndVariance * math.random(-1, 1)

			particle.rotation = startA
			particle.rotationDelta = (endA - startA) / particle.timeToLive

			particle.node = nil

			return particle
		end


		if self.params.user.particleCount == self.params.maxParticle then
			return false
		end

		local node = njli.NodeArray_getitem(self.particleNodeArray, self.params.user.particleCount)

		self.particles[self.params.user.particleCount] = createParticle(self.node:getOrigin())
		self.particles[self.params.user.particleCount].node = node

		self.params.user.particleCount = self.params.user.particleCount + 1

		return true

	end

	-- print_r(self.params)

	if self.params.user.active and self.params.user.emissionRate then
		local rate = 1.0 / self.params.user.emissionRate

		if self.params.user.particleCount < self.params.maxParticles then
			self.params.user.emitCounter = self.params.user.emitCounter + timeStep
		end

		while self.params.user.particleCount < self.params.maxParticles and self.params.user.emitCounter > rate do
			addParticle()
			print("addParticle")
			self.params.user.emitCounter = self.params.user.emitCounter - rate
		end

		self.params.user.elapsedTime = self.params.user.elapsedTime + timeStep

		if self.params.duration ~= -1 and self.params.duration < self.params.user.elapsedTime then
			self:stop()
		end
	end

	self.params.user.particleIndex = 1

	while self.params.user.active and self.params.user.particleIndex < self.params.user.particleCount do
		local currentParticle = self.particles[self.params.user.particleIndex]

		-- print_r(self.particles)

		if currentParticle then
			currentParticle.timeToLive = currentParticle.timeToLive - timeStep

			if currentParticle.timeToLive > 0 then
				if self.params.emitterType == self.ParticleTypes.ParticleTypeRadial then
					currentParticle.angle = currentParticle.angle + currentParticle.degreesPerSecond * timeStep
					currentParticle.radius = currentParticle.radius + currentParticle.radiusDelta * timeStep

					local tmp = njli.btVector3(self.node:getOrigin():x() - math.cos(currentParticle.angle) * currentParticle.radius,
												self.node:getOrigin():y() - math.sin(currentParticle.angle) * currentParticle.radius,
												0)
					currentParticle.position = tmp
				else
					local radial = njli.btVector3(0, 0, 0)
					local positionDifference = currentParticle.startPos - njli.btVector3(0, 0, 0)
					currentParticle.position = currentParticle.position - positionDifference

					if currentParticle.position:x() or currentParticle.position:y() then
						if currentParticle.position:length() ~= 0 then
							radial = currentParticle.position:normalized()
						end
					end

					local tangential = radial
					radial = radial * currentParticle.radialAcceleration

					local newy = tangential:x()
					tangential:setX(-tangential:y())
					tangential:setY(newy)
					tangential = tangential * currentParticle.tangentialAcceleration

					local tmp = njli.btVector3(0,0,0)
					tmp = ((radial + tangential) + njli.btVector3(self.params.gravityx, self.params.gravityy, 0))
					tmp = tmp * timeStep
					currentParticle.direction = currentParticle.direction + tmp
					tmp = currentParticle.direction * timeStep
					currentParticle.position = currentParticle.position + tmp

					currentParticle.position = currentParticle.position + positionDifference
				end

				currentParticle.color:setX(currentParticle.color:x() + (currentParticle.deltaColor:x() * timeStep))
				currentParticle.color:setY(currentParticle.color:y() + (currentParticle.deltaColor:y() * timeStep))
				currentParticle.color:setZ(currentParticle.color:z() + (currentParticle.deltaColor:z() * timeStep))
				currentParticle.color:setW(currentParticle.color:w() + (currentParticle.deltaColor:w() * timeStep))

				currentParticle.particleSize = currentParticle.particleSize + currentParticle.particleSizeDelta * timeStep
				currentParticle.particleSize = math.max(0, currentParticle.particleSize)

				currentParticle.rotation = currentParticle.rotation + currentParticle.rotationDelta * timeStep

				local halfSize = currentParticle.particleSize * 0.5

				local color       = njli.btVector4(0, 0, 0, 0)
				local bottomLeft  = njli.btVector2(0, 0)
				local bottomRight = njli.btVector2(0, 0)
				local topLeft     = njli.btVector2(0, 0)
				local topRight    = njli.btVector2(0, 0)

				if currentParticle.rotation then
					local x1 = -halfSize
                    local y1 = -halfSize
                    local x2 = halfSize
                    local y2 = halfSize
                    local x = currentParticle.position:x()
                    local y = currentParticle.position:y()
                    local r = njli.btRadians(currentParticle.rotation)
                    local cr = math.cos(r)
                    local sr = math.sin(r)
                    local ax = x1 * cr - y1 * sr + x
                    local ay = x1 * sr + y1 * cr + y
                    local bx = x2 * cr - y1 * sr + x
                    local by = x2 * sr + y1 * cr + y
                    local cx = x2 * cr - y2 * sr + x
                    local cy = x2 * sr + y2 * cr + y
                    local dx = x1 * cr - y2 * sr + x
                    local dy = x1 * sr + y2 * cr + y

					bottomLeft:setX(ax)
					bottomLeft:setY(ay)

					bottomRight:setX(bx)
					bottomRight:setY(by)

					topLeft:setX(dx)
					topLeft:setY(dy)

					topRight:setX(cx)
					topRight:setY(cy)
					
                    color = currentParticle.color
				else
					bottomLeft:setX(currentParticle.position:x() - halfSize)
					bottomLeft:setY(currentParticle.position:y() - halfSize)

					bottomRight:setX(currentParticle.position:x() + halfSize)
					bottomRight:setY(currentParticle.position:y() - halfSize)

					topLeft:setX(currentParticle.position:x() - halfSize)
					topLeft:setY(currentParticle.position:y() + halfSize)

					topRight:setX(currentParticle.position:x() + halfSize)
					topRight:setY(currentParticle.position:y() + halfSize)

					color = currentParticle.color
				end

				currentParticle.node:getGeometry():setColors(currentParticle.node, color)
				currentParticle.node:getGeometry():setVertexPositions(currentParticle.node, bottomLeft, bottomRight, topLeft, topRight)

				self.params.user.particleIndex = self.params.user.particleIndex + 1
			else
				if self.params.user.particleIndex ~= (self.params.user.particleCount - 1) then
					self.particles[self.params.user.particleIndex] = self.particles[self.params.user.particleCount - 1]
				end
				self.params.user.particleCount = self.params.user.particleCount - 1
			end
		end
	end
end

local exit = function(self)
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
end

local near = function(self, otherNode)
end

local touchDown = function(self, rayContact)
end

local touchUp = function(self, rayContact)
end

local touchMove = function(self, rayContact)
end

local touchCancelled = function(self, rayContact)
end

local delete = function(self)
	for i = 1, self.params.maxParticles do
		local node = njli.NodeArray_getitem(self.particleNodeArray, i)
        njli.Node.destroy(node)
	end
	njli.Node.destroyArray(self.particleNodeArray)

    for k,v in pairs(self.nodeStates) do
        njli.World.getInstance():getWorldFactory():destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    njli.World.getInstance():getWorldFactory():destroy(self.node)
    self.node = nil
end

local methods = 
{
	start = start,
	stop = stop,
	reset = reset,
    actionUpdate = actionUpdate,
    actionComplete = actionComplete,
    hide = hide,
    enter = enter,
    update = update,
    exit = exit,
    onMessage = onMessage,
    collide = collide,
    near = near,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,
    __gc = delete
}

local new = function(name, emitterJSONFile, material, geometry, shader)
    local node = njli.Node.create()
    node:setName(name)

    njli.World.getInstance():getScene():getRootNode():addChildNode(node)

    local names =
    {
        display = name,
    }
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    node:addGeometry(geometry)

    node:getStateMachine():pushState(nodeStates.display)

    local JSON = assert(loadfile(njli.ASSET_PATH("scripts/JSON.lua")))()

	local open = io.open

	local function read_file(path)
	    local file = open(path, "rb") -- r read mode and b binary mode
	    if not file then return nil end
	    local content = file:read "*a" -- *a or *all reads the whole file
	    file:close()
	    return content
	end

	local fileContent = read_file(njli.ASSET_PATH("particles/" .. emitterJSONFile))

	local params = JSON:decode(fileContent)

	
--[[
table: 0x7fe5fb40c440 {
  [minRadius] => 0
  [minRadiusVariance] => 0
  [textureImageData] => ""
  [rotationStart] => 0
  [startColorRed] => 0.8373094
  [finishColorAlpha] => 0
  [sourcePositionVariancey] => 0
  [speedVariance] => 190.79
  [maxParticles] => 500
  [finishColorRed] => 1
  [startParticleSize] => 50.95
  [particleLifespanVariance] => 0
  [startColorAlpha] => 1
  [finishColorVarianceAlpha] => 0
  [startColorVarianceGreen] => 0
  [speed] => 0
  [finishColorVarianceBlue] => 0
  [blendFuncSource] => 770
  [angle] => 244.11
  [rotationEndVariance] => 0
  [angleVariance] => 142.62
  [rotatePerSecondVariance] => 153.95
  [blendFuncDestination] => 1
  [maxRadius] => 0
  [particleLifespan] => 0.7237
  [tangentialAccelVariance] => 92.11
  [startColorGreen] => 0.3031555
  [radialAccelVariance] => 0
  [finishColorVarianceGreen] => 0
  [yCoordFlipped] => 1
  [startColorVarianceRed] => 0
  [startParticleSizeVariance] => 53.47
  [sourcePositionVariancex] => 0
  [rotationEnd] => 0
  [gravityy] => 671.05
  [tangentialAcceleration] => 144.74
  [finishParticleSizeVariance] => 64
  [duration] => -1
  [configName] => "Fire"
  [finishColorGreen] => 0.5443883
  [radialAcceleration] => 0
  [gravityx] => 0
  [startColorBlue] => 0
  [finishParticleSize] => 64
  [rotationStartVariance] => 0
  [finishColorVarianceRed] => 0
  [textureFileName] => "Fire.png"
  [absolutePosition] => false
  [emitterType] => 0
  [rotatePerSecond] => 0
  [startColorVarianceAlpha] => 1
  [maxRadiusVariance] => 72.63
  [finishColorBlue] => 0.3699196
  [startColorVarianceBlue] => 0
}
]]


	local particleNodeArray = njli.Node.createArray(params.maxParticles)
	for i = 1, params.maxParticles do
		local anode = njli.NodeArray_getitem(particleNodeArray, i)
		
		njli.World.getInstance():getScene():getRootNode():addChildNode(anode)

		anode:addGeometry(geometry)
		anode:show(njli.World.getInstance():getScene():getRootNode():getCamera())
	end

	local user =
	{
		active = false,
		particleCount = 1,
		elapsedTime = 0,
		emissionRate = params.maxParticles / params.particleLifespan,
		emitCounter = 0,
		particleIndex = 1
	}

	params.user = user

	ParticleTypes  = 
	{
		ParticleTypeGravity = bit.tobit(0x00000),
	    ParticleTypeRadial  = bit.tobit(0x00002),
	}

    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        material = material,
        geometry = geometry,
        shader = shader,

        params = params,
        particleNodeArray = particleNodeArray,
        particles = {},

        ParticleTypes = ParticleTypes,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
